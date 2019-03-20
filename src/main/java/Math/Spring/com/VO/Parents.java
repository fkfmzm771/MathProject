package Math.Spring.com.VO;

public class Parents {
	private String parents_id;
	private String parents_pw;
	private String parents_name;
	private String parents_email;
	private String parents_nickname;
	private String parents_phone;
	
	public Parents() {
		super();
	}
	
	public Parents(String parents_id, String parents_pw, String parents_name, String parents_email,
			String parents_nickname, String parents_phone) {
		super();
		this.parents_id = parents_id;
		this.parents_pw = parents_pw;
		this.parents_name = parents_name;
		this.parents_email = parents_email;
		this.parents_nickname = parents_nickname;
		this.parents_phone = parents_phone;
	}

	public String getParents_id() {
		return parents_id;
	}

	public void setParents_id(String parents_id) {
		this.parents_id = parents_id;
	}

	public String getParents_pw() {
		return parents_pw;
	}

	public void setParents_pw(String parents_pw) {
		this.parents_pw = parents_pw;
	}

	public String getParents_name() {
		return parents_name;
	}

	public void setParents_name(String parents_name) {
		this.parents_name = parents_name;
	}

	public String getParents_email() {
		return parents_email;
	}

	public void setParents_email(String parents_email) {
		this.parents_email = parents_email;
	}

	public String getParents_nickname() {
		return parents_nickname;
	}

	public void setParents_nickname(String parents_nickname) {
		this.parents_nickname = parents_nickname;
	}

	public String getParents_phone() {
		return parents_phone;
	}

	public void setParents_phone(String parents_phone) {
		this.parents_phone = parents_phone;
	}

	@Override
	public String toString() {
		return "parents [parents_id=" + parents_id + ", parents_pw=" + parents_pw + ", parents_name=" + parents_name
				+ ", parents_email=" + parents_email + ", parents_nickname=" + parents_nickname + ", parents_phone="
				+ parents_phone + "]";
	}
}