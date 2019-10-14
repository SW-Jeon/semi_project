package SH.Info_Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SH.Info_Vo.InfoVo;
import jdbc.JdbcUtil;

public class InfoDao {
	public int getCount() {//작성된 글의 개수
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		con=JdbcUtil.getConn();
		String sql="select NVL(count(infonum),0) as maxnum from info";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
			if(rs.next()) {
				int infonum=rs.getInt(1);//컬럼순서 
				return infonum;
			}else {
				return 0;
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}

public int getMaxNum() {//가장 큰 글번호 얻어오기
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select NVL(max(infonum),0) as maxnum from info";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int num=rs.getInt("maxnum");//알리아스로.
				return num;
			}else {
				return 0;
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int insert(InfoVo vo) {//글 등록
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			int boardNum=getMaxNum()+1;
			con=JdbcUtil.getConn();
			String sql="insert into info values(?,?,?,'admin')";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, vo.getInfotitle());
			pstmt.setString(3, vo.getInfocontent());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int update(InfoVo vo) {//수정
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update info set infotitle=?,infocontent=? where adminid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getInfotitle() );
			pstmt.setString(2, vo.getInfocontent());
			pstmt.setString(3, vo.getAdminid());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int delete(int infonum) {//삭제
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="delete from info where infonum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, infonum);
			return pstmt.executeUpdate();			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public InfoVo detail(int infonum) {//상세
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from info where infonum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, infonum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String infotitle=rs.getString("infotitle");
				String infocontent=rs.getString("infocontent");
				String adminid=rs.getString("adminid");
				InfoVo vo=new InfoVo(infonum,infotitle,infocontent,adminid);
				return vo;
			}
			return null;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public ArrayList<InfoVo> list() {//전체 리스트 최신이 위로오게.
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from info order by infonum desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<InfoVo> list=new ArrayList<InfoVo>();
			while(rs.next()) {
				int infonum=rs.getInt("infonum");
				String infotitle=rs.getString("infotitle");
				String infocontent=rs.getString("infocontent");
				String adminid=rs.getString("adminid");
				InfoVo vo=new InfoVo(infonum,infotitle,infocontent,adminid);
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
