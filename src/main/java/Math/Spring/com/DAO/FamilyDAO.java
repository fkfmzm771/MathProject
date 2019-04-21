package Math.Spring.com.DAO;

import Math.Spring.com.MapperInterface.FamilyMapper;
import Math.Spring.com.VO.Myclass;
import Math.Spring.com.VO.Parents;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public class FamilyDAO {
	@Autowired
	SqlSession session;

    public Student searchCodomo(String id) {
        FamilyMapper mapper = session.getMapper(FamilyMapper.class);

        Student searchCodomoSelect = mapper.searchCodomo(id);
        return searchCodomoSelect;
    }

    public List<Student> codomoList(String id) {
        FamilyMapper mapper = session.getMapper(FamilyMapper.class);

        List<Student> codomoList = mapper.codomoList(id);
        return codomoList;
    }

    public int FamilyApply(Student student) {
        FamilyMapper mapper = session.getMapper(FamilyMapper.class);

        int result = mapper.FamilyApply(student);
        return result;
    }

    public List<Parents> applyFamilyList(String student_id) {
        FamilyMapper mapper = session.getMapper(FamilyMapper.class);

        List<Parents> parents = mapper.applyFamilyList(student_id);
        return parents;
    }

    public int applyInFamily(String student_id) {
        FamilyMapper mapper = session.getMapper(FamilyMapper.class);

        int result = mapper.applyInFamily(student_id);
        return result;
    }

    public int rejectInFamily(String student_id) {
        FamilyMapper mapper = session.getMapper(FamilyMapper.class);

        int result = mapper.rejectInFamily(student_id);
        return result;
    }

    public List<Student> FamilyList(String parents_id) {
        FamilyMapper mapper = session.getMapper(FamilyMapper.class);

        List<Student> sList = mapper.FamilyList(parents_id);
        return sList;
    }
}