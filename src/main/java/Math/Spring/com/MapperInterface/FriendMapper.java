package Math.Spring.com.MapperInterface;

import Math.Spring.com.VO.Friend;
import Math.Spring.com.VO.Student;

public interface FriendMapper {
    Student searchFriend(String nickname);

    int friendApply(Friend friend);
}