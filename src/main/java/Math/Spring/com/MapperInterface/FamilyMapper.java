package Math.Spring.com.MapperInterface;

import Math.Spring.com.VO.Myclass;
import Math.Spring.com.VO.Parents;
import Math.Spring.com.VO.Student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface FamilyMapper {
    Student searchCodomo(String id);

    List<Student> codomoList(String id);

    int FamilyApply(Student student);

    List<Parents> applyFamilyList(String student_id);

    int applyInFamily(String student_id);

    int rejectInFamily(String student_id);

    List<Student> FamilyList(String parents_id);

    List<Student> FamilyStudentList(String student_id);
}