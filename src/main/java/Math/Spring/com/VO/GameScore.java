package Math.Spring.com.VO;

public class GameScore {
    private String student_id;
    private String nick_name;
    private int score1;  //숫자 이해
    private int score2;  //연산
    private int score3;  //도형
    private int score4;  //생활
    private String play_time;
    private String play_Character;

    public GameScore() {
    }

    public GameScore(String student_id, String nick_name, int score1, int score2, int score3, int score4, String play_time, String play_Character) {
        this.student_id = student_id;
        this.nick_name = nick_name;
        this.score1 = score1;
        this.score2 = score2;
        this.score3 = score3;
        this.score4 = score4;
        this.play_time = play_time;
        this.play_Character = play_Character;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
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
                ", nick_name='" + nick_name + '\'' +
                ", score1=" + score1 +
                ", score2=" + score2 +
                ", score3=" + score3 +
                ", score4=" + score4 +
                ", play_time='" + play_time + '\'' +
                ", play_Character='" + play_Character + '\'' +
                '}';
    }
}


