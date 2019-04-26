package Math.Spring.com.MapperInterface;

import Math.Spring.com.VO.Friend;
import Math.Spring.com.VO.Myclass;
import Math.Spring.com.VO.Student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface MyClassMapper {
    public String searchCode(String randomCode);

    public int insertMyclass(Myclass myclass);

    public ArrayList<HashMap<String, Object>> classList(String myclass_code);

    List<Student> classListByStudent(String student_id);

    public List<Myclass> classNameList(String teacher_id);

    public List<Myclass> classNameNCodeList(String teacher_id);

    public int deleteClassMyclass(String code);

    public int deleteClassStudent(String code);

    Myclass searchclassCode(String code);

    String classyon(String sessionId);

    int applyClass(Student student);

    ArrayList<HashMap<String, Object>> applyClassStudentList(String teacher_id);

    int applyInClass(String student_id);

    int rejectInClass(String student_id);

    List<Myclass> applyingClass(String student_id);

    int canselApplyClass(String student_id);

    List<Myclass> studentClass(String student_id);
}