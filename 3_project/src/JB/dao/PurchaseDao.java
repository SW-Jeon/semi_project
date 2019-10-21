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
				String sql="select purnum,mid from purchase where mid=?";
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

	//전체정보 및 회원이 구매한 물품보내주는 메소드
	public ArrayList<PurchaseVo> buyAllList(int startRow, int endRow, String mid){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from" + 
					"(" + 
					"    select aa.*,rownum rnum from" + 
					"    (" + 
					"        select p.purnum,i.gocode,a.jnum,a.jname,i.goname,i.gocolor,i.goimg,p.mid,p.pursumprice,p.purway,p.purdate," + 
					"        p.puramount,p.purstatus,p.puraddr" + 
					"        from accessory a, inventory i, demand d, purchase p" + 
					"        where a.jnum=i.jnum and i.gocode=d.gocode and d.ordernum=p.ordernum and p.mid=?" + 
					"        order by purnum desc" + 
					"    )aa" + 
					") where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			ArrayList<PurchaseVo> list=new ArrayList<PurchaseVo>();
			while(rs.next()) {
				int purnum=rs.getInt("purnum");
				String gocode=rs.getString("gocode");
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
	//운영자가 결제정보 확인하는 메소드
	public ArrayList<PurchaseVo> buyAllList(int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from" + 
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

	public int getCount(String mid) {//회원이 구매한 물건 개수
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		con=JdbcUtil.getConn();
		String sql="select NVL(count(*),0) as maxnum from purchase where mid=?";
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

	//운영자 모드시 전체결제 갯수 받는 메소드
	public int getCount(String field,String keyword) {//회원이 구매한 물건 개수
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		con=JdbcUtil.getConn();
		String sql="select NVL(count(*),0) as maxnum from inventory i, demand d, purchase p "
				+ "where i.gocode=d.gocode and d.ordernum=p.ordernum";
		if(field!=null && !field.equals("")) {
			sql="select NVL(count(*),0) from" + 
					"(" + 
					"    select goname,mid,purway,purstatus from" + 
					"    (" + 
					"        select i.goname, d.mid,p.purway, p.purstatus" + 
					"        from inventory i, demand d, purchase p" + 
					"        where i.gocode=d.gocode and d.ordernum=p.ordernum" + 
					"    ) aa" + 
					") where "+field+" like '%"+keyword+"%'";
		}
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
	//구매확정시 구매상태 변경해주는 메소드
	public void updateOk(int purnum, String mid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update purchase set purstatus=? where mid=? and purnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "구매확정");
			pstmt.setString(2, mid);
			pstmt.setInt(3, purnum);
			pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	//구매취소시 구매상태 변경해주는 메소드
	public void updateCancel(int purnum, String mid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update purchase set purstatus=? where mid=? and purnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "구매취소");
			pstmt.setString(2, mid);
			pstmt.setInt(3, purnum);
			pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	//구매취소시 재고 테이블에 수량복구해주는 메소드
	public void backInven(String gocode, int pamount) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update inventory set pamount=pamount+? where gocode=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pamount);
			pstmt.setString(2, gocode);
			pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}








