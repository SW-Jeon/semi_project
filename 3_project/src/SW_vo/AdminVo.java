package SW_vo;

public class AdminVo {
		private String adminid;
		private String companycode ;
		private String adminphone ;
		private String adminemail ;
		
		public AdminVo() {}

		public AdminVo(String adminid, String companycode, String adminphone, String adminemail) {
			super();
			this.adminid = adminid;
			this.companycode = companycode;
			this.adminphone = adminphone;
			this.adminemail = adminemail;
		}

		public String getAdminid() {
			return adminid;
		}

		public void setAdminid(String adminid) {
			this.adminid = adminid;
		}

		public String getCompanycode() {
			return companycode;
		}

		public void setCompanycode(String companycode) {
			this.companycode = companycode;
		}

		public String getAdminphone() {
			return adminphone;
		}

		public void setAdminphone(String adminphone) {
			this.adminphone = adminphone;
		}

		public String getAdminemail() {
			return adminemail;
		}

		public void setAdminemail(String adminemail) {
			this.adminemail = adminemail;
		}
		
}
