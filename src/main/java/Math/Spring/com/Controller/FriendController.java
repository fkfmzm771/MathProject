package Math.Spring.com.Controller;

import Math.Spring.com.DAO.FriendDAO;
import Math.Spring.com.VO.Student;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class FriendController {
    @Autowired
    FriendDAO dao;

    @RequestMapping(value = "friend" , method = RequestMethod.GET)
    public String friend(){
        return "friend";
    }

    @RequestMapping(value = "searchFriendForm" , method = RequestMethod.GET)
    public String searchFriendForm(){
        return "searchFriendForm";
    }

    @RequestMapping(value = "searchFriend" , method = RequestMethod.GET)
    public String searchFriend(String nickname, HttpSession session, Model model){
        Student student = dao.searchFriend(nickname);
        String message = "찾을수 없는 닉네임 입니다.";
        String sessionId = (String)session.getAttribute("loginId");

        if (student == null || sessionId.equals(student.getStudent_id())){
            model.addAttribute("message", message);
        } else {
            model.addAttribute("user_id",student.getStudent_id());
            model.addAttribute("user_nickname",student.getStudent_nickname());
        }
        return "searchFriendForm";
    }
}