package Math.Spring.com.DAO;


import Math.Spring.com.VO.Parents;
import Math.Spring.com.VO.Student;
import Math.Spring.com.VO.Teacher;

public interface UserMapper {

	public Parents ParentsSelectOne(String userid);

	public Teacher TeacherSelectOne(String userid);

	public Student StudentSelectOne(String userid);
	
	public int ParentsInsert(Parents p);
	
	public int TeacherInsert(Teacher t);

	public int StudentInsert(Student s);
	
	public int ParentsUpdate(Parents p);
	
	public int TeacherUpdate(Teacher t);

	public int StudentUpdate(Student s);
}