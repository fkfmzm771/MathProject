package Math.Spring.com.DAO;

import Math.Spring.com.MapperInterface.FamilyMapper;
import Math.Spring.com.MapperInterface.MathBoardMapper;
import Math.Spring.com.VO.MathBoard;
import Math.Spring.com.VO.Parents;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MathBoardDAO {
	@Autowired
	SqlSession session;

    public List<MathBoard> BoardList(String host_id) {
        MathBoardMapper mapper = session.getMapper(MathBoardMapper.class);

        List<MathBoard> list = mapper.BoardList(host_id);
        return list;
    }

    public int insertBoard(MathBoard board) {
        MathBoardMapper mapper = session.getMapper(MathBoardMapper.class);

        int result = mapper.insertBoard(board);
        return result;
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