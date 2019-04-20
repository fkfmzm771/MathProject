package Math.Spring.com.Controller;

import Math.Spring.com.DAO.ChartRepository;
import Math.Spring.com.VO.GameChapter;
import Math.Spring.com.VO.GameScore;
import Math.Spring.com.VO.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class GraphController {

    @Autowired
    ChartRepository rep;

    // 학생 도넛츠 차트 검색
    @RequestMapping(value = "selectDonutChart", method = RequestMethod.GET)
    @ResponseBody
    public GameChapter userGameScore(HttpSession session) {
//        String type = (String)session.getAttribute("type");

        String loginId = (String)session.getAttribute("loginId");

        Student student = new Student();
        student.setStudent_id(loginId);

        GameChapter doughnut = rep.selectDonutChart(student);
        System.out.println(doughnut);

        return doughnut;
    }

    //학생 스코어 총합
    @RequestMapping(value= "selectChapterScore", method=RequestMethod.GET)
    @ResponseBody
    public GameScore selectChapterScore(HttpSession session){

//        String type = (String)session.getAttribute("type");

        String loginId = (String)session.getAttribute("loginId");

        Student student = new Student();
        student.setStudent_id(loginId);

        GameScore gameScore = rep.selectChapterScore(student);

        System.out.println(gameScore + "dsssssssss");

        return gameScore;
    }







    //로그인 학생 챕터별 별 갯수 로드
    @RequestMapping(value= "selectClassGameScore", method=RequestMethod.GET)
    @ResponseBody
    public ArrayList<GameScore> selectClassGameScore(HttpSession session){

        String type = (String)session.getAttribute("type");
        String loginId = (String)session.getAttribute("loginId");

        System.out.println(type);
        System.out.println(loginId);

        ArrayList<GameScore> list = new ArrayList<GameScore>();

        list = rep.selectClassGameScore();

        if(list.size()==0) System.out.println("비어있음");
        else {
            for ( GameScore k:list){
                System.out.println(k.getStudent_name());
            }
        }
        return list;
    }







}
