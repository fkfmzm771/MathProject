package Math.Spring.com.DAO;

import Math.Spring.com.MapperInterface.FriendMapper;
import Math.Spring.com.VO.Friend;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FriendDAO {
	@Autowired
	SqlSession session;

	 public Student searchFriend(String nickname) {
        FriendMapper mapper = session.getMapper(FriendMapper.class);

         Student searchFriend = mapper.searchFriend(nickname);
        return searchFriend;
    }

    public int friendApply(Friend friend) {
        FriendMapper mapper = session.getMapper(FriendMapper.class);
        int friendApply = mapper.friendApply(friend);
        return friendApply;
    }
}