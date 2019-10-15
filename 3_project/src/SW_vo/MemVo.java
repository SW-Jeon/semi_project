package SW_vo;

public class MemVo {
	 private String mid;
	 private String mname;
	 private String mpwd;
	 private String memail;
	 private String maddr;
	 private String mphone;
	 private String mgen;
	 private int mdelup;
	 
	 public  MemVo() {}

	public MemVo(String mid, String mname, String mpwd, String memail, String maddr, String mphone, String mgen,
			int mdelup) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.mpwd = mpwd;
		this.memail = memail;
		this.maddr = maddr;
		this.mphone = mphone;
		this.mgen = mgen;
		this.mdelup = mdelup;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMgen() {
		return mgen;
	}

	public void setMgen(String mgen) {
		this.mgen = mgen;
	}

	public int getMdelup() {
		return mdelup;
	}

	public void setMdelup(int mdelup) {
		this.mdelup = mdelup;
	}

}