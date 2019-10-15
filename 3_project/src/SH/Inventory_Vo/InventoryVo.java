package SH.Inventory_Vo;

public class InventoryVo {
	private String  gocode; 
	private String goname;
	private int goprice; 
	private String gocolor; 
	private String goimg; 
    private int pamount;
    private int jnum; 
    private String adminid;
    
    public InventoryVo() {}

	public InventoryVo(String gocode, String goname, int goprice, String gocolor, String goimg, int pamount, int jnum,
			String adminid) {
		super();
		this.gocode = gocode;
		this.goname = goname;
		this.goprice = goprice;
		this.gocolor = gocolor;
		this.goimg = goimg;
		this.pamount = pamount;
		this.jnum = jnum;
		this.adminid = adminid;
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

	public int getGoprice() {
		return goprice;
	}

	public void setGoprice(int goprice) {
		this.goprice = goprice;
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

	public int getPamount() {
		return pamount;
	}

	public void setPamount(int pamount) {
		this.pamount = pamount;
	}

	public int getJnum() {
		return jnum;
	}

	public void setJnum(int jnum) {
		this.jnum = jnum;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
    
	
    
}
