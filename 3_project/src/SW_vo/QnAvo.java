package SW_vo;

public class QnAvo {
	 private int qaNum;
	 private String qaContent;
	 private String qaName;
	 private String qaPwd;
	 private String qaRecontent;
	 private int qaHit;
	 private String reQst;
	 
	 public QnAvo() {}

	public QnAvo(int qaNum, String qaContent, String qaName, String qaPwd, String qaRecontent, int qaHit,
			String reQst) {
		super();
		this.qaNum = qaNum;
		this.qaContent = qaContent;
		this.qaName = qaName;
		this.qaPwd = qaPwd;
		this.qaRecontent = qaRecontent;
		this.qaHit = qaHit;
		this.reQst = reQst;
	}

	public int getQaNum() {
		return qaNum;
	}

	public void setQaNum(int qaNum) {
		this.qaNum = qaNum;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public String getQaName() {
		return qaName;
	}

	public void setQaName(String qaName) {
		this.qaName = qaName;
	}

	public String getQaPwd() {
		return qaPwd;
	}

	public void setQaPwd(String qaPwd) {
		this.qaPwd = qaPwd;
	}

	public String getQaRecontent() {
		return qaRecontent;
	}

	public void setQaRecontent(String qaRecontent) {
		this.qaRecontent = qaRecontent;
	}

	public int getQaHit() {
		return qaHit;
	}

	public void setQaHit(int qaHit) {
		this.qaHit = qaHit;
	}

	public String getReQst() {
		return reQst;
	}

	public void setReQst(String reQst) {
		this.reQst = reQst;
	}
	 
}
