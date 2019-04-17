package Math.Spring.com.Controller;

import Math.Spring.com.DAO.ChartRepository;
import Math.Spring.com.VO.GameStage;
import Math.Spring.com.VO.Student;
import Math.Spring.com.VO.UserScore;
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


    //통계 데이터 불러오기
    @RequestMapping(value= "selectClassGameScore", method=RequestMethod.GET)
    @ResponseBody
    public ArrayList<UserScore> selectClassGameScore(HttpSession session){

        String type = (String)session.getAttribute("type");
        String loginId = (String)session.getAttribute("loginId");

        System.out.println(type);
        System.out.println(loginId);

        ArrayList<UserScore> list = new ArrayList<UserScore>();
        if(type.contains("teacher")){
            list = rep.selectClassGameScore();
        }else if(type.contains("student")){
            list = rep.userGameScore(loginId);
        }

        if(list.size()==0) System.out.println("비어있음");
        else {
            for ( UserScore k:list){
                System.out.println(k.getStudent_name());
            }
        }
        return list;
    }

    //학생 개인 도넛츠 출력 정보
    @RequestMapping(value = "userGameScore", method = RequestMethod.GET)
    @ResponseBody
    public GameStage userGameScore(HttpSession session) {
        String type = (String)session.getAttribute("type");
        String loginId = (String)session.getAttribute("loginId");

        System.out.println(loginId);
        Student student = new Student();
        student.setStudent_id(loginId);
        System.out.println(student);

        GameStage doughnut = rep.reserchchart(student);
        System.out.println(doughnut);

        return doughnut;
    }



}