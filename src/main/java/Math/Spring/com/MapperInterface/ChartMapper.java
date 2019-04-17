package Math.Spring.com.MapperInterface;


import Math.Spring.com.VO.GameStage;
import Math.Spring.com.VO.UserScore;
import Math.Spring.com.VO.Student;

import java.util.ArrayList;

public interface ChartMapper {


	GameStage doughnutSelect(Student student);

	ArrayList<UserScore> selectClassGameScore();

	ArrayList<UserScore> userGameScore(String loginId);
}
