package Math.Spring.com.DAO;

import Math.Spring.com.MapperInterface.UserMapper;
import Math.Spring.com.VO.Parents;
import Math.Spring.com.VO.Student;
import Math.Spring.com.VO.Teacher;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserRepository {
	@Autowired
	SqlSession session;
	
	/** 아이디 중복확인 */
	public Parents ParentsSelectOne(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		Parents p = mapper.ParentsSelectOne(userid);
		return p;	
	}
	
	/** 아이디 중복확인 */
	public Teacher TeacherSelectOne(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		Teacher t = mapper.TeacherSelectOne(userid);
		return t;	
	}
	
	/** 아이디 중복확인 */
	public Student StudentSelectOne(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		Student s = mapper.StudentSelectOne(userid);
		return s;	
	}

	/** 닉네임 중복확인 */
	public Parents ParentsSelectOneNickname(String nickname) {
		UserMapper mapper = session.getMapper(UserMapper.class);

		Parents p = mapper.ParentsSelectOneNickname(nickname);
		return p;
	}

	/** 닉네임 중복확인 */
	public Teacher TeacherSelectOneNickname(String nickname) {
		UserMapper mapper = session.getMapper(UserMapper.class);

		Teacher t = mapper.TeacherSelectOneNickname(nickname);
		return t;
	}

	/** 닉네임 중복확인 */
	public Student StudentSelectOneNickname(String nickname) {
		UserMapper mapper = session.getMapper(UserMapper.class);

		Student s = mapper.StudentSelectOneNickname(nickname);
		return s;
	}

	/** Regist Student */
	public int ParentsInsert(Parents p) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int result = mapper.ParentsInsert(p);
		return result;
	}
	
	/** Regist Student */
	public int TeacherInsert(Teacher t) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int result = mapper.TeacherInsert(t);
		return result;
	}
	
	/** Regist Student */
	public int StudentInsert(Student s) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int result = mapper.StudentInsert(s);
		return result;
	}
	
	/** Regist Student */
	public int ParentsUpdate(Parents p) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int result = mapper.ParentsUpdate(p);
		return result;
	}
	
	/** Regist Student */
	public int TeacherUpdate(Teacher t) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int result = mapper.TeacherUpdate(t);
		return result;
	}
	
	/** Regist Student */
	public int StudentUpdate(Student s) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int result = mapper.StudentUpdate(s);
		return result;
	}
}