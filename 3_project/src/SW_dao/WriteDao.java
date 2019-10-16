package SW_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SW_vo.QnAvo;
import SW_vo.WriteVo;
import jdbc.JdbcUtil;

public class WriteDao {
	private static WriteDao instace=new WriteDao();
	private WriteDao() {}
	public static WriteDao getInstance() {
		return instace;
	}
	
	//가장 큰 글번호 얻어오기
		public int getMaxNum() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=JdbcUtil.getConn();
				String sql="select NVL(max(writenum),0) from write";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					int writenum=rs.getInt(1);
					return writenum;
				}
				return 0;
			}catch(SQLException se) {
				se.printStackTrace();
				return -1;
			}finally {
				JdbcUtil.close(con, pstmt, rs);
			}
		}
		
		//글쓰기
		public int insert(WriteVo vo) {
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				con=JdbcUtil.getConn();
				int boardNum=getMaxNum()+1;
				String rewrite=null;
				String rewst=null;
				String sql="insert into write values(?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, boardNum);
				pstmt.setString(2, vo.getMid());
				pstmt.setString(3, vo.getTitle());
				pstmt.setString(4, vo.getWritecontent());
				pstmt.setString(5, rewrite);
				pstmt.setString(6, rewst);
				return pstmt.executeUpdate();
			}catch(SQLException se) {
				se.printStackTrace();
				return -1;
			}finally {
				JdbcUtil.close(con, pstmt, null);
			}
		}
		
		//글목록 확인
		public ArrayList<WriteVo> Wlist(int startRow,int endRow,String field, String keyword){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="";
			if(field==null || field.equals("")) {	//검색조건이 없는 경우
				sql="select * from" + 		
						"    (" + 
						"        select aa.*,rownum rnum from" + 
						"        (" + 
						"            select * from write order by writenum desc" + 
						"        )aa" + 
						")where rnum>=? and  rnum<=?";
				}else {		//검색조건이 있는 경우
					sql="select * from " + 
						"(" + 
						"   select aa.*,rownum rnum from" + 
						"    (" + 
						"        select * from write " + 
						"	     where " + field + " like '%" + keyword +"%'" + 
						"	     order by writenum desc " + 
						"     )aa" + 
						")where rnum>=? and  rnum<=?";
				}
			System.out.println(sql);
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<WriteVo> Wlist=new ArrayList<WriteVo>();
			while(rs.next()) {
				int writenum=rs.getInt(1);
				String mid=rs.getString(2);
				String title=rs.getString(3);
				String writecontent=rs.getString(4);
				String rewrite=rs.getString(5);
				String rewst=rs.getString(6);
				WriteVo vo=new WriteVo(writenum, mid, title, writecontent, rewrite, rewst);
				Wlist.add(vo);
			}
			return Wlist;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
	
		//전체글의 갯수
		public int getCount(String field,String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=JdbcUtil.getConn();
				String sql="select NVL(count(*),0) from write";
				if(field!=null && !field.equals("")) {
					sql+=" where " + field + " like '%" + keyword + "%'";
				}
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					int cnt=rs.getInt(1);
					System.out.println("cnt:"+cnt);
					return cnt;
				}
				return 0;
			}catch(SQLException se) {
				se.printStackTrace();
				return -1;
			}finally {
				JdbcUtil.close(con, pstmt, rs);
			}
		}
		
		//글 상세내용
		public WriteVo detail(int writenum) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=JdbcUtil.getConn();
				String sql="select *from write where writenum=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, writenum);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					String mid=rs.getString(1);
					String title=rs.getString(2);
					String writecontent=rs.getString(3);
					String rewrite=rs.getString(4);
					String rewst=rs.getString(5);
					WriteVo vo=new WriteVo(writenum, mid, title, writecontent, rewrite, rewst);
					return vo;
				}
				return null;
			}catch(SQLException se) {
				se.printStackTrace();
				return null;
			}finally {
				JdbcUtil.close(con, pstmt, rs);
			}
		}
		
		//글삭제
		public int delete(int writenum,String mid) {
	        Connection con=null;
	        PreparedStatement pstmt=null;
	        try {
	            con=JdbcUtil.getConn();
	            String sql="delete from write where writenum=? and mid=?";
	            pstmt=con.prepareStatement(sql);
	            pstmt.setInt(1,writenum);
	        	pstmt.setString(2, mid);
	            return pstmt.executeUpdate();
	        }catch(SQLException se) {
	            se.printStackTrace();
	            return -1;
	        }finally {
	        	JdbcUtil.close(con, pstmt, null);
			}
		}
		
		//답글 달기
	    public int reDab(WriteVo vo) {
	    	Connection con=null;
	    	PreparedStatement pstmt=null;
	    	String sql="update write set rewrite=? and rewst=? where writenum=?";
	    	try { 
	    		con=JdbcUtil.getConn();
	    		pstmt=con.prepareStatement(sql);
	    		pstmt.setString(1, vo.getRewrite());
	    		pstmt.setString(2, vo.getRewst());
	    		pstmt.setInt(3, vo.getWritenum());
	    		return pstmt.executeUpdate();
	    	}catch(SQLException se){
	    		se.printStackTrace();
	    		return -1;
	    	}finally {
	    		JdbcUtil.close(con, pstmt, null);
	    	}
	    }
	    
	    //글 수정을 위한 멤버선택
	    public WriteVo getInfo(String mid) {
	    	Connection con=null;
	    	PreparedStatement pstmt=null;
	    	ResultSet rs=null;
	    	try {
	    		con=JdbcUtil.getConn();
	    		String sql="select * from write whrer mid=?";
	    		pstmt=con.prepareStatement(sql);
	    		pstmt.setString(1, mid);
	    		rs=pstmt.executeQuery();
	    		if(rs.next()) {
	    			String title=rs.getString(1);
					String writecontent=rs.getString(2);
					String rewrite=rs.getString(3);
					String rewst=rs.getString(4);
					WriteVo vo=new WriteVo(0, mid, title, writecontent, rewrite, rewst);
	    			return vo;
				}
				return null;
	    	}catch(SQLException se) {
	    		se.printStackTrace();
	    		return null;
	    	}finally {
	    		JdbcUtil.close(con, pstmt, rs);
			}
		}
}
