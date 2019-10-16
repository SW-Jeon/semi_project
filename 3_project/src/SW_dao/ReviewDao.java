package SW_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import SW_vo.AsWriteVo;
import SW_vo.QnAvo;
import jdbc.JdbcUtil;

public class ReviewDao {
	private static ReviewDao reviewdao=new ReviewDao();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
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
				String qarecontent=null;
				String reqst="대기중";
				String sql="insert into qa values(?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, boardNum);
				pstmt.setString(2, vo.getQacontent());
				pstmt.setString(3, vo.getQaname());
				pstmt.setString(4, vo.getQapwd());
				pstmt.setString(5, qarecontent);
				pstmt.setInt(6, qahit);
				pstmt.setString(7, reqst);
				return pstmt.executeUpdate();
			}catch(SQLException se) {
				se.printStackTrace();
				return -1;
			}finally {
				JdbcUtil.close(con, pstmt, null);
			}
		}
	
}
