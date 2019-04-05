package Math.Spring.com.Controller;

import Math.Spring.com.DAO.ChartRepository;
import Math.Spring.com.VO.Chart;
import Math.Spring.com.VO.Doughnut;
import Math.Spring.com.VO.Gamescore;
import Math.Spring.com.VO.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class HomeController {

    @Autowired
    ChartRepository rep;

    //메인 화면
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home() {

        return "member/loginForm";
    }

    //??
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index() {

        return "selectwindow";
    }


    //??
    @RequestMapping(value = "chartregist", method = RequestMethod.GET)
    @ResponseBody
    public String chartregist(Chart chart) {
        System.out.println(chart);
        if(rep.regist(chart) == 1) {
            return "T";
        }
        else return "N";
    }

    //??
    /*@RequestMapping(value = "reserch", method = RequestMethod.GET)
    @ResponseBody
    public Doughnut reserch(Student student) {
        System.out.println(student);

        Doughnut doughnut = rep.reserchchart(student);
        System.out.println(doughnut);

        return doughnut;
    }*/

    @RequestMapping(value = "search", method = RequestMethod.GET)
    @ResponseBody
    public Doughnut search(String studentId) {

        System.out.println(studentId);
        Student student = new Student();
        student.setStudent_id(studentId);
        System.out.println(student);

        Doughnut doughnut = rep.reserchchart(student);
        System.out.println(doughnut);

        return doughnut;
    }


    @RequestMapping(value= "/gamescorefind", method=RequestMethod.GET)
    @ResponseBody
    public ArrayList<Gamescore> gamescorefind(HttpSession session){

        String type = (String)session.getAttribute("type");
        String loginId = (String)session.getAttribute("loginId");

        ArrayList<Gamescore> list = new ArrayList<Gamescore>();
        if(type.contains("teacher")){
            list = rep.gamescorefind();
        }else if(type.contains("student")){
            list = rep.gamescorefind2(loginId);
        }

        if(list.size()==0) System.out.println("비어있음");
        else {
            for ( Gamescore k:list){
                System.out.println(k.getStudent_name());
            }
        }
        return list;
    }


}
