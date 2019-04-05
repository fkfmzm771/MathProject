package Math.Spring.com.MapperInterface;


import Math.Spring.com.VO.Chart;
import Math.Spring.com.VO.Doughnut;
import Math.Spring.com.VO.Gamescore;
import Math.Spring.com.VO.Student;

import java.util.ArrayList;

public interface ChartMapper {

	int regist(Chart chart);

	Doughnut doughnutSelect(Student student);

	ArrayList<Gamescore> gamescorefind();

	ArrayList<Gamescore> gamescorefind2(String loginId);
	
}
