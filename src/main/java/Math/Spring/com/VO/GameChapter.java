package Math.Spring.com.VO;

public class GameChapter {

    private String student_id;
    private int chapter;
    private int stage1;
    private int stage2;
    private int stage3;
    private int stage4;
    private int stage5;
    private String game_title;


    public GameChapter() {
    }

    public GameChapter(String student_id, int chapter, int stage1, int stage2, int stage3, int stage4, int stage5, String game_title) {
        this.student_id = student_id;
        this.chapter = chapter;
        this.stage1 = stage1;
        this.stage2 = stage2;
        this.stage3 = stage3;
        this.stage4 = stage4;
        this.stage5 = stage5;
        this.game_title = game_title;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public int getChapter() {
        return chapter;
    }

    public void setChapter(int chapter) {
        this.chapter = chapter;
    }

    public int getStage1() {
        return stage1;
    }

    public void setStage1(int stage1) {
        this.stage1 = stage1;
    }

    public int getStage2() {
        return stage2;
    }

    public void setStage2(int stage2) {
        this.stage2 = stage2;
    }

    public int getStage3() {
        return stage3;
    }

    public void setStage3(int stage3) {
        this.stage3 = stage3;
    }

    public int getStage4() {
        return stage4;
    }

    public void setStage4(int stage4) {
        this.stage4 = stage4;
    }

    public int getStage5() {
        return stage5;
    }

    public void setStage5(int stage5) {
        this.stage5 = stage5;
    }

    public String getGame_title() {
        return game_title;
    }

    public void setGame_title(String game_title) {
        this.game_title = game_title;
    }

    @Override
    public String toString() {
        return "GameChapter{" +
                "student_id='" + student_id + '\'' +
                ", chapter=" + chapter +
                ", stage1=" + stage1 +
                ", stage2=" + stage2 +
                ", stage3=" + stage3 +
                ", stage4=" + stage4 +
                ", stage5=" + stage5 +
                ", game_title='" + game_title + '\'' +
                '}';
    }
}