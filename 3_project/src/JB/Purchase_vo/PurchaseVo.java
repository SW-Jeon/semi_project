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
	///////////////////////////////
	private String goname;//물품한글명
	private String gocolor;//물품색상
	private String goimg;//물품이미지
	private int jnum;//악세서리 번호
	private String jname;//악세서리 종류
	private String cpursumprice;//천단위 콤마 결제금액
	
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
	public PurchaseVo(int purnum, int ordernum, String mid, String cpursumprice, String purway, Date purdate, int puramount,
			String purstatus, String puraddr,String gocode,String goname,String gocolor,String goimg,int jnum,String jname) {
		super();
		this.purnum = purnum;
		this.ordernum = ordernum;
		this.mid = mid;
		this.cpursumprice = cpursumprice;
		this.purway = purway;
		this.purdate = purdate;
		this.puramount = puramount;
		this.purstatus = purstatus;
		this.puraddr = puraddr;
		this.gocode = gocode;
		this.goname = goname;
		this.gocolor = gocolor;
		this.goimg = goimg;
		this.jnum = jnum;
		this.jname = jname;
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
	public String getGoname() {
		return goname;
	}
	public void setGoname(String goname) {
		this.goname = goname;
	}
	public String getGocolor() {
		return gocolor;
	}
	public void setGocolor(String gocolor) {
		this.gocolor = gocolor;
	}
	public String getGoimg() {
		return goimg;
	}
	public void setGoimg(String goimg) {
		this.goimg = goimg;
	}
	public int getJnum() {
		return jnum;
	}
	public void setJnum(int jnum) {
		this.jnum = jnum;
	}
	public String getJname() {
		return jname;
	}
	public void setJname(String jname) {
		this.jname = jname;
	}
	public String getCpursumprice() {
		return cpursumprice;
	}
	public void setCpursumprice(String cpursumprice) {
		this.cpursumprice = cpursumprice;
	}
}
