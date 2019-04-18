package Math.Spring.com.Controller;

import Math.Spring.com.VO.GameStage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GameController {

    @RequestMapping(value = "gamego" , method = RequestMethod.GET)
    public String game(){


        return "game/gametest";
    }

    @RequestMapping(value = "gameTest" , method = RequestMethod.POST)
    @ResponseBody
    public String gameTest(GameStage stage){
        String test = "와라";

        System.out.println(stage);

        return test;
    }

}

