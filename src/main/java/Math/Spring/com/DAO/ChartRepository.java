package Math.Spring.com.DAO;

import Math.Spring.com.MapperInterface.ChartMapper;
import Math.Spring.com.VO.GameStage;
import Math.Spring.com.VO.UserScore;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;


@Repository
public class ChartRepository {
	@Autowired
	SqlSession session;



	public GameStage reserchchart(Student student) {
		ChartMapper mapper = session.getMapper(ChartMapper.class);
		GameStage doughnut = mapper.doughnutSelect(student);
		return doughnut;
	}

	public ArrayList<UserScore> selectClassGameScore() {

		ChartMapper mapper = session.getMapper(ChartMapper.class);
		ArrayList<UserScore> list = mapper.selectClassGameScore();
		if (list.size() == 0){
			System.out.println("비어있넹");
		}
		return list;
	}

	public ArrayList<UserScore> userGameScore(String loginId) {

		ChartMapper mapper = session.getMapper(ChartMapper.class);
		ArrayList<UserScore> list = mapper.userGameScore(loginId);
		if (list.size() == 0){
			System.out.println("비어있넹");
		}
		return list;
	}
}







