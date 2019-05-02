package Math.Spring.com.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EducationController {

    @RequestMapping(value="number" , method= RequestMethod.GET)
    public String number(){

        return "testPage/number";

    }

  @RequestMapping(value="calculation" , method= RequestMethod.GET)
    public String education1(){

        return "testPage/calculation";

  }


   @RequestMapping(value="shape" , method= RequestMethod.GET)
   public String education3(){

       return "testPage/shape";
   }

    @RequestMapping(value="clock" , method= RequestMethod.GET)
    public String education4(){

        return "testPage/clock";
    }


    @RequestMapping(value="money" , method= RequestMethod.GET)
    public String education5(){

        return "testPage/money";
    }

    @RequestMapping(value="boardform" , method= RequestMethod.GET)
    public String boardform(){

        return "BoardForm";
    }


}
