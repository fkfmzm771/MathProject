package Math.Spring.com.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//임시 컨트롤러 테스트 파일 연결
@Controller
public class TestController {
    @RequestMapping(value = "/test01", method = RequestMethod.GET)
    public String home() {

        return "testPage/test01";
    }
}
