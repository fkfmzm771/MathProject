package Math.Spring.com.VO;

public class MathBoard {
    private String mathboard_seq;
    private String host_id;
    private String guest_id;
    private String contents;

    public MathBoard() {
    }

    public MathBoard(String mathboard_seq, String host_id, String guest_id, String contents) {
        this.mathboard_seq = mathboard_seq;
        this.host_id = host_id;
        this.guest_id = guest_id;
        this.contents = contents;
    }

    public String getMathboard_seq() {
        return mathboard_seq;
    }

    public void setMathboard_seq(String mathboard_seq) {
        this.mathboard_seq = mathboard_seq;
    }

    public String getHost_id() {
        return host_id;
    }

    public void setHost_id(String host_id) {
        this.host_id = host_id;
    }

    public String getGuest_id() {
        return guest_id;
    }

    public void setGuest_id(String guest_id) {
        this.guest_id = guest_id;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    @Override
    public String toString() {
        return "MathBoard{" +
                "mathboard_seq='" + mathboard_seq + '\'' +
                ", host_id='" + host_id + '\'' +
                ", guest_id='" + guest_id + '\'' +
                ", contents='" + contents + '\'' +
                '}';
    }
}