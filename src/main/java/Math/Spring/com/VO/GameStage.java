package Math.Spring.com.VO;

public class GameStage {
    private String student_id;
    private int game_chapter;
    private int game1;
    private int game2;
    private int game3;
    private int game4;
    private int game5;
    private int game6;
    private int game7;
    private int game8;
    private int game9;
    private int game10;


    public GameStage() {
    }

    public GameStage(String student_id, int game_chapter, int game1, int game2, int game3, int game4, int game5, int game6, int game7, int game8, int game9, int game10) {
        this.student_id = student_id;
        this.game_chapter = game_chapter;
        this.game1 = game1;
        this.game2 = game2;
        this.game3 = game3;
        this.game4 = game4;
        this.game5 = game5;
        this.game6 = game6;
        this.game7 = game7;
        this.game8 = game8;
        this.game9 = game9;
        this.game10 = game10;
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

    public int getGame1() {
        return game1;
    }

    public void setGame1(int game1) {
        this.game1 = game1;
    }

    public int getGame2() {
        return game2;
    }

    public void setGame2(int game2) {
        this.game2 = game2;
    }

    public int getGame3() {
        return game3;
    }

    public void setGame3(int game3) {
        this.game3 = game3;
    }

    public int getGame4() {
        return game4;
    }

    public void setGame4(int game4) {
        this.game4 = game4;
    }

    public int getGame5() {
        return game5;
    }

    public void setGame5(int game5) {
        this.game5 = game5;
    }

    public int getGame6() {
        return game6;
    }

    public void setGame6(int game6) {
        this.game6 = game6;
    }

    public int getGame7() {
        return game7;
    }

    public void setGame7(int game7) {
        this.game7 = game7;
    }

    public int getGame8() {
        return game8;
    }

    public void setGame8(int game8) {
        this.game8 = game8;
    }

    public int getGame9() {
        return game9;
    }

    public void setGame9(int game9) {
        this.game9 = game9;
    }

    public int getGame10() {
        return game10;
    }

    public void setGame10(int game10) {
        this.game10 = game10;
    }

    @Override
    public String toString() {
        return "GameStage{" +
                "student_id='" + student_id + '\'' +
                ", game_chapter=" + game_chapter +
                ", game1=" + game1 +
                ", game2=" + game2 +
                ", game3=" + game3 +
                ", game4=" + game4 +
                ", game5=" + game5 +
                ", game6=" + game6 +
                ", game7=" + game7 +
                ", game8=" + game8 +
                ", game9=" + game9 +
                ", game10=" + game10 +
                '}';
    }
}
