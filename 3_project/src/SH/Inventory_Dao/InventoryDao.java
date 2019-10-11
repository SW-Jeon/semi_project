package SH.Inventory_Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SH.Inventory_Vo.InventoryVo;
import jdbc.JdbcUtil;


public class InventoryDao {
	public int getCount() {//작성된 글의 개수
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		con=JdbcUtil.getConn();
		String sql="select NVL(count(jnum),0) as maxnum from inventory where jnum=100";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			int num=rs.getInt(1);//컬럼순서 
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
	
	
	public ArrayList<InventoryVo> list(int startRow, int endRow, int jnum){//페이징처리
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from" + 
					"(" + 
					"	select aa.*,rownum rnum from" + 
					"	(" + 
					"		select * from inventory where jnum="+jnum  
					+ "	)aa" + 
					")where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<InventoryVo> list=new ArrayList<InventoryVo>();
			while(rs.next()) {
				String gocode=rs.getString("gocode");
				String goname=rs.getString("goname");
				int goprice=rs.getInt("goprice");
				String gocolor=rs.getString("gocolor");
				String goimg=rs.getString("goimg");
				int pamount=rs.getInt("pamount");
				String adminid=rs.getString("adminid");		
				InventoryVo vo=new InventoryVo(gocode,goname,goprice,gocolor,goimg,pamount,jnum,adminid);
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
	public InventoryVo detail(String gocode) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from inventory where gocode=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, gocode);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String goname=rs.getString("goname");
				int goprice=rs.getInt("goprice");
				String gocolor=rs.getString("gocolor");
				String goimg=rs.getString("goimg");
				int pamount=rs.getInt("pamount");
				int jnum=rs.getInt("jnum");
				String adminid=rs.getString("adminid");		
				InventoryVo vo=new InventoryVo(gocode,goname,goprice,gocolor,goimg,pamount,jnum,adminid);
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
