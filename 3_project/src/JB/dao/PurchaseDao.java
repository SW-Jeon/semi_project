package JB.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JB.Purchase_vo.PurchaseVo;
import jdbc.JdbcUtil;

public class PurchaseDao {
	private static PurchaseDao purchasedao=new PurchaseDao();
	public static PurchaseDao getPurchasedao() {
		return purchasedao;
	}
	private PurchaseDao() {}
	
	//결제추가 메소드(insert)
	public int insert(PurchaseVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="insert into purchase values(purchase_seq.nextval,?,?,?,?,sysdate,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getOrdernum());
			pstmt.setString(2, vo.getMid());
			pstmt.setInt(3, vo.getPursumprice());
			pstmt.setString(4, vo.getPurway());
			pstmt.setInt(5, vo.getPuramount());
			pstmt.setString(6, vo.getPurstatus());
			pstmt.setString(7, vo.getPuraddr());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
	//결제취소 메소드(결제상태 update) -- 추후 결제취소/반품은 '취급상품' 테이블에다가 수량 원상복구 시켜야함!
	public int update(PurchaseVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update purchase set purstatus=? where purnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getPurstatus());
			pstmt.setInt(2, vo.getPurnum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	//결제정보 전체리스트 메소드
	public ArrayList<PurchaseVo> ListAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from purchase";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<PurchaseVo> list=new ArrayList<PurchaseVo>();
			while(rs.next()) {
				int purnum=rs.getInt("purnum");
				int ordernum=rs.getInt("ordernum");
				String mid=rs.getString("mid");
				int pursumprice=rs.getInt("pursumprice");
				String purway=rs.getString("purway");
				Date purdate=rs.getDate("purdate");
				int puramount=rs.getInt("puramount");
				String purstatus=rs.getString("purstatus");
				String puraddr=rs.getString("puraddr");
				PurchaseVo vo=new PurchaseVo(purnum, ordernum, mid, pursumprice, purway, purdate, puramount, purstatus, puraddr);
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
	//월별 결제일자 관련 메소드
	public ArrayList<PurchaseVo> ListMonth(String month){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from purchase where substr(purdate,4,2)='?'";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, month);
			rs=pstmt.executeQuery();
			ArrayList<PurchaseVo> list= new ArrayList<PurchaseVo>();
			while(rs.next()) {
				int purnum=rs.getInt("purnum");
				int ordernum=rs.getInt("ordernum");
				String mid=rs.getString("mid");
				int pursumprice=rs.getInt("pursumprice");
				String purway=rs.getString("purway");
				Date purdate=rs.getDate("purdate");
				int puramount=rs.getInt("puramount");
				String purstatus=rs.getString("purstatus");
				String puraddr=rs.getString("puraddr");
				PurchaseVo vo=new PurchaseVo(purnum, ordernum, mid, pursumprice, purway, purdate, puramount, purstatus, puraddr);
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
	//결제정보 리턴 메소드
	public PurchaseVo getInfo(int purnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from purchase where purnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, purnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int ordernum=rs.getInt("ordernum");
				String mid=rs.getString("mid");
				int pursumprice=rs.getInt("pursumprice");
				String purway=rs.getString("purway");
				Date purdate=rs.getDate("purdate");
				int puramount=rs.getInt("puramount");
				String purstatus=rs.getString("purstatus");
				String puraddr=rs.getString("puraddr");
				PurchaseVo vo=new PurchaseVo(purnum, ordernum, mid, pursumprice, purway, purdate, puramount, purstatus, puraddr);
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
	
	
	//결제정보 리턴 메소드
		public PurchaseVo getMid(String mid) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=JdbcUtil.getConn();
				String sql="select purnum from purchase where mid=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					int purnum=rs.getInt("purnum");
					int ordernum=rs.getInt("ordernum");
					int pursumprice=rs.getInt("pursumprice");
					String purway=rs.getString("purway");
					Date purdate=rs.getDate("purdate");
					int puramount=rs.getInt("puramount");
					String purstatus=rs.getString("purstatus");
					String puraddr=rs.getString("puraddr");
					PurchaseVo vo=new PurchaseVo(purnum, ordernum, mid, pursumprice, purway, purdate, puramount, purstatus, puraddr);
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
	//회원이 결제한 물품 보여주는 메소드
	/*
	public ArrayList<PurchaseVo> memList(String mid){
		
	}
	*/
}


