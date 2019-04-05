package Math.Spring.com.MapperInterface;

import Math.Spring.com.VO.Friend;
import Math.Spring.com.VO.Student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface FriendMapper {
    Student searchFriend(String nickname);

    int friendApply(Friend friend);

    ArrayList<HashMap<String, Object>> friendList(String my_id) throws Exception;

    int deleteFriend(int seq);
}