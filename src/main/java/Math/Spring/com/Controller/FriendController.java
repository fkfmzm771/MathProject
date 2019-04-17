package Math.Spring.com.Controller;

import Math.Spring.com.DAO.FriendDAO;
import Math.Spring.com.VO.Friend;
import Math.Spring.com.VO.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FriendController {
    @Autowired
    FriendDAO dao;

    /*
    친구 페이지
     */
    @RequestMapping(value = "friend" , method = RequestMethod.GET)
    public String friend(){
        return "friend";
    }

    /*
    유저 검색 페이지
     */
    @RequestMapping(value = "searchFriendForm" , method = RequestMethod.GET)
    public String searchFriendForm(){
        return "searchFriendForm";
    }

    /*
    친구 찾기기능
     */
    @RequestMapping(value = "searchFriend" , method = RequestMethod.GET)
    public String searchFriend(String nickname, HttpSession session, Model model){
        Student student = dao.searchFriend(nickname);
        String message = "찾을수 없는 닉네임 입니다.";
        String sessionId = (String)session.getAttribute("loginId");


        //중복 검사해서 같은거 출력 못하게 내뱉어라
        ArrayList<HashMap<String, Object>> fList = dao.friendList(sessionId);

        for(int i=0; i < fList.size(); i++){
            System.out.println("fList " + i + "번째 : "  + fList.get(i));
            if (fList.get(i).get("FRIEND_NICKNAME").equals(nickname)){
                message = "이미 친구로 등록되어있는 유저입니다.";
                student = null;
            }
            System.out.println("fList " + i + "번째 : "  + fList.get(i));
        }

        if (student == null || sessionId.equals(student.getStudent_id())){
            model.addAttribute("message", message);
        } else {
            model.addAttribute("user_id",student.getStudent_id());
            model.addAttribute("user_nickname",student.getStudent_nickname());
        }
        return "searchFriendForm";
    }

    /*
    친구 신청 기능
     */
    @RequestMapping(value="friendApply", method=RequestMethod.GET)
    @ResponseBody
    public int friendApply(String user_id, HttpSession session, Friend friend){
        String sessionId = (String)session.getAttribute("loginId");

        friend.setFriend_id(user_id);
        friend.setMy_id(sessionId);

        int result = dao.friendApply(friend);

        return result;
    }

    /*
    친구 목록 출력
     */
    @RequestMapping(value = "/friendList", method = RequestMethod.GET)
    public @ResponseBody ArrayList<HashMap<String, Object>> reviewList(HttpSession session){
        String session_my_id = (String)session.getAttribute("loginId");
        ArrayList<HashMap<String, Object>> fList = new ArrayList<HashMap<String, Object>>();

        try {
            fList = dao.friendList(session_my_id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(fList);

        return fList;
    }

    /*
    팔로우 삭제
     */
    @RequestMapping(value = "/deleteFriend", method = RequestMethod.POST)
    @ResponseBody
    public String deleteFriend(int seq){
        System.out.println("seq : " +seq);
        int result = dao.deleteFriend(seq);
        String message = "";

        if(result > 0){
            message = "success";
        } else {
            message = "fail";
        }

        return message;
    }
}