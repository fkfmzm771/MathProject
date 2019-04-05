package Math.Spring.com.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//임시 컨트롤러 테스트 파일 연결
@Controller
public class TestController {
    @RequestMapping(value = "test01", method = RequestMethod.GET)
    public String test01() {

        return "testPage/test01";
    }

    @RequestMapping(value = "test02", method = RequestMethod.GET)
    public String home() {

        return "testPage/test02";
    }


    @RequestMapping(value = "updateForm", method = RequestMethod.GET)
    public String updateForm() {

        return "user/updateForm";
    }


    @RequestMapping(value="sidebar",method = RequestMethod.GET)
    public String sidebar_test(){
        return "testPage/sidebar";
    }
    @RequestMapping(value="main_test",method = RequestMethod.GET)
    public String main_test(){
        return "testPage/main_test";
    }

}
