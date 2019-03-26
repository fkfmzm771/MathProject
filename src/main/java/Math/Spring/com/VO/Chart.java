package Math.Spring.com.VO;

public class Chart {

    private int studentnum;
    private String studentId;
    private int numberKnow;
    private int numberPlus;
    private int shapesKnow;
    private int lifeAbility;

    public Chart() {

    }

    public Chart(int studentnum, String studentId, int numberKnow, int numberPlus, int shapesKnow, int lifeAbility) {
        this.studentnum = studentnum;
        this.studentId = studentId;
        this.numberKnow = numberKnow;
        this.numberPlus = numberPlus;
        this.shapesKnow = shapesKnow;
        this.lifeAbility = lifeAbility;
    }

    public int getStudentnum() {
        return studentnum;
    }

    public void setStudentnum(int studentnum) {
        this.studentnum = studentnum;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getNumberKnow() {
        return numberKnow;
    }

    public void setNumberKnow(int numberKnow) {
        this.numberKnow = numberKnow;
    }

    public int getNumberPlus() {
        return numberPlus;
    }

    public void setNumberPlus(int numberPlus) {
        this.numberPlus = numberPlus;
    }

    public int getShapesKnow() {
        return shapesKnow;
    }

    public void setShapesKnow(int shapesKnow) {
        this.shapesKnow = shapesKnow;
    }

    public int getLifeAbility() {
        return lifeAbility;
    }

    public void setLifeAbility(int lifeAbility) {
        this.lifeAbility = lifeAbility;
    }

    @Override
    public String toString() {
        return "Chart [studentnum=" + studentnum + ", studentId=" + studentId + ", numberKnow=" + numberKnow
                + ", numberPlus=" + numberPlus + ", shapesKnow=" + shapesKnow + ", lifeAbility=" + lifeAbility + "]";
    }


}

