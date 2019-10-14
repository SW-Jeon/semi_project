package SW_vo;

public class WriteVo {
	 private int writeNum;
	 private String mId;
	 private String writeContent;
	 private String reWrite;
	 private String reWst;
	 
	 public WriteVo() {}

	public WriteVo(int writeNum, String mId, String writeContent, String reWrite, String reWst) {
		super();
		this.writeNum = writeNum;
		this.mId = mId;
		this.writeContent = writeContent;
		this.reWrite = reWrite;
		this.reWst = reWst;
	}

	public int getWriteNum() {
		return writeNum;
	}

	public void setWriteNum(int writeNum) {
		this.writeNum = writeNum;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getWriteContent() {
		return writeContent;
	}

	public void setWriteContent(String writeContent) {
		this.writeContent = writeContent;
	}

	public String getReWrite() {
		return reWrite;
	}

	public void setReWrite(String reWrite) {
		this.reWrite = reWrite;
	}

	public String getReWst() {
		return reWst;
	}

	public void setReWst(String reWst) {
		this.reWst = reWst;
	}
	 
}
