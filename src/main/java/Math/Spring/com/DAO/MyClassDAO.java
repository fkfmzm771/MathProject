package Math.Spring.com.DAO;

import Math.Spring.com.MapperInterface.FriendMapper;
import Math.Spring.com.MapperInterface.MyClassMapper;
import Math.Spring.com.VO.Friend;
import Math.Spring.com.VO.Myclass;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public class MyClassDAO {
	@Autowired
	SqlSession session;

	 public String searchCode(String codenum) {
	     MyClassMapper mapper = session.getMapper(MyClassMapper.class);

         String code = mapper.searchCode(codenum);

         return code;
    }

    public int insertMyclass(Myclass myclass) {
        MyClassMapper mapper = session.getMapper(MyClassMapper.class);

        int result = mapper.insertMyclass(myclass);

        return result;
    }

    public ArrayList<HashMap<String, Object>> classList(String myclass_code) {
        MyClassMapper mapper = session.getMapper(MyClassMapper.class);
        ArrayList<HashMap<String, Object>> cList = new ArrayList<HashMap<String, Object>>();
        try {
            cList = mapper.classList(myclass_code);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cList;
    }

    public List<Myclass> classNameList(String teacher_id) {
        MyClassMapper mapper = session.getMapper(MyClassMapper.class);
        List<Myclass> cList = mapper.classNameList(teacher_id);
        return cList;
    }

    public List<Myclass> classNameNCodeList(String teacher_id) {
        MyClassMapper mapper = session.getMapper(MyClassMapper.class);
        List<Myclass> cList = mapper.classNameNCodeList(teacher_id);
        return cList;
    }

    public int deleteClassMyclass(String code) {
        MyClassMapper mapper = session.getMapper(MyClassMapper.class);
        int cList = mapper.deleteClassMyclass(code);
        return cList;
    }

    public int deleteClassStudent(String code) {
        MyClassMapper mapper = session.getMapper(MyClassMapper.class);
        int cList = mapper.deleteClassStudent(code);
        return cList;
    }
}