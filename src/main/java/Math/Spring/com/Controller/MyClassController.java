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

        cList = dao.classList(myclass_code);
        return cList;
    }

    @RequestMapping(value = "classListByStudent" , method = RequestMethod.GET)
    @ResponseBody
    public List<Student> classListByStudent(HttpSession session){
        String student_id = (String)session.getAttribute("loginId");

        List<Student> cList = dao.classListByStudent(student_id);

        for(int i=0;i<cList.size();i++){
            if(cList.get(i).getStudent_id().equals(student_id)){
                cList.remove(i);
            }
        }
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


    @RequestMapping(value = "deleteClass", method = RequestMethod.POST)
    @ResponseBody
    public String deleteFriend(String code){
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

    @RequestMapping(value="searchclasscodeform", method=RequestMethod.GET)
    public String searchclasscodeform(){
        return "user/searchclasscodeform";
    }

    @RequestMapping(value = "searchclassCode" , method = RequestMethod.GET)
    public String searchclassCode(String code, HttpSession session, Model model){
        Myclass myclass = dao.searchclassCode(code);
        String message = "찾을수 없는 반 입니다.";
        String sessionId = (String)session.getAttribute("loginId");

        String classname = dao.classyon(sessionId);

        if (code.equals(classname)){
            message = "이미 반으로 등록되어있는 반이거나 신청한 반입니다.";
            myclass = null;
        }

        if(myclass == null){
            model.addAttribute("message", message);
        } else {
            model.addAttribute("id", sessionId);
            model.addAttribute("name",myclass.getMyclass_name());
            model.addAttribute("code", code);
        }

        return "user/searchclasscodeform";
    }

    @RequestMapping(value="classarundesuka", method=RequestMethod.GET)
    @ResponseBody
    public String classarundesuka(HttpSession session){
        String sessionId = (String)session.getAttribute("loginId");

        String myclass = dao.classyon(sessionId);

        return myclass;
    }

    /*
    반 신청 기능
     */
    @RequestMapping(value="applyClass", method=RequestMethod.GET)
    @ResponseBody
    public int applyClass(String student_myclass_code, HttpSession session, Student student){
        String student_id = (String)session.getAttribute("loginId");

        student.setStudent_id(student_id);
        student.setStudent_myclass_code(student_myclass_code);

        int result = dao.applyClass(student);

        return result;
    }

    @RequestMapping(value = "applyClassStudentList" , method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<HashMap<String, Object>> applyClassStudentList(HttpSession session){
        String teacher_id = (String)session.getAttribute("loginId");

        ArrayList<HashMap<String, Object>> list = dao.applyClassStudentList(teacher_id);
        return list;
    }

    @RequestMapping(value = "applyInClass" , method = RequestMethod.GET)
    @ResponseBody
    public int applyInClass(String student_id){
        int result = dao.applyInClass(student_id);
        return result;
    }

    @RequestMapping(value = "rejectInClass" , method = RequestMethod.GET)
    @ResponseBody
    public int rejectInClass(String student_id){
        int result = dao.rejectInClass(student_id);
        return result;
    }

    @RequestMapping(value = "applyingClass" , method = RequestMethod.GET)
    @ResponseBody
    public List<Myclass> applyingClass(HttpSession session){
        String student_id = (String)session.getAttribute("loginId");
        List<Myclass> list = dao.applyingClass(student_id);

        System.out.println("apllying : " + list);

        return list;
    }

    @RequestMapping(value = "canselApplyClass" , method = RequestMethod.GET)
    @ResponseBody
    public int canselApplyClass(HttpSession session){
        String student_id = (String)session.getAttribute("loginId");
        int result = dao.canselApplyClass(student_id);
        return result;
    }

}