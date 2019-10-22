package JB.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JB.Purchase_vo.PurchaseVo;
import jdbc.JdbcUtil;

public class PurchaseAdDao {
	private static PurchaseAdDao instance=new PurchaseAdDao();
	private PurchaseAdDao() {}
	public static PurchaseAdDao getInstance() {
		return instance;
	}
	//운영자 모드시 검색모드 리스트 메소드
	public ArrayList<PurchaseVo> searchList(int startRow,int endRow,String field,String keyword){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="";
			if(field==null || keyword.equals("") || keyword==null || field.equals("")) {
				sql="select * from" + 
					"(" + 
					"    select aa.*,rownum rnum from" + 
					"    (" + 
					"        select p.purnum,i.gocode,a.jnum,a.jname,i.goname,i.gocolor,i.goimg,p.mid,p.pursumprice,p.purway,p.purdate," + 
					"        p.puramount,p.purstatus,p.puraddr" + 
					"        from accessory a, inventory i, demand d, purchase p" + 
					"        where a.jnum=i.jnum and i.gocode=d.gocode and d.ordernum=p.ordernum " +
					"        order by purnum desc" + 
					"    )aa" + 
					") where rnum>=? and rnum<=?";
			}else { //검색조건 있는경우
				sql="select * from" + 
						"(" + 
						"    select aa.*,rownum rnum from" + 
						"    (" + 
						"        select p.purnum,i.gocode,a.jnum,a.jname,i.goname,i.gocolor,i.goimg,p.mid,p.pursumprice,p.purway,p.purdate," + 
						"        p.puramount,p.purstatus,p.puraddr" + 
						"        from accessory a, inventory i, demand d, purchase p" + 
						"        where a.jnum=i.jnum and i.gocode=d.gocode and d.ordernum=p.ordernum " +  
						"        order by purnum desc" + 
						"    )aa where "+field+ " like '%" +keyword+"%' "+
						") where rnum>=? and rnum<=?";
			}
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<PurchaseVo> list=new ArrayList<PurchaseVo>();
			while(rs.next()) {
				int purnum=rs.getInt("purnum");
				String gocode=rs.getString("gocode");
				String mid=rs.getString("mid");
				String goname=rs.getString("goname");
				String gocolor=rs.getString("gocolor");
				int jnum=rs.getInt("jnum");
				String jname=rs.getString("jname");
				String goimg=rs.getString("goimg");
				String pursumprice=String.format("%,d", rs.getInt("pursumprice"));
				String purway=rs.getString("purway");
				Date purdate=rs.getDate("purdate");
				int puramount=rs.getInt("puramount");
				String purstatus=rs.getString("purstatus");
				String puraddr=rs.getString("puraddr");
				PurchaseVo vo=new PurchaseVo(purnum, 0, mid, pursumprice, purway, purdate, 
						puramount, purstatus, puraddr, gocode, goname, gocolor, goimg, jnum, jname);
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
	//월별 결제일자 관련 메소드
	public int sumPriceMonth(int month){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select sum(pursumprice) from purchase where substr(purdate,4,2)=? and purstatus='구매확정'";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, month);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int sum=rs.getInt(1);
				return sum;
			}
			return -1;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	//일별 전체 매출액 메소드
	public int sumPriceDay(int day) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select sum(pursumprice) from purchase where substr(purdate,7,2)=? and purstatus='구매확정'";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, day);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int sumday=rs.getInt(1);
				return sumday;
			}
			return 0;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}






