package SW_vo;

public class WriteVo {
	 private int writenum;
	 private String mid;
	 private String gocode;
	 private String title;
	 private String writecontent;
	 private String rewrite;
	 private String rewst;
	 
	 public WriteVo() {}

	public WriteVo(int writenum, String mid, String gocode, String title, String writecontent, String rewrite,
			String rewst) {
		super();
		this.writenum = writenum;
		this.mid = mid;
		this.gocode = gocode;
		this.title = title;
		this.writecontent = writecontent;
		this.rewrite = rewrite;
		this.rewst = rewst;
	}

	public int getWritenum() {
		return writenum;
	}

	public void setWritenum(int writenum) {
		this.writenum = writenum;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWritecontent() {
		return writecontent;
	}

	public void setWritecontent(String writecontent) {
		this.writecontent = writecontent;
	}

	public String getRewrite() {
		return rewrite;
	}

	public void setRewrite(String rewrite) {
		this.rewrite = rewrite;
	}

	public String getRewst() {
		return rewst;
	}

	public void setRewst(String rewst) {
		this.rewst = rewst;
	}

}