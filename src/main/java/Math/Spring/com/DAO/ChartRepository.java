package Math.Spring.com.DAO;

import Math.Spring.com.MapperInterface.ChartMapper;
import Math.Spring.com.VO.Chart;
import Math.Spring.com.VO.Doughnut;
import Math.Spring.com.VO.Gamescore;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;


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

	public ArrayList<Gamescore> gamescorefind(){
		ArrayList<Gamescore> list = new ArrayList<Gamescore>();
		ChartMapper mapper = session.getMapper(ChartMapper.class);
		list = mapper.gamescorefind();
		if(list.size()==0) System.out.println("비어있넹");
		return list;
	}

	public ArrayList<Gamescore> gamescorefind2(String loginId) {
		System.out.println(loginId);
		ArrayList<Gamescore> list = new ArrayList<Gamescore>();
		ChartMapper mapper = session.getMapper(ChartMapper.class);
		list = mapper.gamescorefind2(loginId);
		if(list.size()==0)System.out.println("비어있넹");
		return list;
	}
}







