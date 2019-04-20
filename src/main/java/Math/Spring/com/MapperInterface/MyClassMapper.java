package Math.Spring.com.MapperInterface;

import Math.Spring.com.VO.Friend;
import Math.Spring.com.VO.Myclass;
import Math.Spring.com.VO.Student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface MyClassMapper {
    String searchCode(String randomCode);

    int insertMyclass(Myclass myclass);

    ArrayList<HashMap<String, Object>> classList(String myclass_code);

    List<Myclass> classNameList(String teacher_id);

    List<Myclass> classNameNCodeList(String teacher_id);

    int deleteClassMyclass(String code);

    int deleteClassStudent(String code);

    Myclass searchclassCode(String code);

    int applyClass(String student_id, String student_myclass_code);
}