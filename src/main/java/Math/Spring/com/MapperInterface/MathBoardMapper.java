package Math.Spring.com.MapperInterface;

import Math.Spring.com.VO.MathBoard;
import Math.Spring.com.VO.Parents;
import Math.Spring.com.VO.Student;

import java.util.List;

public interface MathBoardMapper {
    List<MathBoard> BoardList(String host_id);

    int insertBoard(MathBoard board);


    int FamilyApply(Student student);

    List<Parents> applyFamilyList(String student_id);

    int applyInFamily(String student_id);

    int rejectInFamily(String student_id);

    List<Student> FamilyList(String parents_id);
}