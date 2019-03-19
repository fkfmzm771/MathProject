package Math.Spring.com.DAO;

import Math.Spring.com.VO.Chart;
import Math.Spring.com.VO.Doughnut;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ChartRepository {
	@Autowired
	SqlSession session;
	
	public int regist(Chart chart) {
		ChartMapper mapper = session.getMapper(ChartMapper.class);
		int result = mapper.regist(chart);
		return result;
		
	}

	public Doughnut reserchchart(Student student) {
		ChartMapper mapper = session.getMapper(ChartMapper.class);
		Doughnut doughnut = mapper.doughnutSelect(student);
		return doughnut;
	}

}







