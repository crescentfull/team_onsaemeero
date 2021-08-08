package aaa.service;

import org.springframework.web.servlet.ModelAndView;

public interface MailService {
	public ModelAndView send(String email, String title, String body);
	public ModelAndView send2(String email, String title, String body);
	
}
