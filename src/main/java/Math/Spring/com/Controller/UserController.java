package Math.Spring.com.Controller;

import javax.servlet.http.HttpSession;

import Math.Spring.com.Repository.UserRepository;
import Math.Spring.com.VO.Parents;
import Math.Spring.com.VO.Student;
import Math.Spring.com.VO.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserController {
	@Autowired
	UserRepository dao;

	/** 회원가입 화면 요청 */
	@RequestMapping(value = "/joinform", method = RequestMethod.GET)
	public String joinus() {
		return "member/signForm";
	}

//	/** 네이버로그인화면 */
//	@RequestMapping(value = "/naverLogined", method = RequestMethod.POST)
//	@ResponseBody
//	public String naverInsert(String name, String email, Model model,
//							  HttpSession session, HttpServletResponse response) {
//			Parents p = dao.ParentsSelectOne(email);
//			System.out.println("P : " + p);
//		System.out.println("P : " + p.getParents_nickname());
//			if (p != null) {
//				session.setAttribute("loginId", email);
//				session.setAttribute("loginName", name);
//				if(p.getParents_nickname()==null){
//				    return "fail";
//                }
//			} else {
//				Teacher t = dao.TeacherSelectOne(email);
//				System.out.println("T : " + t);
//				System.out.println("T : " + t.getTeacher_nickname());
//				if (t != null) {
//					session.setAttribute("loginId", email);
//					session.setAttribute("loginName", name);
//                    if(t.getTeacher_nickname()==null){
//                        return "fail";
//                    }
//				} else {
//					Student s = dao.StudentSelectOne(email);
//					System.out.println("S : " + s);
//					System.out.println("S : " + s.getStudent_nickname());
//					if(s != null) {
//						session.setAttribute("loginId", email);
//						session.setAttribute("loginName", name);
//                        if(s.getStudent_nickname()==null){
//                            return "fail";
//                        }
//					}
//				}
//			}
//		return "success";
//	}

    /** 처음 로그인 후 페이지 이동 */
    @RequestMapping(value = "/insertNickName", method = RequestMethod.GET)
    public String insertNickName() {
        return "testPage/insertNickName";
    }

    /** 닉네임 존재 여부 */
    @RequestMapping(value = "/nicknameCheck", method = RequestMethod.GET)
	public String nicknameCheckPage(){
    	return "";
	}

    /** 닉네임 중복확인 처리 요청 */
    @RequestMapping(value = "/nicknameCheck", method = RequestMethod.POST)
    public String nicknameCheck(String usernickname, Model model) {
        Parents p = dao.ParentsSelectOneNickname(usernickname);
        if (p != null) {
            model.addAttribute("result", "success");
            model.addAttribute("usernickname", p.getParents_id());
        } else {
            Teacher t = dao.TeacherSelectOneNickname(usernickname);
            if (t != null) {
                model.addAttribute("result", "success");
                model.addAttribute("usernickname", t.getTeacher_nickname());
            } else {
                Student s = dao.StudentSelectOneNickname(usernickname);
                if(s != null) {
                    model.addAttribute("result", "success");
                    model.addAttribute("usernickname", s.getStudent_id());
                }
                else {
                    model.addAttribute("result", "fail");
                    model.addAttribute("usernickname", usernickname);
                    return "insertNickName";
                }
            }
        }
        return "insertNickName";
    }

    /** 로그인 후 페이지 이동 */
    @RequestMapping(value = "/testPage/sidebar", method = RequestMethod.GET)
    public String sidebar() {
        return "testPage/sidebar";
    }

	/** 아이디 중복확인 화면 요청 */
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public String idCheck() {
		return "user/idCheck_temp";
	}

	/** 아이디 중복확인 처리 요청 */
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(String userid, Model model) {
		Parents p = dao.ParentsSelectOne(userid);
		if (p != null) {
			model.addAttribute("result", "success");
			model.addAttribute("userid", p.getParents_id());
			model.addAttribute("user", p);
		} else {
			Teacher t = dao.TeacherSelectOne(userid);
			if (t != null) {
				model.addAttribute("result", "success");
				model.addAttribute("userid", t.getTeacher_id());
				model.addAttribute("user", t);
			} else {
				Student s = dao.StudentSelectOne(userid);
				if(s != null) {
					model.addAttribute("result", "success");
					model.addAttribute("userid", s.getStudent_id());
					model.addAttribute("user", s);
				}
				else {
					model.addAttribute("result", "fail");
					model.addAttribute("userid", userid);
					return "user/idCheck_temp";
				}
			}
		}
		return "user/idCheck_temp";
	}

	/** 회원가입 처리 요청 */
	@RequestMapping(value="/joinform", method = RequestMethod.POST)
	public String joinus(Parents p, Teacher t, Student s,
				@RequestParam(value="usertype", defaultValue="student") String usertype,
				String username, String pass, String name, String email) {
		System.out.println(usertype +", " + username +", " + pass +", " + name +", " + email);

		if(usertype.equals("student")) {
			s.setStudent_id(username);
			s.setStudent_pw(pass);
			s.setStudent_name(name);
			s.setStudent_email(email);
			
			dao.StudentInsert(s);
		} else if(usertype.equals("parents")) {
			p.setParents_id(username);
			p.setParents_pw(pass);
			p.setParents_name(name);
			p.setParents_email(email);
			
			dao.ParentsInsert(p);
		} else if(usertype.equals("teacher")) {
			t.setTeacher_id(username);
			t.setTeacher_pw(pass);
			t.setTeacher_name(name);
			t.setTeacher_email(email);
			
			dao.TeacherInsert(t);
		}

		return "redirect:/";
	}

	@RequestMapping(value="/googleLogin", method = RequestMethod.POST)
	public String googleLogin(String id, String name, String email, HttpSession session){
		String googleId = id + "@google.com";



		session.setAttribute("loginId",googleId);
        session.setAttribute("tempname",name);
        session.setAttribute("tempemail",email);

		return "success";
	}

	/**로그인 처리를 요청함 */
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(Model model, String username, String pass, HttpSession session	) {
		Parents p = dao.ParentsSelectOne(username);
		Teacher t = dao.TeacherSelectOne(username);
		Student s = dao.StudentSelectOne(username);
		if(p != null && (p.getParents_pw().equals(pass))) {
			session.setAttribute("loginId",   p.getParents_id());
			session.setAttribute("loginName", p.getParents_nickname());
			session.setAttribute("type", "parents");
			return "testPage/sidebar";
		} else if(t != null && (t.getTeacher_pw().equals(pass))) {
			session.setAttribute("loginId",   t.getTeacher_id());
			session.setAttribute("loginName", t.getTeacher_nickname());
			session.setAttribute("type", "teacher");
			return "testPage/sidebar";
		} else if(s != null && (s.getStudent_pw().equals(pass))) {
			session.setAttribute("loginId",   s.getStudent_id());
			session.setAttribute("loginName", s.getStudent_nickname());
			session.setAttribute("type", "student");
			return "testPage/sidebar";
		} else {
			model.addAttribute("message", "로그인을 할 수 없습니다.");
			return "redirect:/";
		}
	}

	/** Logout */
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		String id = (String)session.getAttribute("loginId");

		session.invalidate(); // 세션에 있는거 한방에 다 지움
		return "redirect:/";
	}

