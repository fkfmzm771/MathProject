package Math.Spring.com.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Math.Spring.com.DAO.UserRepository;
import Math.Spring.com.VO.Parents;
import Math.Spring.com.VO.Student;
import Math.Spring.com.VO.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	UserRepository userDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");

		Teacher t = userDao.TeacherSelectOne(loginId);
		Parents p = userDao.ParentsSelectOne(loginId);
		Student s = userDao.StudentSelectOne(loginId);

		if(t == null && p == null && s == null){
			response.sendRedirect(request.getContextPath()+"/testPage/insertNickName");
			return false;
		}
		
		if(loginId == null) {
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
}