package Math.Spring.com.Repository;

import Math.Spring.com.MapperInterface.GameMapper;
import Math.Spring.com.MapperInterface.UserMapper;
import Math.Spring.com.VO.GameCard;
import Math.Spring.com.VO.GameScore;
import Math.Spring.com.VO.GameStage;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class GameRepository {
    @Autowired
    SqlSession session;

    // 유저 게임 스테이지 정보
    public GameStage selectGameStage(Student student) {
        GameMapper mapper = session.getMapper(GameMapper.class);
        GameStage userGameStage = mapper.selectGameStage(student);
        return userGameStage;
    }

    //유저 게임 스코어 정보
    public GameScore selectGameScore(Student student) {

        GameMapper mapper = session.getMapper(GameMapper.class);
        GameScore userGameScore = mapper.selectGameScore(student);

        return userGameScore;
    }

    //유저 A랭크보유 카드 정보
    public GameCard selectA_Card(Student student) {

        GameMapper mapper = session.getMapper(GameMapper.class);
        GameCard userCard = mapper.selectA_Card(student);

        return userCard;
    }

    /** 아이디 중복확인 */
    public Student GameStudentSelectOne(String userid) {
        UserMapper mapper = session.getMapper(UserMapper.class);

        Student student = mapper.StudentSelectOne(userid);
        return student;
    }

}







