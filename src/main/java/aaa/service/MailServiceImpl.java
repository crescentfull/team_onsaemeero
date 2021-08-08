package aaa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import aaa.handler.MailHandler;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private JavaMailSender sender;

	@Override
	public ModelAndView send(String email, String title, String body) {
		
		MailHandler mail;
		try {
			mail = new MailHandler(sender);
			mail.setFrom("green.teamproj1@gmail.com", "온새미로");
			mail.setTo(email);
			mail.setSubject(title);
			mail.setText(body);
			mail.send();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
//		String resultCode = "S-1";
//		String msg = "메일이 발송되었습니다.";
//		
//		Map<String, Object> rs = new HashMap<>();
//		rs.put("resultCode", resultCode);
//		rs.put("msg", msg);
		
		
		ModelAndView mav = new ModelAndView("alert");
		
		mav.addObject("msg", "인증번호가 전송되었습니다.");
		mav.addObject("url", "mailchk");
		
		
		
		return mav;
	}
	
	@Override
	public ModelAndView send2(String email, String title, String body) {
		
		MailHandler mail;
		try {
			mail = new MailHandler(sender);
			mail.setFrom("green.teamproj1@gmail.com", "온새미로");
			mail.setTo(email);
			mail.setSubject(title);
			mail.setText(body);
			mail.send();
		}catch(Exception e) {
			e.printStackTrace();
		}	
		
		ModelAndView mav = new ModelAndView("alert");
		mav.addObject("msg", "예약정보가 등록 된 이메일로 전송되었습니다.");
		mav.addObject("url", "/login/mypage");
		
		return mav;
	}
}
