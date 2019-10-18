package JB.Cart_Vo;

public class CartVo {
	private int cartnum; //장바구니 넘버
	private String cartname; //물건명(한글)
	private String cartimg; //물품 이미지 네임
	private String gocode; //상품코드명
	private String mid; //회원 아이디
	public CartVo() {}
	public CartVo(int cartnum, String cartname, String cartimg, String gocode, String mid) {
		super();
		this.cartnum = cartnum;
		this.cartname = cartname;
		this.cartimg = cartimg;
		this.gocode = gocode;
		this.mid = mid;
	}
	public int getCartnum() {
		return cartnum;
	}
	public void setCartnum(int cartnum) {
		this.cartnum = cartnum;
	}
	public String getCartname() {
		return cartname;
	}
	public void setCartname(String cartname) {
		this.cartname = cartname;
	}
	public String getCartimg() {
		return cartimg;
	}
	public void setCartimg(String cartimg) {
		this.cartimg = cartimg;
	}
	public String getGocode() {
		return gocode;
	}
	public void setGocode(String gocode) {
		this.gocode = gocode;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
}
