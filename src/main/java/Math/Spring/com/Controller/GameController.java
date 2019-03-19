package Math.Spring.com.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GameController {

    @RequestMapping(value = "gamego" , method = RequestMethod.GET)
    public String game(){


        return "game/gametest";
    }
}
