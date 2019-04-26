package Math.Spring.com.Controller;

import Math.Spring.com.DAO.ChartRepository;
import Math.Spring.com.VO.GameStage;
import Math.Spring.com.VO.GameScore;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Controller
public class GraphController {

    @Autowired
    ChartRepository rep;

    // 학생 도넛츠 차트 검색
    @RequestMapping(value = "selectDonutChart", method = RequestMethod.GET)
    @ResponseBody
    public GameStage userGameScore(HttpSession session) {
//        String type = (String)session.getAttribute("type");

        String loginId = (String)session.getAttribute("loginId");

        Student student = new Student();
        student.setStudent_id(loginId);

        GameStage doughnut = rep.selectDonutChart(student);
        System.out.println(doughnut+"11111111111");

        return doughnut;
    }



    //학생 스코어 총합
    @RequestMapping(value= "selectChapterScore", method=RequestMethod.GET)
    @ResponseBody
    public HashMap<String, Object> selectChapterScore(HttpSession session){
        String student_id = (String)session.getAttribute("loginId");

        HashMap<String, Object> GameScore = rep.selectChapterScore(student_id);

        System.out.println("개인 : " + GameScore);
        return GameScore;
    }




    //전체 학생 챕터별 점수 로드
    @RequestMapping(value= "selectClassGameScore", method=RequestMethod.GET)
    @ResponseBody
    public ArrayList<HashMap<String, Object>> selectClassGameScore(){

        ArrayList<HashMap<String, Object>> list = rep.selectClassGameScore();

        System.out.println("전체 : " + list);

        return list;
    }
}
