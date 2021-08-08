package aaa.controll;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import aaa.db.rsvMapp;
import aaa.vo.ReservationVO;
import aaa.vo.UserVo;
import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
@Controller
public class admin1ReservationController {
	
	@Resource
	aaa.db.rsvMapp rsvTtMapp;
	
	@Resource
	aaa.db.rsvMapp rsvBcMapp;
	
	@Resource
	aaa.db.rsvMapp rsvDel;
	
	@RequestMapping("/admin1/reservation/total")
	ModelAndView rsvtotal(ReservationVO vo, HttpSession session) {
		ModelAndView mav  = new ModelAndView("/admin1/reserveManage/schTotal");
		if(session.getAttribute("userdata")==null) {
			mav = new ModelAndView ("alert");
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo uservo = (UserVo)session.getAttribute("userdata");
			if(uservo.getKind()!=1) {
				mav = new ModelAndView ("alert");
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		
		if(vo.getPageIndex() == null ) {
			vo.setPageIndex("1");
		}
		
		
		int pageNum = Integer.parseInt(vo.getPageIndex());
		if(pageNum >0) {
			String setPi = Integer.toString((pageNum-1)*10);
			vo.setPageIndex(setPi);
		}else {
			vo.setPageIndex("1");
		}
		
		
		
		if(vo.getFirdate() == "" && vo.getSecdate() != "" ) {
			mav = new ModelAndView("alert");
			mav.addObject("msg", "날짜는 하나만 선택이 불가합니다.");
			mav.addObject("url", "/admin1/reservation/total");
			return mav;
		}else if(vo.getSecdate() == "" &&vo.getFirdate() != "" ) {
			mav = new ModelAndView("alert");
			mav.addObject("msg", "날짜는 하나만 선택이 불가합니다.");
			mav.addObject("url", "/admin1/reservation/total");
			return mav;
		}else if(vo.getFirdate() == null) {
			vo.setFirdate("");
			vo.setSecdate("");
			System.out.println("여기 거쳐야함");
		}else if(vo.getName() == null) {
			vo.setName("");
		}
		
		
		
		
		
		List<ReservationVO> testResv = rsvTtMapp.rsvList(vo);
		
		if(testResv.isEmpty()){
			mav.addObject("inNull", "");
			return mav;
		}else {
			
			mav.addObject("total", rsvTtMapp.rsvList(vo));
			
			mav.addObject("indate", vo.getFirdate());
			mav.addObject("outdate", vo.getSecdate());
			mav.addObject("cnt", rsvTtMapp.rsvListCnt(vo));
			mav.addObject("name", vo.getName());
			return mav;
		}
		
		
		
	}
	@RequestMapping("/admin1/reservation/branch")
	ModelAndView rsvbranch(ReservationVO vo, HttpSession session) {
		ModelAndView mav  = new ModelAndView("/admin1/reserveManage/schBranch");
	
		if(session.getAttribute("userdata")==null) {
			mav = new ModelAndView ("alert");
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo uvo = (UserVo)session.getAttribute("userdata");
			if(uvo.getKind()!=1) {
				mav = new ModelAndView ("alert");
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		if(vo.getB_name() == null ) {
			mav.addObject("inNull", "");
			return mav;
		}
		
		
		if(vo.getB_name().equals("")) {
			mav = new ModelAndView("alert");
			mav.addObject("msg", "지점은 필수 선택입니다.");
			mav.addObject("url", "/admin1/reservation/branch");
			return mav;
		}else if(vo.getFirdate() == "" && vo.getSecdate() != "" ) {
			mav = new ModelAndView("alert");
			mav.addObject("msg", "날짜는 하나만 선택이 불가합니다.");
			mav.addObject("url", "/admin1/reservation/branch");
			return mav;
		}else if(vo.getSecdate() == "" && vo.getFirdate() != "" ) {
			mav = new ModelAndView("alert");
			mav.addObject("msg", "날짜는 하나만 선택이 불가합니다.");
			mav.addObject("url", "/admin1/reservation/branch");
			return mav;
		}
		
		
		
		if(vo.getFirdate() == null) {
			vo.setFirdate("");
			vo.setSecdate("");
		}
		if(vo.getId() == null) {
			vo.setId("");
		}
		
		if(vo.getPageIndex() == null ) {
			vo.setPageIndex("1");
		}
		
		
		int pageNum = Integer.parseInt(vo.getPageIndex());
		if(pageNum >0) {
			String setPi = Integer.toString((pageNum-1)*10);
			vo.setPageIndex(setPi);
		}else {
			vo.setPageIndex("1");
		}
		
		System.out.println(vo.getFirdate()+","+vo.getSecdate());
		String branch = vo.getB_name();
		List<ReservationVO> testResv = rsvTtMapp.rsvSubList(vo);
		
		if(testResv.isEmpty()){
			mav.addObject("inNull", "");
			mav.addObject("branch", branch);
			return mav;
		}else {
			
			mav.addObject("total", rsvTtMapp.rsvSubList(vo));
			mav.addObject("branch", branch);
			mav.addObject("name", vo.getName());
			mav.addObject("indate", vo.getFirdate());
			mav.addObject("outdate", vo.getSecdate());
			mav.addObject("cnt", rsvTtMapp.rsvSubListCnt(vo));
			return mav;
		}
	}
	
	@RequestMapping("/admin1/rsvManage/cancel")
	@ResponseBody
	ModelAndView cancel(@RequestParam("no") int no, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("/alert");
		
		
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
		
		
		int rst = rsvDel.resvDel(no);
		System.out.println("리턴값: "+rst);
		String url = "";
		String msg = "";
		if(rst == 1) {
			url = "/admin1/reservation/total";
			msg = "예약취소 성공했습니다.";
			mav.addObject("url", url);
			mav.addObject("msg", msg);
		}else {
			url = "/admin1/reservation/total";
			msg = "알 수 없는 오류 발생.";
			mav.addObject("url", url);
			mav.addObject("msg", msg);
		}
		 
		
		return mav;
	}
	
	
}
