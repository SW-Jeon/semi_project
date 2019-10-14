package SW_vo;

public class MemVo {
	 private String mId;
	 private String mName;
	 private String mPwd;
	 private String mEmail;
	 private String mAddr;
	 private String mPhone;
	 private String mGen;
	 private int mDelup;
	 
	 public  MemVo() {}

	public MemVo(String mId, String mName, String mPwd, String mEmail, String mAddr, String mPhone, String mGen,
			int mDelup) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.mPwd = mPwd;
		this.mEmail = mEmail;
		this.mAddr = mAddr;
		this.mPhone = mPhone;
		this.mGen = mGen;
		this.mDelup = mDelup;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmAddr() {
		return mAddr;
	}

	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmGen() {
		return mGen;
	}

	public void setmGen(String mGen) {
		this.mGen = mGen;
	}

	public int getmDelup() {
		return mDelup;
	}

	public void setmDelup(int mDelup) {
		this.mDelup = mDelup;
	}
	 
}
