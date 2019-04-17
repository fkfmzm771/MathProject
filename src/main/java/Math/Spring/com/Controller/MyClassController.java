package Math.Spring.com.Controller;

import Math.Spring.com.DAO.FriendDAO;
import Math.Spring.com.DAO.MyClassDAO;
import Math.Spring.com.VO.Friend;
import Math.Spring.com.VO.Myclass;
import Math.Spring.com.VO.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

@Controller
public class MyClassController {
    @Autowired
    MyClassDAO dao;

    /*
    우리 반 페이지
     */
    @RequestMapping(value = "myClass" , method = RequestMethod.GET)
    public String myClass(){
        return "myClass";
    }

    /*
    우리 반 등록 페이지
     */
    @RequestMapping(value = "createClass" , method = RequestMethod.GET)
    public String createClass(){
        return "createClassCodeForm";
    }

    /*
    우리 반 등록
     */
    @RequestMapping(value = "createCode" , method = RequestMethod.GET)
    @ResponseBody
    public String createCode(String classname, HttpSession session, Model model, Myclass myclass){
        String sessionId = (String)session.getAttribute("loginId");

        Random rnd =new Random();
        StringBuffer buf =new StringBuffer();
        for(int i=0;i<4;i++){
            if(rnd.nextBoolean()){
                buf.append((char)((int)(rnd.nextInt(26))+65));
            }else{
                buf.append((rnd.nextInt(10)));
            }
        }

        String codenum = dao.searchCode(buf.toString());

        while(buf.toString().equals(codenum)){
            for(int i=0;i<4;i++){
                if(rnd.nextBoolean()){
                    buf.append((char)((int)(rnd.nextInt(26))+65));
                }else{
                    buf.append((rnd.nextInt(10)));
                }
            }
            codenum = dao.searchCode(buf.toString());
        }

        myclass.setMyclass_code(buf.toString());
        myclass.setMyclass_name(classname);
        myclass.setMyclass_teacher_name(sessionId);

        dao.insertMyclass(myclass);

        return "createClassCodeForm";
    }

    @RequestMapping(value = "classList" , method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<HashMap<String, Object>> classList(String myclass_code){
        ArrayList<HashMap<String, Object>> cList = new ArrayList<HashMap<String, Object>>();

        System.out.println(myclass_code);

        try {
            cList = dao.classList(myclass_code);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("class : " + cList);
        return cList;
    }

    @RequestMapping(value = "classNameList" , method = RequestMethod.GET)
    @ResponseBody
    public List<Myclass> classNameList(HttpSession session){
        String teacher_id = (String)session.getAttribute("loginId");

        List<Myclass> list = dao.classNameList(teacher_id);
        return list;
    }

    @RequestMapping(value = "classNameNCodeList" , method = RequestMethod.GET)
    @ResponseBody
    public List<Myclass> classNameNCodeList(HttpSession session){
        String teacher_id = (String)session.getAttribute("loginId");

        List<Myclass> list = dao.classNameNCodeList(teacher_id);
        return list;
    }


    @RequestMapping(value = "/deleteClass", method = RequestMethod.POST)
    @ResponseBody
    public String deleteFriend(String code){
        System.out.println(code);
        int resultC = dao.deleteClassMyclass(code);
        int resultS = dao.deleteClassStudent(code);
        String message = "";

        if(resultC > 0){
            message = "success";
        } else {
            message = "fail";
        }

        return message;
    }
}