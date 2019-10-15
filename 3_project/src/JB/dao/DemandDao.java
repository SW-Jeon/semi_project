package JB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JB.Demand_vo.DemandVo;
import jdbc.JdbcUtil;

public class DemandDao {
	private static DemandDao demandDao=new DemandDao();
	public static DemandDao getDemandDao() {
		return demandDao;
	}
	private DemandDao() {}
	
	//주문추가 메소드(insert)
	public int insert(DemandVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="insert into values(demand_seq.nextval,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getGocode());
			pstmt.setInt(3, vo.getOrderamount());
			pstmt.setInt(4, vo.getOrderprice());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
	//주문취소 메소드(삭제)
	public int delete(int ordernum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="delete from demand where ordernum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ordernum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
	//주문수정 메소드(update)
	public int update(DemandVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update demand set gocode=?,orderamount=?,orderprice=? where ordernum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getGocode());
			pstmt.setInt(2, vo.getOrderamount());
			pstmt.setInt(3, vo.getOrderprice());
			pstmt.setInt(4, vo.getOrdernum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
	//모든 주문정보 리스트 메소드(select)
	public ArrayList<DemandVo> ListAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from demand";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<DemandVo> list=new ArrayList<DemandVo>();
			while(rs.next()) {
				int ordernum=rs.getInt("ordernum");
				String mid=rs.getString("mid");
				String gocode=rs.getString("gocode");
				int orderamount=rs.getInt("orderamount");
				int orderprice=rs.getInt("orderprice");
				DemandVo vo=new DemandVo(ordernum, mid, gocode, orderamount, orderprice);
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
	//주문정보에 대한 메소드
	public DemandVo getInfo(int ordernum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from where ordernum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ordernum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String mid=rs.getString("mid");
				String gocode=rs.getString("gocode");
				int orderamount=rs.getInt("orderamount");
				int orderprice=rs.getInt("orderprice");
				DemandVo vo=new DemandVo(ordernum, mid, gocode, orderamount, orderprice);
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
	
}











