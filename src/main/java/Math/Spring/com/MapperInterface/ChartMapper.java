package Math.Spring.com.MapperInterface;


import Math.Spring.com.VO.Chart;
import Math.Spring.com.VO.Doughnut;
import Math.Spring.com.VO.Student;

public interface ChartMapper {

	int regist(Chart chart);

	Doughnut doughnutSelect(Student student);


	
}
