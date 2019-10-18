package JB.Purchase_vo;

import java.sql.Date;

public class PurchaseVo {
	private int purnum; //결제번호
	private int ordernum; //주문번호
	private String mid; //회원 아이디
	private int pursumprice; //총 결제가격
	private String purway; //결제수단
	private Date purdate; //결제일자
	private int puramount; //결제수량
	private String purstatus; //결제상태
	private String puraddr; //배송지
	private String gocode; //물품코드
	
	public PurchaseVo() {}
	public PurchaseVo(int purnum, int ordernum, String mid, int pursumprice, String purway, Date purdate, int puramount,
			String purstatus, String puraddr) {
		super();
		this.purnum = purnum;
		this.ordernum = ordernum;
		this.mid = mid;
		this.pursumprice = pursumprice;
		this.purway = purway;
		this.purdate = purdate;
		this.puramount = puramount;
		this.purstatus = purstatus;
		this.puraddr = puraddr;
	}
	public PurchaseVo(int purnum, int ordernum, String mid, int pursumprice, String purway, Date purdate, int puramount,
			String purstatus, String puraddr,String gocode) {
		super();
		this.purnum = purnum;
		this.ordernum = ordernum;
		this.mid = mid;
		this.pursumprice = pursumprice;
		this.purway = purway;
		this.purdate = purdate;
		this.puramount = puramount;
		this.purstatus = purstatus;
		this.puraddr = puraddr;
		this.gocode = gocode;
	}
	
	public int getPurnum() {
		return purnum;
	}
	public void setPurnum(int purnum) {
		this.purnum = purnum;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getPursumprice() {
		return pursumprice;
	}
	public void setPursumprice(int pursumprice) {
		this.pursumprice = pursumprice;
	}
	public String getPurway() {
		return purway;
	}
	public void setPurway(String purway) {
		this.purway = purway;
	}
	public Date getPurdate() {
		return purdate;
	}
	public void setPurdate(Date purdate) {
		this.purdate = purdate;
	}
	public int getPuramount() {
		return puramount;
	}
	public void setPuramount(int puramount) {
		this.puramount = puramount;
	}
	public String getPurstatus() {
		return purstatus;
	}
	public void setPurstatus(String purstatus) {
		this.purstatus = purstatus;
	}
	public String getPuraddr() {
		return puraddr;
	}
	public void setPuraddr(String puraddr) {
		this.puraddr = puraddr;
	}
	public String getGocode() {
		return gocode;
	}
	public void setGocode(String gocode) {
		this.gocode = gocode;
	}
}
