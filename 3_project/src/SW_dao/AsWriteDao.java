package SW_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SW_vo.AsWriteVo;
import jdbc.JdbcUtil;

public class AsWriteDao {
	private static AsWriteDao reviewdao=new AsWriteDao();
	private AsWriteDao() {}
	public static AsWriteDao getInstance() {
		return reviewdao;
	}

	//가장 큰 글번호 얻어오기
		public int getMaxNum() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=JdbcUtil.getConn();
				String sql="select NVL(max(asnum),0) from aswrite";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					int asnum=rs.getInt(1);
					return asnum;
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
		public int insert(AsWriteVo vo) {
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				con=JdbcUtil.getConn();
				int boardNum=getMaxNum()+1;
				int ashit=0;
				String asimg=null;
				String sql="insert into aswrite values(?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, boardNum);
				pstmt.setString(2, asimg);
				pstmt.setString(3, vo.getAstitle());
				pstmt.setString(4, vo.getAscontent());
				pstmt.setString(5, vo.getMid());
				pstmt.setString(6, vo.getGocode());
				pstmt.setInt(7, vo.getPurnum());
				pstmt.setInt(8, ashit);
				return pstmt.executeUpdate();
			}catch(SQLException se) {
				se.printStackTrace();
				return -1;
			}finally {
				JdbcUtil.close(con, pstmt, null);
			}
		}
		
		//글목록 확인
		public ArrayList<AsWriteVo> Rlist(int startRow,int endRow,String field, String keyword){
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
							"            select * from aswrite order by asnum desc" + 
							"        )aa" + 
							")where rnum>=? and  rnum<=?";
					}else {		//검색조건이 있는 경우
						sql="select * from " + 
							"(" + 
							"   select aa.*,rownum rnum from" + 
							"    (" + 
							"        select * from aswrite " + 
							"	     where " + field + " like '%" + keyword +"%'" + 
							"	     order by asnum desc " + 
							"     )aa" + 
							")where rnum>=? and  rnum<=?";
					}
				
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				ArrayList<AsWriteVo> Rlist=new ArrayList<AsWriteVo>();
				while(rs.next()) {
					int asnum=rs.getInt(1);
					String asimg=rs.getString(2);
					String astitle=rs.getString(3);
					String ascontent=rs.getString(4);
					String mid=rs.getString(5);
					String gocode=rs.getString(6);
					int purnum=rs.getInt(7);
					int ashit=rs.getInt(8);
					AsWriteVo vo=new AsWriteVo(asnum, asimg, astitle, ascontent, mid, gocode, purnum, ashit);
							Rlist.add(vo);
				}
				return Rlist;
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
				String sql="select NVL(count(*),0) from aswrite";
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

		//조회수 업데이트 메소드
		public void addHit(int asnum) {
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				con=JdbcUtil.getConn();
				String sql="update aswrite set ashit=ashit+1 where asnum=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, asnum);
				pstmt.executeUpdate();
			}catch(SQLException se) {
				se.printStackTrace();
			}finally {
				JdbcUtil.close(con, pstmt, null);
			}
		}

		//글 상세내용
		public AsWriteVo detail(int asnum) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=JdbcUtil.getConn();
				String sql="select *from aswrite where asnum=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, asnum);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					String asimg=rs.getString(2);
					String astitle=rs.getString(3);
					String ascontent=rs.getString(4);
					String mid=rs.getString(5);
					String gocode=rs.getString(6);
					int purnum=rs.getInt(7);
					int ashit=rs.getInt(8);
					AsWriteVo vo=new AsWriteVo(asnum, asimg, astitle, ascontent, mid, gocode, purnum, ashit); 
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
		public int delete(int asnum) {
	        Connection con=null;
	        PreparedStatement pstmt=null;
	        try {
	            con=JdbcUtil.getConn();
	            String sql="delete from aswrite where asnum=? ";
	            pstmt=con.prepareStatement(sql);
	            pstmt.setInt(1,asnum);
	            return pstmt.executeUpdate();
	        }catch(SQLException se) {
	            se.printStackTrace();
	            return -1;
	        }finally {
	        	JdbcUtil.close(con, pstmt, null);
			}
		}
		
		//후기수정
	    public int update(AsWriteVo vo) {
	    	Connection con=null;
	    	PreparedStatement pstmt=null;
	    	try {
	    		con=JdbcUtil.getConn();
	    		String sql="update aswrite set asimg=?,astitle=?,ascontent=? where asnum=?";
	    		pstmt=con.prepareStatement(sql);
	    		pstmt.setString(1, vo.getAsimg());
	    		pstmt.setString(2, vo.getAstitle());
	    		pstmt.setString(3, vo.getAscontent());
	    		pstmt.setInt(4, vo.getAsnum());
	    		return pstmt.executeUpdate();
	    	}catch(SQLException se){
	    		se.printStackTrace();
	    		return -1;
	    	}finally {
	    		JdbcUtil.close(con, pstmt, null);
	    	}
	    }
	    
	    //후기수정을 위한 멤버선택
	    public AsWriteVo getInfo(int asnum) {
	    	Connection con=null;
	    	PreparedStatement pstmt=null;
	    	ResultSet rs=null;
	    	try {
	    		con=JdbcUtil.getConn();
	    		String sql="select * from aswrite where asnum=?";
	    		pstmt=con.prepareStatement(sql);
	    		pstmt.setInt(1, asnum);
	    		rs=pstmt.executeQuery();
	    		if(rs.next()) {
					String asimg=rs.getString(2);
					String astitle=rs.getString(3);
					String ascontent=rs.getString(4);
					String mid=rs.getString(5);
					String gocode=rs.getString(6);
					int purnum=rs.getInt(7);
					int ashit=rs.getInt(8);
					AsWriteVo vo=new AsWriteVo(asnum, asimg, astitle, ascontent, mid, gocode, purnum, ashit); 
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
