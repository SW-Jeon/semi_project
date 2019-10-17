package SW_vo;

public class AsWriteVo {
	 private int asnum;
	 private String asimg;
	 private String astitle;
	 private String ascontent;
	 private String mid;
	 private String gocode;
	 private int purnum;
	 private int ashit;
	 
	 public AsWriteVo() {}

	public AsWriteVo(int asnum, String asimg, String astitle, String ascontent, String mid, String gocode, int purnum,
			int ashit) {
		super();
		this.asnum = asnum;
		this.asimg = asimg;
		this.astitle = astitle;
		this.ascontent = ascontent;
		this.mid = mid;
		this.gocode = gocode;
		this.purnum = purnum;
		this.ashit = ashit;
	}

	public int getAsnum() {
		return asnum;
	}

	public void setAsnum(int asnum) {
		this.asnum = asnum;
	}

	public String getAsimg() {
		return asimg;
	}

	public void setAsimg(String asimg) {
		this.asimg = asimg;
	}

	public String getAstitle() {
		return astitle;
	}

	public void setAstitle(String astitle) {
		this.astitle = astitle;
	}

	public String getAscontent() {
		return ascontent;
	}

	public void setAscontent(String ascontent) {
		this.ascontent = ascontent;
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

	public int getPurnum() {
		return purnum;
	}

	public void setPurnum(int purnum) {
		this.purnum = purnum;
	}

	public int getAshit() {
		return ashit;
	}

	public void setAshit(int ashit) {
		this.ashit = ashit;
	}
	 
	
}
