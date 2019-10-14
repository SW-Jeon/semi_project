package JB.Demand_vo;

public class DemandVo {
	private int ordernum; //주문번호
	private String mid; //주문자 아이디
	private String gocode; // 상품번호
	private int orderamount; // 주문수량
	private int orderprice; // 총가격
	public DemandVo() {}
	public DemandVo(int ordernum, String mid, String gocode, int orderamount, int orderprice) {
		super();
		this.ordernum = ordernum;
		this.mid = mid;
		this.gocode = gocode;
		this.orderamount = orderamount;
		this.orderprice = orderprice;
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
	public String getGocode() {
		return gocode;
	}
	public void setGocode(String gocode) {
		this.gocode = gocode;
	}
	public int getOrderamount() {
		return orderamount;
	}
	public void setOrderamount(int orderamount) {
		this.orderamount = orderamount;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	
}
