package KH.Mem_Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import KH.MEM_Vo.Mem_Vo;
import javafx.geometry.VPos;
import jdbc.JdbcUtil;

public class Mem_Dao {
	private static Mem_Dao mem_dao = new Mem_Dao();

	private Mem_Dao() {
	}

	public static Mem_Dao getMem_Dao() {
		return mem_dao;
	}

	// 회원가입
	public int insert(Mem_Vo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int mdelup = 1;
		try {
			con = JdbcUtil.getConn();
			String sql = "insert into mem values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMname());
			pstmt.setString(3, vo.getMpwd());
			pstmt.setString(4, vo.getMemail());
			pstmt.setString(5, vo.getMaddr());
			pstmt.setString(6, vo.getMphone());
			pstmt.setString(7, vo.getMgen());
			pstmt.setInt(8, mdelup);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);

		}
	}

	// 로그인
	public boolean isMember(String mid, String mpwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JdbcUtil.getConn();
			String sql = "select * from mem where mid=? and mpwd=?"; // 컬럼명이랑 동일해야함
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
			return false;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return false;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}

	// 회원정보 수정
	public int update(Mem_Vo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = JdbcUtil.getConn();
			String sql = "update mem set mpwd=?, memail=? where mid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getMpwd());
			pstmt.setString(2, vo.getMemail());
			pstmt.setString(3, vo.getMid());
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());

			}
		}
	}

	// 회원정보 조회
	public Mem_Vo select(String mid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JdbcUtil.getConn();
			String sql = "select * from mem where mid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String mname = rs.getString("mname");
				String mpwd = rs.getString("mpwd");
				String memail = rs.getString("memail");
				String maddr = rs.getString("maddr");
				String mphone = rs.getString("mphone");
				String mgen = rs.getString("mgen");
				Mem_Vo vo = new Mem_Vo(mid, mname, mpwd, memail, maddr, mphone, mgen, 0);
				return vo;
			}
			return null;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
			}
		}
	}
}
