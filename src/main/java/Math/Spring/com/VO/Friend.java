package Math.Spring.com.VO;

public class Friend {
    private int friend_seq;
    private String my_id;
    private String friend_id;
    private int friend_check;

    public Friend() {

    }

    public Friend(
            int friend_seq
            , String my_id
            , String friend_id
            , int friend_check
    ) {
        this.friend_seq = friend_seq;
        this.my_id = my_id;
        this.friend_id = friend_id;
        this.friend_check = friend_check;
    }

    public int getFriend_seq() {
        return friend_seq;
    }

    public void setFriend_seq(int friend_seq) {
        this.friend_seq = friend_seq;
    }

    public String getMy_id() {
        return my_id;
    }

    public void setMy_id(String my_id) {
        this.my_id = my_id;
    }

    public String getFriend_id() {
        return friend_id;
    }

    public void setFriend_id(String friend_id) {
        this.friend_id = friend_id;
    }

    public int getFriend_check() {
        return friend_check;
    }

    public void setFriend_check(int friend_check) {
        this.friend_check = friend_check;
    }

    @Override
    public String toString() {
        return "Friend{" +
                "friend_seq=" + friend_seq +
                ", my_id='" + my_id + '\'' +
                ", friend_id='" + friend_id + '\'' +
                ", friend_check=" + friend_check +
                '}';
    }
}