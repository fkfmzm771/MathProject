package Math.Spring.com.Controller;

import Math.Spring.com.DAO.ChartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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


  /*  //??
    @RequestMapping(value = "chartregist", method = RequestMethod.GET)
    @ResponseBody
    public String chartregist(Chart chart) {
        System.out.println(chart);
        if(rep.regist(chart) == 1) {
            return "T";
        }
        else return "N";
    }*/



    /*@RequestMapping(value = "search", method = RequestMethod.GET)
    @ResponseBody
    public Doughnut search(HttpSession session, Student student) {
        String loginId = (String)session.getAttribute("loginId");
        student.setStudent_id(loginId);

        Doughnut doughnut = rep.reserchchart(student);
        System.out.println(doughnut);

        return doughnut;
    }
*/


}