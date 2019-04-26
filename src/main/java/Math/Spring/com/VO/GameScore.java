package Math.Spring.com.VO;

public class GameScore {
    private String student_id;

    private int score1;  //숫자 이해
    private int score2;  //연산
    private int score3;  //도형
    private int score4;  //생활
    private int blue_star; // 파란 별 갯수
    private int yellow_star; // 노란 별 갯수
    private String play_time;  //플레이 시간
    private String play_Character; //소유 캐릭터

    public GameScore() {
    }

    public GameScore(String student_id, int score1, int score2, int score3, int score4, int blue_star, int yellow_star, String play_time, String play_Character) {
        this.student_id = student_id;
        this.score1 = score1;
        this.score2 = score2;
        this.score3 = score3;
        this.score4 = score4;
        this.blue_star = blue_star;
        this.yellow_star = yellow_star;
        this.play_time = play_time;
        this.play_Character = play_Character;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public int getScore1() {
        return score1;
    }

    public void setScore1(int score1) {
        this.score1 = score1;
    }

    public int getScore2() {
        return score2;
    }

    public void setScore2(int score2) {
        this.score2 = score2;
    }

    public int getScore3() {
        return score3;
    }

    public void setScore3(int score3) {
        this.score3 = score3;
    }

    public int getScore4() {
        return score4;
    }

    public void setScore4(int score4) {
        this.score4 = score4;
    }

    public int getBlue_star() {
        return blue_star;
    }

    public void setBlue_star(int blue_star) {
        this.blue_star = blue_star;
    }

    public int getYellow_star() {
        return yellow_star;
    }

    public void setYellow_star(int yellow_star) {
        this.yellow_star = yellow_star;
    }

    public String getPlay_time() {
        return play_time;
    }

    public void setPlay_time(String play_time) {
        this.play_time = play_time;
    }

    public String getPlay_Character() {
        return play_Character;
    }

    public void setPlay_Character(String play_Character) {
        this.play_Character = play_Character;
    }

    @Override
    public String toString() {
        return "GameScore{" +
                "student_id='" + student_id + '\'' +
                ", score1=" + score1 +
                ", score2=" + score2 +
                ", score3=" + score3 +
                ", score4=" + score4 +
                ", blue_star=" + blue_star +
                ", yellow_star=" + yellow_star +
                ", play_time='" + play_time + '\'' +
                ", play_Character='" + play_Character + '\'' +
                '}';
    }
}


