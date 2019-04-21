package Math.Spring.com.VO;

public class Parents {
    private String parents_id;            //학부모 ID
    private String parents_pw;            //학부모 PW
    private String parents_name;        //학부모 이름
    private String parents_email;        //학부모 이메일
    private String parents_nickname;    //학부모 닉네임(생략)

    public Parents() {

    }

    public Parents(
            String parents_id
            , String parents_pw
            , String parents_name
            , String parents_email
            , String parents_nickname
    ) {
        this.parents_id = parents_id;
        this.parents_pw = parents_pw;
        this.parents_name = parents_name;
        this.parents_email = parents_email;
        this.parents_nickname = parents_nickname;
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

    @Override
    public String toString() {
        return "parents [parents_id=" + parents_id
                + ", parents_pw=" + parents_pw
                + ", parents_name=" + parents_name
                + ", parents_email=" + parents_email
                + ", parents_nickname=" + parents_nickname
                + "]";
    }
}