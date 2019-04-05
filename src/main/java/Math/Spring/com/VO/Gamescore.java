package Math.Spring.com.VO;

public class Gamescore {
    private String student_id;
    private String student_name;
    private int number_score;
    private int calculation_score;
    private int shape_score;
    private int life_score;

    public Gamescore() {

    }

    public Gamescore(String student_id, String student_name, int number_score, int calculation_score, int shape_score, int life_score) {
        this.student_id = student_id;
        this.student_name = student_name;
        this.number_score = number_score;
        this.calculation_score = calculation_score;
        this.shape_score = shape_score;
        this.life_score = life_score;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public int getNumber_score() {
        return number_score;
    }

    public void setNumber_score(int number_score) {
        this.number_score = number_score;
    }

    public int getCalculation_score() {
        return calculation_score;
    }

    public void setCalculation_score(int calculation_score) {
        this.calculation_score = calculation_score;
    }

    public int getShape_score() {
        return shape_score;
    }

    public void setShape_score(int shape_score) {
        this.shape_score = shape_score;
    }

    public int getLife_score() {
        return life_score;
    }

    public void setLife_score(int life_score) {
        this.life_score = life_score;
    }

    @Override
    public String toString() {
        return "Gamescore{" +
                "student_id='" + student_id + '\'' +
                ", student_name='" + student_name + '\'' +
                ", number_score=" + number_score +
                ", calculation_score=" + calculation_score +
                ", shape_score=" + shape_score +
                ", life_score=" + life_score +
                '}';
    }
}