//	/** Logout */
//	@RequestMapping(value="/naverLogout", method = RequestMethod.GET)
//	@ResponseBody
//	public String naverLogout(HttpSession session) {
//		session.invalidate(); // 세션에 있는거 한방에 다 지움
//		return "redirect:/";
//	}

	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modify(HttpSession session, Model model) {
		String id = (String) session.getAttribute("loginId");
		String type = (String) session.getAttribute("type");

		if(type.equals("student")){
			Student s = dao.StudentSelectOne(id);
			model.addAttribute("type", "Student");
			model.addAttribute("userid", s.getStudent_id());
			model.addAttribute("email", s.getStudent_email());
			model.addAttribute("name", s.getStudent_name());
			model.addAttribute("nickname", s.getStudent_nickname());
		} else if(type.equals("teacher")){
			Teacher t = dao.TeacherSelectOne(id);
			model.addAttribute("type", "Teacher");
			model.addAttribute("userid", t.getTeacher_id());
			model.addAttribute("email", t.getTeacher_email());
			model.addAttribute("name", t.getTeacher_name());
			model.addAttribute("nickname", t.getTeacher_nickname());
		} else {
			Parents p = dao.ParentsSelectOne(id);
			model.addAttribute("type", "Parents");
			model.addAttribute("userid", p.getParents_id());
			model.addAttribute("email", p.getParents_email());
			model.addAttribute("name", p.getParents_name());
			model.addAttribute("nickname", p.getParents_nickname());
		}
		return "user/updateForm_temp";
	}

	@RequestMapping(value="/callback", method = RequestMethod.GET)
	public String navercallback() {
		return "chart/callback";
	}
	
	@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
	public String userUpdate(Parents p, Teacher t, Student s,
			String type, String userid, String pw, String name, String email, String nickname) {
		
		if(type.equals("Student")) {
			s.setStudent_id(userid);
			s.setStudent_pw(pw);
			s.setStudent_name(name);
			s.setStudent_email(email);
			s.setStudent_nickname(nickname);
			
			dao.StudentUpdate(s);
		} else if(type.equals("Parents")) {
			p.setParents_id(userid);
			p.setParents_pw(pw);
			p.setParents_name(name);
			p.setParents_email(email);
			p.setParents_nickname(nickname);

			dao.ParentsUpdate(p);
		} else if(type.equals("Teacher")) {
			t.setTeacher_id(userid);
			t.setTeacher_pw(pw);
			t.setTeacher_name(name);
			t.setTeacher_email(email);
			t.setTeacher_nickname(nickname);
			
			dao.TeacherUpdate(t);
		}
		
		return "testPage/sidebar";
	}
}