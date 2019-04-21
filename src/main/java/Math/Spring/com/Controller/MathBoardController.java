package Math.Spring.com.Controller;

import Math.Spring.com.DAO.ChartRepository;
import Math.Spring.com.DAO.MathBoardDAO;
import Math.Spring.com.VO.MathBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MathBoardController {

    @Autowired
    MathBoardDAO dao;

    @RequestMapping(value = "boardDetail", method = RequestMethod.GET)
    public String boardDetail(String host_id, Model model){
        model.addAttribute("host_id", host_id);
        return "BoardForm";
    }

    @RequestMapping(value = "boardList", method = RequestMethod.POST)
    @ResponseBody
    public List<MathBoard> boardList(String host_id){
        List<MathBoard> list = dao.BoardList(host_id);

        return list;
    }

    @RequestMapping(value = "boardApply", method = RequestMethod.POST)
    @ResponseBody
    public int boardDetail(String contents, String host_id, HttpSession session, MathBoard board){
        String guest_id = (String) session.getAttribute("loginId");

        board.setGuest_id(guest_id);
        board.setHost_id(host_id);
        board.setContents(contents);

        int result = dao.insertBoard(board);

        return result;
    }
}