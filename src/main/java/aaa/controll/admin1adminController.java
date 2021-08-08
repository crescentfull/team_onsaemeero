package aaa.controll;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aaa.db.adminBoardMapp;
import aaa.vo.UserVo;

@Controller
public class admin1adminController {
	
	@Resource
	adminBoardMapp mapp;
	
	
	@RequestMapping("/admin1/admin/manage")
	ModelAndView admin(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("/admin1/adminBoard/regNdel");
		
		if(session.getAttribute("userdata")==null) {
			mav = new ModelAndView ("alert");
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo vo = (UserVo)session.getAttribute("userdata");
			if(vo.getKind()!=1) {
				mav = new ModelAndView ("alert");
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		int cnt = mapp.adminCnt();
		
		if(cnt == 0 ) {
			mav.addObject("xxx", 0);
		}else {
			mav.addObject("adminB", mapp.bAdminMapp());
		}
		return mav;
	}
	
	@RequestMapping("/admin1/admin/delete")
	ModelAndView delete(@RequestParam(required = false, defaultValue = "") String id,HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
		if(session.getAttribute("userdata")==null) {
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo vo = (UserVo)session.getAttribute("userdata");
			if(vo.getKind()!=1) {
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		mapp.bAdminDelete(id);
		
		String url = "/admin1/admin/manage";
		String msg = "일반회원으로 수정 되었습니다.";
		
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		
		
		return mav;
	}
}
