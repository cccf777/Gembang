package com.web.humor.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.web.humor.content.ContentSvc;
import com.web.humor.content.VisitCountVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginCtr {
	private static final Integer cookieExpire = 60 * 60 * 24 * 30; // 1month=30day
	
	@Autowired
	private UserSvc UserSvc;
	
	//로그인 화면
	@RequestMapping(value = "user/login")
	public String Login(HttpServletRequest req, ModelMap modelMap) {
		System.out.println("login method 에 들어옴");
		String userid = get_Cookie("sid", req);
		modelMap.addAttribute("id", userid); //req.setatrribute 
		return "user/login";
	}
	
	//로그인 체크
	@RequestMapping(value = "user/loginCheck")
	public String LoginCheck(HttpServletRequest req,HttpServletResponse resp,LoginVO lv,ModelMap modelMap) throws Exception {
		UserVO uv= UserSvc.LoginCheck(lv);
		
		//조회 결과가 없다면
		if(uv ==null) {
			modelMap.addAttribute("ment","Incorrect ID or password.");
			return "user/login";
		}else {
			
		
		log.info("id : " + lv.getId());
		log.info("id : " + lv.getPass());
		//세션 처리 시작
		HttpSession session = req.getSession();
		session.setAttribute("userID", uv.getId());
		session.setAttribute("userRank", uv.getRank());
		session.setAttribute("userName", uv.getName());
		session.setAttribute("commentFlag", uv.getCommentFlag());		
		//쿠키 생성
		if("Y".equals(lv.getRemember())){ //remember me 체크
			setCookie("sid", lv.getId(), resp);
		}else {
			setCookie("sid", "", resp);
		}
		}
		return "redirect: ../main";
	}
	
	//로그아웃
	@RequestMapping(value = "user/logout")
	public String Logout(HttpServletRequest req, ModelMap modelMap) {
		HttpSession session =req.getSession();
		session.removeAttribute("userID");
		session.removeAttribute("userName");
		session.removeAttribute("userRank");
		
		return "redirect: ../main";
	}
	
	//회원가입
	@RequestMapping(value = "user/SignUp")
	public String SignUp(HttpServletRequest req, ModelMap modelMap) {
		
		return "user/sign-up";
	}
	
	//회원 가입 입력 
	@RequestMapping(value = "user/registUser")
	public String SignUp(HttpServletRequest req, UserVO uv, ModelMap modelMap) {
		UserSvc.registUser(uv);
		return "/etc/Success";
	}
	
	//아이디 체크
	@RequestMapping(value = "user/idCheck")
	public String IdCehck(HttpServletRequest req, ModelMap modelMap) {
		String id=req.getParameter("id");
		
		int cnt=UserSvc.idcheck(id); //입력한 아이디 카운트 조회
		modelMap.addAttribute("cnt", cnt); //1이상이면 아이디 있음 
		modelMap.addAttribute("id", id);
		
		return "user/idCheck";
	}

	// 쿠키불러오기
	private String get_Cookie(String cid, HttpServletRequest req) {
		String ret = "";

		if (req == null) {
			return ret;
		}

		Cookie[] cookies = req.getCookies();
		if (cookies == null) {
			return ret;
		}
		for (Cookie ck : cookies) {
			if (ck.getName().equals(cid)) {

				ret = ck.getValue();
				System.out.println("ck.getName : " + ck.getName()); // sid
				System.out.println("ck.getValue : " + ck.getValue()); // sid가 가진 값 : 내 아이디 값
				System.out.println("ret : " + ret);
				ck.setMaxAge(cookieExpire);
				break;
			}
		}
		return ret;
	}
 
	// 쿠키생성
	private void setCookie(String cid, String p_id, HttpServletResponse resp) {
		Cookie ck = new Cookie(cid, p_id); // sid, p_id(접속한 사람 id) //쿠키 매게변수 String String //기능은 필요하지 않을까 ?
		ck.setPath("/"); // 쿠키 생성될때 경로
		ck.setMaxAge(cookieExpire); // 쿠키의 보관 날짜는
		resp.addCookie(ck); // 출력부분저장
	}
	
	 
     public void sessionCreated(HttpSessionEvent arg0,HttpServletRequest req) throws Exception{
         HttpSession session = arg0.getSession();
         WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
         //등록되어있는 빈을 사용할수 있도록 설정해준다         
         //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
         ContentSvc visitCountDAO = (ContentSvc)wac.getBean("visitCounterDAO");
         VisitCountVO vo = new VisitCountVO();
         vo.setIp(req.getRemoteAddr());
         vo.setAgent(req.getHeader("User-Agent"));//브라우저 정보
         vo.setRefer(req.getHeader("referer"));//접속 전 사이트 정보
         visitCountDAO.insertVisitor(vo);
     }
     
	
}