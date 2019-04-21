package Math.Spring.com.Controller;

import Math.Spring.com.DAO.FamilyDAO;
import Math.Spring.com.VO.Parents;
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

@Controller
public class FamilyController {
    @Autowired
    FamilyDAO dao;

    /*
    유저 검색 페이지
    */
    @RequestMapping(value = "searchStudentIdByParents" , method = RequestMethod.GET)
    public String searchFriendForm(){
        return "searchStudentIdByParentsForm";
    }

    /*
    자녀 찾기기능
     */
    @RequestMapping(value = "searchCodomo" , method = RequestMethod.GET)
    public String searchCodomo(String id, HttpSession session, Model model){
        String message = "찾을수 없는 ID 입니다.";
        Student student = dao.searchCodomo(id);
        String sessionId = (String)session.getAttribute("loginId");

        //중복 검사해서 같은거 출력 못하게 내뱉어라
        List<Student> sList = dao.codomoList(sessionId);

        for(int i=0; i < sList.size(); i++){
            if (sList.get(i).getStudent_id().equals(id)){
                message = "이미 자녀로 등록되어있거나 요청을 한 학생입니다.";
                student = null;
            }
        }

        System.out.println();

        if (student == null || sessionId.equals(student.getStudent_id())){
            model.addAttribute("message", message);
        } else {
            model.addAttribute("user_id",student.getStudent_id());
            model.addAttribute("user_name",student.getStudent_nickname());
            model.addAttribute("user_nickname",student.getStudent_nickname());
        }
        return "searchStudentIdByParentsForm";
    }

    /*
    자녀 신청 기능
     */
    @RequestMapping(value="familyApply", method=RequestMethod.GET)
    @ResponseBody
    public int friendApply(String user_id, HttpSession session, Student student){
        String sessionId = (String)session.getAttribute("loginId");

        student.setStudent_id(user_id);
        student.setStudent_parents_id(sessionId);

        System.out.println(student);

        int result = dao.FamilyApply(student);

        return result;
    }

    /*
    가족 신청 수락 기능
     */
    @RequestMapping(value = "applyFamilyList" , method = RequestMethod.GET)
    @ResponseBody
    public List<Parents> applyFamilyList(HttpSession session){
        String student_id = (String)session.getAttribute("loginId");

        List<Parents> parents = dao.applyFamilyList(student_id);

        return parents;
    }

    /*
    가족 신청 수락 기능
     */
    @RequestMapping(value = "applyInFamily" , method = RequestMethod.GET)
    @ResponseBody
    public int applyInFamily(HttpSession session){
        String student_id = (String)session.getAttribute("loginId");
        int result = dao.applyInFamily(student_id);
        return result;
    }

    /*
    가족 신청 거절 기능
     */
    @RequestMapping(value = "rejectInFamily" , method = RequestMethod.GET)
    @ResponseBody
    public int rejectInFamily(HttpSession session){
        String student_id = (String)session.getAttribute("loginId");
        int result = dao.rejectInFamily(student_id);
        return result;
    }

    /*
    가족 리스트 학생용
     */
    @RequestMapping(value = "FamilyList" , method = RequestMethod.GET)
    @ResponseBody
    public List<Student> FamilyList(HttpSession session){
        String parents_id = (String)session.getAttribute("loginId");

        List<Student> sList = dao.FamilyList(parents_id);

        return sList;
    }
}