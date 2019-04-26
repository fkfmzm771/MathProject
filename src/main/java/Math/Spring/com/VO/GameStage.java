package Math.Spring.com.VO;

public class GameStage {

    private String student_id;
    private int game_chapter; // 현재 챕터
    private int game_stage;   // 현재 스테이지


    public GameStage() {
    }

    public GameStage(String student_id, int game_chapter, int game_stage) {
        this.student_id = student_id;
        this.game_chapter = game_chapter;
        this.game_stage = game_stage;
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

    public int getGame_stage() {
        return game_stage;
    }

    public void setGame_stage(int game_stage) {
        this.game_stage = game_stage;
    }

    @Override
    public String toString() {
        return "GameStage{" +
                "student_id='" + student_id + '\'' +
                ", game_chapter=" + game_chapter +
                ", game_stage=" + game_stage +
                '}';
    }
}