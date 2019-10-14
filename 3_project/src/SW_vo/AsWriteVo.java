package SW_vo;

public class AsWriteVo {
	 private int asNum;
	 private String asImg;
	 private String asContent;
	 private String mId;
	 private String goCode;
	 private int purNum;
	 private int asHit;
	 
	 public AsWriteVo() {}

	public AsWriteVo(int asNum, String asImg, String asContent, String mId, String goCode, int purNum, int asHit) {
		super();
		this.asNum = asNum;
		this.asImg = asImg;
		this.asContent = asContent;
		this.mId = mId;
		this.goCode = goCode;
		this.purNum = purNum;
		this.asHit = asHit;
	}

	public int getAsNum() {
		return asNum;
	}

	public void setAsNum(int asNum) {
		this.asNum = asNum;
	}

	public String getAsImg() {
		return asImg;
	}

	public void setAsImg(String asImg) {
		this.asImg = asImg;
	}

	public String getAsContent() {
		return asContent;
	}

	public void setAsContent(String asContent) {
		this.asContent = asContent;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getGoCode() {
		return goCode;
	}

	public void setGoCode(String goCode) {
		this.goCode = goCode;
	}

	public int getPurNum() {
		return purNum;
	}

	public void setPurNum(int purNum) {
		this.purNum = purNum;
	}

	public int getAsHit() {
		return asHit;
	}

	public void setAsHit(int asHit) {
		this.asHit = asHit;
	}
	
}
