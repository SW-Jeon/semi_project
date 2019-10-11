package SW_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SW_vo.QnAvo;
import jdbc.JdbcUtil;

public class QnAlistDao {
	private static QnAlistDao instace=new QnAlistDao();
	private QnAlistDao() {}
	public static QnAlistDao getInstance() {
		return instace;
	}

	//가장 큰 글번호 얻어오기
	public int getMaxNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select NVL(max(qaNum),0) from qa";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int qaNum=rs.getInt(1);
				return qaNum;
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
			int qaHit=0;
			String qaRecontent=null;
			String reQst=null;
			String sql="insert into qa values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, vo.getQaContent());
			pstmt.setString(3, vo.getQaName());
			pstmt.setString(4, vo.getQaPwd());
			pstmt.setString(5, qaRecontent);
			pstmt.setInt(6, qaHit);
			pstmt.setString(7, reQst);
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
				sql="select * from (" +
						"  select aa.*,rownum rnum from (" +
						"  select * from qa order by qaNum desc )aa" +
						")where rnum>=? and rnum<=?";
			}else {	//검색조건이 있는 경우
				sql="select * from (" + 
						"   select aa.*,rownum rnum from (" + 
						"   select * from qa where " + field + " like '%" + keyword +"%'" + 
						"	 order by qaNum desc  )aa" + 
						")where rnum>=? and  rnum<=?";
			}
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<QnAvo> QnAlist=new ArrayList<QnAvo>();
			while(rs.next()) {
				int qaNum=rs.getInt("qaNum");
				String qaContent=rs.getString("qaContent");
				String qaName=rs.getString("qaName");
				String qaPwd =rs.getString("qaPwd ");
				String qaRecontent=rs.getString("qaRecontent");
				int qaHit=rs.getInt("qaHit");
				String reQst=rs.getString("reQst");
				QnAvo vo=new QnAvo(qaNum, qaContent, qaName, qaPwd, qaRecontent, qaHit, reQst);
				QnAlist.add(vo);
			}
			return QnAlist;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,null);
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
	public void addHit(int qaNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update qa set qaHit=qaHit+1 where qaNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qaNum);
			pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}

	//글 상세내용
	public QnAvo detail(int qaNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select *from qa where qaNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qaNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String qaContent=rs.getString("qaContent");
				String qaName=rs.getString("qaName");
				String qaPwd =rs.getString("qaPwd ");
				String qaRecontent=rs.getString("qaRecontent");
				int qaHit=rs.getInt("qaHit");
				String reQst=rs.getString("reQst");
				QnAvo vo=new QnAvo(qaNum, qaContent, qaName, qaPwd, qaRecontent, qaHit, reQst);
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
	public int delete(int qaNum,String qaPwd) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=JdbcUtil.getConn();
            String sql="delete from qa where qaNum=? and qaPwd=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1,qaNum);
        	pstmt.setString(2, qaPwd);
            return pstmt.executeUpdate();
        }catch(SQLException se) {
            se.printStackTrace();
            return -1;
        }finally {
        	JdbcUtil.close(con, pstmt, null);
		}
	}
}
