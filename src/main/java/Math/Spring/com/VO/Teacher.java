package Math.Spring.com.VO;

public class Teacher {
    private String teacher_id;
    private String teacher_pw;
    private String teacher_name;
    private String teacher_email;
    private String teacher_nickname;

    public Teacher() {

    }

    public Teacher(
            String teacher_id
            , String teacher_pw
            , String teacher_name
            , String teacher_email
            , String teacher_nickname
    ) {
        this.teacher_id = teacher_id;
        this.teacher_pw = teacher_pw;
        this.teacher_name = teacher_name;
        this.teacher_email = teacher_email;
        this.teacher_nickname = teacher_nickname;
    }

    public String getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(String teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTeacher_pw() {
        return teacher_pw;
    }

    public void setTeacher_pw(String teacher_pw) {
        this.teacher_pw = teacher_pw;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public String getTeacher_email() {
        return teacher_email;
    }

    public void setTeacher_email(String teacher_email) {
        this.teacher_email = teacher_email;
    }

    public String getTeacher_nickname() {
        return teacher_nickname;
    }

    public void setTeacher_nickname(String teacher_nickname) {
        this.teacher_nickname = teacher_nickname;
    }

    @Override
    public String toString() {
        return "teacher [teacher_id=" + teacher_id
                + ", teacher_pw=" + teacher_pw
                + ", teacher_name=" + teacher_name
                + ", teacher_email=" + teacher_email
                + ", teacher_nickname=" + teacher_nickname
                + "]";
    }
}