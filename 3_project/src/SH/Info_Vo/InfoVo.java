package SH.Info_Vo;

public class InfoVo {
	private int infonum;
	private String infotitle;
	private String infocontent;
	private String adminid;
	
	public InfoVo() {}

	public InfoVo(int infonum, String infotitle, String infocontent, String adminid) {
		super();
		this.infonum = infonum;
		this.infotitle = infotitle;
		this.infocontent = infocontent;
		this.adminid = adminid;
	}

	public int getInfonum() {
		return infonum;
	}

	public void setInfonum(int infonum) {
		this.infonum = infonum;
	}

	public String getInfotitle() {
		return infotitle;
	}

	public void setInfotitle(String infotitle) {
		this.infotitle = infotitle;
	}

	public String getInfocontent() {
		return infocontent;
	}

	public void setInfocontent(String infocontent) {
		this.infocontent = infocontent;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	
	
}
