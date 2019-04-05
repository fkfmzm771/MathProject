package Math.Spring.com.VO;

public class Myclass {
    private String myclass_code;
    private String myclass_name;
    private String myclass_teacher_name;

    public Myclass() {
    }

    public Myclass(String myclass_code, String myclass_name, String myclass_teacher_name) {
        this.myclass_code = myclass_code;
        this.myclass_name = myclass_name;
        this.myclass_teacher_name = myclass_teacher_name;
    }

    public String getMyclass_code() {
        return myclass_code;
    }

    public void setMyclass_code(String myclass_code) {
        this.myclass_code = myclass_code;
    }

    public String getMyclass_name() {
        return myclass_name;
    }

    public void setMyclass_name(String myclass_name) {
        this.myclass_name = myclass_name;
    }

    public String getMyclass_teacher_name() {
        return myclass_teacher_name;
    }

    public void setMyclass_teacher_name(String myclass_teacher_name) {
        this.myclass_teacher_name = myclass_teacher_name;
    }

    @Override
    public String toString() {
        return "Myclass{" +
                "myclass_code=" + myclass_code +
                ", myclass_name='" + myclass_name + '\'' +
                ", myclass_teacher_name='" + myclass_teacher_name + '\'' +
                '}';
    }
}