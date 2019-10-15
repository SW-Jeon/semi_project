package SW_vo;

public class QnAvo {
	 private int qanum;
	 private String qacontent;
	 private String qaname;
	 private String qapwd;
	 private String qarecontent;
	 private int qahit;
	 private String reqst;
	 
	 public QnAvo() {}

	public QnAvo(int qanum, String qacontent, String qaname, String qapwd, String qarecontent, int qahit,
			String reqst) {
		super();
		this.qanum = qanum;
		this.qacontent = qacontent;
		this.qaname = qaname;
		this.qapwd = qapwd;
		this.qarecontent = qarecontent;
		this.qahit = qahit;
		this.reqst = reqst;
	}

	public int getQanum() {
		return qanum;
	}

	public void setQanum(int qanum) {
		this.qanum = qanum;
	}

	public String getQacontent() {
		return qacontent;
	}

	public void setQacontent(String qacontent) {
		this.qacontent = qacontent;
	}

	public String getQaname() {
		return qaname;
	}

	public void setQaname(String qaname) {
		this.qaname = qaname;
	}

	public String getQapwd() {
		return qapwd;
	}

	public void setQapwd(String qapwd) {
		this.qapwd = qapwd;
	}

	public String getQarecontent() {
		return qarecontent;
	}

	public void setQarecontent(String qarecontent) {
		this.qarecontent = qarecontent;
	}

	public int getQahit() {
		return qahit;
	}

	public void setQahit(int qahit) {
		this.qahit = qahit;
	}

	public String getReqst() {
		return reqst;
	}

	public void setReqst(String reqst) {
		this.reqst = reqst;
	}

	
	 
}
