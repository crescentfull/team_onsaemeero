package aaa.controll;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import aaa.db.UserMapper;
import aaa.service.MailService;
import aaa.vo.ReservationVO;
import aaa.vo.UserVo;

@Controller
public class MailController {
	
	@Resource
	UserMapper mapper;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("/mail/doSend")
	@ResponseBody
	public ModelAndView doSend(HttpSession session, HttpServletResponse response,
			UserVo vo) {
		
		UserVo sessionuser = (UserVo)session.getAttribute("userdata");
		
		if(!vo.getEmail().equals(sessionuser.getEmail())) {
			ModelAndView mav = new ModelAndView("alert");
			mav.addObject("msg", "이메일이 다릅니다. 변경 후 이용 해 주세요.");
			mav.addObject("url", "/login/mypage");
			return mav;
		}
		
		System.out.println(vo);
		
		String alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String[] each = alpha.split("");
		for(int i=0; i<1000; i++) {
			int n = (int)Math.floor(Math.random()*36);
			String temp = each[0];
			each[0] = each[n];
			each[n] = temp;
		}
		String no = "";
		for(int i=0; i<7; i++) {
			no += each[i];
		}
		
		
		ModelAndView sendRs = mailService.send(vo.getEmail(), "인증번호", no);
		
		Cookie coo = new Cookie("chkno", no);
		response.addCookie(coo);
		
		return sendRs;
	}
	
	@RequestMapping("/mail/mailchk")
	String mailchk(){
		return "mail/mailchk";
	}
	
	@RequestMapping("/mail/chkno")
	ModelAndView mailchk(@CookieValue(value="chkno" , defaultValue = "")String no,
			@RequestParam("chk")String input,HttpServletResponse response,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		if(input.equals(no)) {
			
			Cookie coo = new Cookie("chkno", "");
			coo.setMaxAge(0);
			response.addCookie(coo);
			
			UserVo vo = (UserVo)session.getAttribute("userdata");
			vo.setEmailchk("y");
			
			session.setAttribute("userdata", vo);
			
			mapper.mailchk(vo);
			
			mav.addObject("msg", "인증되었습니다.");
			mav.addObject("url", "../login/mypage");
		}else {
			mav.addObject("msg", "인증 실패");
			mav.addObject("url", "mailchk");
		}
		
		return mav;
	}
	
	@RequestMapping("/mail/sendReservation")
	ModelAndView sendReservation(HttpSession session) {
		
		UserVo vo = new UserVo();
		ReservationVO rvo = new ReservationVO();
		
		if(session.getAttribute("userdata")!=null && session.getAttribute("reservation")!=null) {
			vo = (UserVo)session.getAttribute("userdata");
			rvo = (ReservationVO)session.getAttribute("reservation");
			session.removeAttribute("reservation");
		}else {
			ModelAndView mav = new ModelAndView("alert");
			mav.addObject("msg", "로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}
		
		
		ModelAndView sendReservation = mailService.send2(vo.getEmail(), "온새미로 예약 정보", "성함 : " + vo.getName()+"<br>지점명 : "+rvo.getB_name()+
					"<br>호수 : "+rvo.getRoom_name()+"<br>입실일 : "+rvo.getIndate() +"<br>퇴실일 : "+ rvo.getOutdate() + "<br>금액 : "+rvo.getPrice()+
					"<br>요청사항 : "+rvo.getRequestBr());
		
		return sendReservation;
	}
	

}
