package SH.Inventory_Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SH.Inventory_Vo.InventoryVo;
import jdbc.JdbcUtil;


public class InventoryDao {
	
	public int getCount(int jnum,String keyword,int level) {//작성된 글의 개수
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select NVL(count(*),0) as maxnum from inventory";
			if(jnum!=0 ) {//리스트
				sql +=" where jnum="+jnum+" and gocolor like'%"+keyword+"%'";
				if(level==0) {
					sql +=" order by jnum desc";
				}else if(level==1) {
					sql +=" order by goprice desc"; 
				}else if(level==2) {
					sql +=" order by goprice asc";
				}
			}else {//검색
				sql +=" where jnum>all("+jnum+") and gocolor like '%"+keyword+"%'";						
			}
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
	
	
	public ArrayList<InventoryVo> list(int startRow, int endRow, int jnum,int level){//페이징처리,검색
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="";
			if(level==0) {		
				 sql="select * from" + 
						"	(" + 
						"		select aa.*,rownum rnum from" +
						"		(" + 
						"		select * from inventory where jnum=" + jnum +			
						"		order by jnum desc" +
						"		)aa" + 
						"	)where rnum>=? and rnum<=?";
			}else if(level==1) {
				sql="select * from" + 
						"	(" + 
						"		select aa.*,rownum rnum from" +
						"		(" + 
						"		select * from inventory where jnum=" + jnum +			
						"		order by goprice desc" +
						"		)aa" + 
						"	)where rnum>=? and rnum<=?";
			}else if(level==2) {
				sql="select * from" + 
						"	(" + 
						"		select aa.*,rownum rnum from" +
						"		(" + 
						"		select * from inventory where jnum=" + jnum +			
						"		order by goprice asc" +
						"		)aa" + 
						"	)where rnum>=? and rnum<=?";
			}
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
	
	public ArrayList<InventoryVo>  serchList(int startRow, int endRow,int jnum, String keyword){//검색한거
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="";
			if(jnum!=0) {
				sql="select * from" + 
					"(" + 
					"select aa.*,rownum rnum from" + 
					"(" + 
					"select * from inventory" + 
					" where jnum="+jnum+" and gocolor like'%"+keyword+"%'" + 
					" order by jnum desc" + 
					")aa" + 
					")where rnum>=? and rnum<=?";
			}else {
				sql="select * from" + 
						"(" + 
						"select aa.*,rownum rnum from" + 
						"(" + 
						"select * from inventory" + 
						" where jnum>all(" + jnum + ") and gocolor like'%"+keyword+"%'" + 
						" order by jnum desc" + 
						")aa" + 
						")where rnum>=? and rnum<=?";
			}
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			rs=pstmt.executeQuery();
			ArrayList<InventoryVo> list=new ArrayList<InventoryVo>();
			while(rs.next()) {
				InventoryVo vo=new InventoryVo(rs.getString("gocode"),
						rs.getString("goname"),
						rs.getInt("goprice"),
						rs.getString("gocolor"),
						rs.getString("goimg"),
						rs.getInt("pamount"),
						rs.getInt("jnum"),
						rs.getString("adminid"));
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
