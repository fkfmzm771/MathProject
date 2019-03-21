package Math.Spring.com.Controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Math.Spring.com.DAO.UserDAO;
import Math.Spring.com.VO.Parents;
import Math.Spring.com.VO.Student;
import Math.Spring.com.VO.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class UserController {
	@Autowired
	UserDAO dao;

	/** 회원가입 화면 요청 */
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinus() {
		return "user/joinForm";
	}

	/** 네이버로그인화면 */
	@RequestMapping(value = "/naverInserted", method = RequestMethod.POST)
	@ResponseBody
	public String naverInsert(String name, String email, Model model,
							  HttpSession session, HttpServletResponse response) {
			session.setAttribute("loginId", email);
			session.setAttribute("loginName", name);
			System.out.println(name + ", " + email);

			Parents p = dao.ParentsSelectOne(email);
			if (p != null) {
				session.setAttribute("loginId", email);
				session.setAttribute("loginName", name);
			} else {
				Teacher t = dao.TeacherSelectOne(email);
				if (t != null) {
					session.setAttribute("loginId", email);
					session.setAttribute("loginName", name);
				} else {
					Student s = dao.StudentSelectOne(email);
					if(s != null) {
						session.setAttribute("loginId", email);
						session.setAttribute("loginName", name);
					}
					else {
						model.addAttribute("userid", "email");
						model.addAttribute("name", name);
						return "error";
					}
				}
			}
		return "success";
	}

	/** 아이디 중복확인 화면 요청 */
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public String idCheck() {
		return "user/idCheck";
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
					return "user/idCheck";
				}
			}
		}
		return "user/idCheck";
	}

	/** 회원가입 처리 요청 */
	@RequestMapping(value="/joinus", method = RequestMethod.POST)
	public String joinus(Parents p, Teacher t, Student s,
				@RequestParam(value="usertype", defaultValue="student") String usert,
				String id, String pw, String name, String email, String nickname, String phone
			) {
		if(usert.equals("student")) {
			s.setStudent_id(id);
			s.setStudent_pw(pw);
			s.setStudent_name(name);
			s.setStudent_email(email);
			s.setStudent_nickname(nickname);
			s.setStudent_phone(phone);
			
			dao.StudentInsert(s);
		} else if(usert.equals("parents")) {
			p.setParents_id(id);
			p.setParents_pw(pw);
			p.setParents_name(name);
			p.setParents_email(email);
			p.setParents_nickname(nickname);
			p.setParents_phone(phone);
			
			dao.ParentsInsert(p);
		} else if(usert.equals("teacher")) {
			t.setTeacher_id(id);
			t.setTeacher_pw(pw);
			t.setTeacher_name(name);
			t.setTeacher_email(email);
			t.setTeacher_nickname(nickname);
			t.setTeacher_phone(phone);
			
			dao.TeacherInsert(t);
		}

		return "/";
	}

	/**로그인 처리를 요청함 */
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(boolean idChecked, Model model, String userid, String userpw, // ID저장 체크?
			HttpSession session, HttpServletResponse response
			) {
		Parents p = dao.ParentsSelectOne(userid);
		Teacher t = dao.TeacherSelectOne(userid);
		Student s = dao.StudentSelectOne(userid);
		if(p != null && (p.getParents_pw().equals(userpw))) {
			session.setAttribute("loginId",   p.getParents_id());
			session.setAttribute("loginName", p.getParents_nickname());
			return "index";
		} else if(t != null && (t.getTeacher_pw().equals(userpw))) {
			session.setAttribute("loginId",   t.getTeacher_id());
			session.setAttribute("loginName", t.getTeacher_nickname());
			return "index";
		} else if(s != null && (s.getStudent_pw().equals(userpw))) {
			session.setAttribute("loginId",   s.getStudent_id());
			session.setAttribute("loginName", s.getStudent_nickname());
			return "index";
		} else {
			model.addAttribute("message", "로그인을 할 수 없습니다.");
			return "login";
		}
	}

	/** Logout */
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate(); // 세션에 있는거 한방에 다 지움
		return "redirect:/";
	}

	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modify(HttpSession session, Model model) {
		String id = (String) session.getAttribute("loginId");

		Parents p = dao.ParentsSelectOne(id);
		if (p != null) {
			model.addAttribute("type", "Parents");
			model.addAttribute("userid", p.getParents_id());
			model.addAttribute("email", p.getParents_email());
			model.addAttribute("name", p.getParents_name());
			model.addAttribute("nickname", p.getParents_nickname());
			model.addAttribute("phone", p.getParents_phone());
		} else {
			Teacher t = dao.TeacherSelectOne(id);
			if (t != null) {
				model.addAttribute("type", "Teacher");
				model.addAttribute("userid", t.getTeacher_id());
				model.addAttribute("email", t.getTeacher_email());
				model.addAttribute("name", t.getTeacher_name());
				model.addAttribute("nickname", t.getTeacher_nickname());
				model.addAttribute("phone", t.getTeacher_phone());
			} else {
				Student s = dao.StudentSelectOne(id);
				if(s != null) {
					model.addAttribute("type", "Student");
					model.addAttribute("userid", s.getStudent_id());
					model.addAttribute("email", s.getStudent_email());
					model.addAttribute("name", s.getStudent_name());
					model.addAttribute("nickname", s.getStudent_nickname());
					model.addAttribute("phone", s.getStudent_phone());
				}
			}
		}
		
		return "user/updateForm";
	}

	@RequestMapping(value="/callback", method = RequestMethod.GET)
	public String navercallback() {
		return "callback";
	}
	
	@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
	public String userUpdate(Parents p, Teacher t, Student s,
			String type, String userid, String pw, String name, String email, String nickname, String phone) {
		
		if(type.equals("Student")) {
			s.setStudent_id(userid);
			s.setStudent_pw(pw);
			s.setStudent_name(name);
			s.setStudent_email(email);
			s.setStudent_nickname(nickname);
			s.setStudent_phone(phone);
			
			dao.StudentUpdate(s);
		} else if(type.equals("Parents")) {
			p.setParents_id(userid);
			p.setParents_pw(pw);
			p.setParents_name(name);
			p.setParents_email(email);
			p.setParents_nickname(nickname);
			p.setParents_phone(phone);
			
			dao.ParentsUpdate(p);
		} else if(type.equals("Teacher")) {
			t.setTeacher_id(userid);
			t.setTeacher_pw(pw);
			t.setTeacher_name(name);
			t.setTeacher_email(email);
			t.setTeacher_nickname(nickname);
			t.setTeacher_phone(phone);
			
			dao.TeacherUpdate(t);
		}
		
		return "main";
	}
}