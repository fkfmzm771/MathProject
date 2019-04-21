package Math.Spring.com.VO;

public class GameStage {

    private String student_id;
    private int game_chapter;
    private int stage1;
    private int stage2;
    private int stage3;
    private int stage4;
    private int stage5;
    private int stage6;
    private int stage7;
    private int stage8;
    private int stage9;
    private int stage10;

    public GameStage() {
    }

    public GameStage(String student_id, int game_chapter, int stage1, int stage2, int stage3, int stage4, int stage5, int stage6, int stage7, int stage8, int stage9, int stage10) {
        this.student_id = student_id;
        this.game_chapter = game_chapter;
        this.stage1 = stage1;
        this.stage2 = stage2;
        this.stage3 = stage3;
        this.stage4 = stage4;
        this.stage5 = stage5;
        this.stage6 = stage6;
        this.stage7 = stage7;
        this.stage8 = stage8;
        this.stage9 = stage9;
        this.stage10 = stage10;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public int getGame_chapter() {
        return game_chapter;
    }

    public void setGame_chapter(int game_chapter) {
        this.game_chapter = game_chapter;
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

    public int getStage6() {
        return stage6;
    }

    public void setStage6(int stage6) {
        this.stage6 = stage6;
    }

    public int getStage7() {
        return stage7;
    }

    public void setStage7(int stage7) {
        this.stage7 = stage7;
    }

    public int getStage8() {
        return stage8;
    }

    public void setStage8(int stage8) {
        this.stage8 = stage8;
    }

    public int getStage9() {
        return stage9;
    }

    public void setStage9(int stage9) {
        this.stage9 = stage9;
    }

    public int getStage10() {
        return stage10;
    }

    public void setStage10(int stage10) {
        this.stage10 = stage10;
    }

    @Override
    public String toString() {
        return "GameStage{" +
                "student_id='" + student_id + '\'' +
                ", game_chapter=" + game_chapter +
                ", stage1=" + stage1 +
                ", stage2=" + stage2 +
                ", stage3=" + stage3 +
                ", stage4=" + stage4 +
                ", stage5=" + stage5 +
                ", stage6=" + stage6 +
                ", stage7=" + stage7 +
                ", stage8=" + stage8 +
                ", stage9=" + stage9 +
                ", stage10=" + stage10 +
                '}';
    }

}