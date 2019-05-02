package Math.Spring.com.Controller;

import Math.Spring.com.Repository.GameRepository;
import Math.Spring.com.VO.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class GameController {

    @Autowired
    GameRepository rep;

    @ResponseBody
    @RequestMapping(value = "gameData", method = RequestMethod.GET)
    public Map<String, Object> gameData(HttpSession session) {

        String loginId = (String) session.getAttribute("loginId");

        Student student = new Student();
        student.setStudent_id(loginId);

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("student_id", "aaa");
        result.put("nick_name", "냥냥");
        result.put("game_chapter", 1);
        result.put("game_stage", 1);
        result.put("score1", 0);
        result.put("score2", 0);
        result.put("score3", 0);
        result.put("score4", 0);
        result.put("blue_star", 0);
        result.put("yellow_star", 0);
        result.put("play_time", 0);
        result.put("play_Character", "a-1");

        return result;

    }
}
