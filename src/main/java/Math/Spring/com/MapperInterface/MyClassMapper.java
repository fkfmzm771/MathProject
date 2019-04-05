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

    public List<Myclass> classNameList(String teacher_id);
}