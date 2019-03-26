package Math.Spring.com.DAO;

import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Repository
public class FriendDAO {
	@Autowired
	SqlSession session;

	 public Student searchFriend(String nickname) {
        FriendMapper mapper = session.getMapper(FriendMapper.class);

         Student searchFriend = mapper.searchFriend(nickname);
        return searchFriend;
    }
}