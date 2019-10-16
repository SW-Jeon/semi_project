package SW_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SW_vo.QnAvo;
import jdbc.JdbcUtil;

public class QnAlistDao {
	private static QnAlistDao qnalistdao=new QnAlistDao();
	private QnAlistDao() {}
	public static QnAlistDao getInstance() {
		return qnalistdao;
	}

	//가장 큰 글번호 얻어오기
	public int getMaxNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select NVL(max(qanum),0) from qa";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int qanum=rs.getInt(1);
				return qanum;
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
	public int insert(QnAvo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			int boardNum=getMaxNum()+1;
			//int qahit=0;
			String qarecontent=null;
			String sql="insert into qa values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, vo.getQacontent());
			pstmt.setString(3, vo.getQaname());
			pstmt.setString(4, vo.getQapwd());
			pstmt.setString(5, qarecontent);
			pstmt.setInt(6, vo.getQahit());
			pstmt.setString(7, vo.getReqst());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}

	//글목록 확인
	public ArrayList<QnAvo> QnAlist(int startRow,int endRow,String field, String keyword){
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
						"            select * from qa order by qanum desc" + 
						"        )aa" + 
						")where rnum>=? and  rnum<=?";
				}else {		//검색조건이 있는 경우
					sql="select * from " + 
						"(" + 
						"   select aa.*,rownum rnum from" + 
						"    (" + 
						"        select * from qa " + 
						"	     where " + field + " like '%" + keyword +"%'" + 
						"	     order by qanum desc " + 
						"     )aa" + 
						")where rnum>=? and  rnum<=?";
				}
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<QnAvo> QnAlist=new ArrayList<QnAvo>();
			while(rs.next()) {
				int qanum=rs.getInt(1);
				String qacontent=rs.getString(2);
				String qaname=rs.getString(3);
				String qapwd =rs.getString(4);
				String qarecontent=rs.getString(5);
				int qahit=rs.getInt(6);
				String reqst=rs.getString(7);
				QnAvo vo=new QnAvo(qanum, qacontent, qaname, qapwd, qarecontent, qahit, reqst);
				QnAlist.add(vo);
			}
			return QnAlist;
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
			String sql="select NVL(count(*),0) from qa";
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
	public void addHit(int qanum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update qa set qahit=qahit+1 where qanum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qanum);
			pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}

	//글 상세내용
	public QnAvo detail(int qanum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select *from qa where qanum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qanum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String qacontent=rs.getString(2);
				String qaname=rs.getString(3);
				String qapwd =rs.getString(4);
				String qarecontent=rs.getString(5);
				int qahit=rs.getInt(6);
				String reqst=rs.getString(7);
				QnAvo vo=new QnAvo(qanum, qacontent, qaname, qapwd, qarecontent, qahit, reqst);
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
	public int delete(int qanum,String qapwd) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=JdbcUtil.getConn();
            String sql="delete from qa where qanum=? and qapwd=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1,qanum);
        	pstmt.setString(2, qapwd);
            return pstmt.executeUpdate();
        }catch(SQLException se) {
            se.printStackTrace();
            return -1;
        }finally {
        	JdbcUtil.close(con, pstmt, null);
		}
	}
	
	//QnA수정
    public int update(QnAvo vo) {
    	Connection con=null;
    	PreparedStatement pstmt=null;
    	try {
    		con=JdbcUtil.getConn();
    		String sql="update qa set qaname=?,qacontent=?,qapwd=? where qanum=?";
    		pstmt=con.prepareStatement(sql);
    		pstmt.setString(1, vo.getQaname());
    		pstmt.setString(2, vo.getQacontent());
    		pstmt.setString(3, vo.getQapwd());
    		pstmt.setInt(4, vo.getQanum());
    		return pstmt.executeUpdate();
    	}catch(SQLException se){
    		se.printStackTrace();
    		return -1;
    	}finally {
    		JdbcUtil.close(con, pstmt, null);
    	}
    }
    
    //qna 수정을 위한 멤버선택
    public QnAvo getInfo(int qanum) {
    	Connection con=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	try {
    		con=JdbcUtil.getConn();
    		String sql="select * from qa whrer qanum=?";
    		pstmt=con.prepareStatement(sql);
    		pstmt.setInt(1, qanum);
    		rs=pstmt.executeQuery();
    		if(rs.next()) {
				String qacontent=rs.getString(2);
				String qaname=rs.getString(3);
				String qapwd=rs.getString(4);
				String qarecontent=rs.getString(5);
				int qahit=rs.getInt(6);
				String reqst=rs.getString(7);
				QnAvo vo=new QnAvo(qanum, qacontent, qaname, qapwd, qarecontent, qahit, reqst);
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
    
	
	//답글 달기
    public int reDab(QnAvo vo) {
    	Connection con=null;
    	PreparedStatement pstmt=null;
    	String sql="update qa set qarecontent=? and reqst=? where qanum=?";
    	try { 
    		con=JdbcUtil.getConn();
    		pstmt=con.prepareStatement(sql);
    		pstmt.setString(1, vo.getQacontent());
    		pstmt.setString(2, vo.getReqst());
    		pstmt.setInt(3, vo.getQanum());
    		return pstmt.executeUpdate();
    	}catch(SQLException se){
    		se.printStackTrace();
    		return -1;
    	}finally {
    		JdbcUtil.close(con, pstmt, null);
    	}
    }
    
    
}
