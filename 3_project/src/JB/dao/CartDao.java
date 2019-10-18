package JB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JB.Cart_Vo.CartVo;
import jdbc.JdbcUtil;

public class CartDao {
	private static CartDao instance=new CartDao();
	public static CartDao getInstance() {
		return instance;
	}
	private CartDao() {}
	//카트정보 저장해주는 메소드
	public void insert(CartVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="insert into cart values(cart_seq.nextval,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getCartname());
			pstmt.setString(2, vo.getCartimg());
			pstmt.setString(3, vo.getMid());
			pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	//장바구니 삭제해주는 메소드
	public void delete(int cartnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="delete from cart where cartnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cartnum);
			pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int getCount(String mid) {//작성된 글의 개수
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		con=JdbcUtil.getConn();
		String sql="select NVL(count(infonum),0) as maxnum from cart where mid=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, mid);
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
	//회원의 장바구니 리스트 가져오는 메소드
	public ArrayList<CartVo> list(int startRow, int endRow, String mid){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from\r\n" + 
					"(\r\n" + 
					"	select aa.*,rownum rnum from\r\n" + 
					"	(\r\n" + 
					"		select * from cart where mid=?\r\n" + 
					"		order by cartnum desc\r\n" + 
					"	)aa\r\n" + 
					") where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			ArrayList<CartVo> list=new ArrayList<CartVo>();
			while(rs.next()) {
				int cartnum=rs.getInt("cartnum");
				String cartname=rs.getString("cartname");
				String cartimg=rs.getString("cartimg");
				CartVo vo=new CartVo(cartnum, cartname, cartimg, mid);
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


















