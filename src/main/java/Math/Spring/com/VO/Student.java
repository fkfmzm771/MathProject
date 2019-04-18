package Math.Spring.com.VO;

public class Student {
    private String student_id;
    private String student_pw;
    private String student_name;
    private String student_email;
    private String student_nickname;
    private String student_myclass_code;
    private String student_myclass_check;

    public Student() {

    }

    public Student(String student_id, String student_pw, String student_name, String student_email, String student_nickname, String student_myclass_code, String student_myclass_check) {
        this.student_id = student_id;
        this.student_pw = student_pw;
        this.student_name = student_name;
        this.student_email = student_email;
        this.student_nickname = student_nickname;
        this.student_myclass_code = student_myclass_code;
        this.student_myclass_check = student_myclass_check;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getStudent_pw() {
        return student_pw;
    }

    public void setStudent_pw(String student_pw) {
        this.student_pw = student_pw;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getStudent_email() {
        return student_email;
    }

    public void setStudent_email(String student_email) {
        this.student_email = student_email;
    }

    public String getStudent_nickname() {
        return student_nickname;
    }

    public void setStudent_nickname(String student_nickname) {
        this.student_nickname = student_nickname;
    }

    public String getStudent_myclass_code() {
        return student_myclass_code;
    }

    public void setStudent_myclass_code(String student_myclass_code) {
        this.student_myclass_code = student_myclass_code;
    }

    public String getStudent_myclass_check() {
        return student_myclass_check;
    }

    public void setStudent_myclass_check(String student_myclass_check) {
        this.student_myclass_check = student_myclass_check;
    }

    @Override
    public String toString() {
        return "Student{" +
                "student_id='" + student_id + '\'' +
                ", student_pw='" + student_pw + '\'' +
                ", student_name='" + student_name + '\'' +
                ", student_email='" + student_email + '\'' +
                ", student_nickname='" + student_nickname + '\'' +
                ", student_myclass_code='" + student_myclass_code + '\'' +
                ", student_myclass_check='" + student_myclass_check + '\'' +
                '}';
    }
}