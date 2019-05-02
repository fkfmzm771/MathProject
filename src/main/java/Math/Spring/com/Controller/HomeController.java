package Math.Spring.com.Controller;

import Math.Spring.com.Repository.ChartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

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
}