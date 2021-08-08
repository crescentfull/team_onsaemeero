package aaa.controll;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import aaa.db.bchMapp;
import aaa.vo.RoomOptionVO;
import aaa.vo.RoomVO;
import aaa.vo.UserVo;
import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class admin1BranchController {
	@Resource
	bchMapp branchM;
	
	@RequestMapping("/admin1/branch/charge")
	public ModelAndView roomCharge(HttpSession session){
		
		ModelAndView mav = new ModelAndView("/admin1/branchManage/roomCharge");
		HashMap<String,RoomVO> chargeList = new HashMap<>();
		
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
		
		branchM.roomPrice();
		for(RoomVO i : branchM.roomPrice()) {
			if(i.getB_name().equals("온새미로-서울")) {
				chargeList.put("서울", i);
			}else if(i.getB_name().equals("온새미로-강릉")) {
				chargeList.put("강릉", i);
			}else if(i.getB_name().equals("온새미로-전주")) {
				chargeList.put("전주", i);
			}else {
				chargeList.put("경주", i);
			}
		}
		mav.addObject("map", chargeList); 
		return mav;
	}
	
	@RequestMapping("/admin1/branch/fix")
	@ResponseBody
	ModelAndView fix(
			@RequestParam(value = "su1",required = false,defaultValue = "0") int su1, 
			@RequestParam(value = "su2",required = false,defaultValue = "0") int su2,
			@RequestParam(value = "gr1",required = false,defaultValue = "0") int gr1,
			@RequestParam(value = "gr2",required = false,defaultValue = "0") int gr2,
			@RequestParam(value = "jj1",required = false,defaultValue = "0") int jj1,
			@RequestParam(value = "jj2",required = false,defaultValue = "0") int jj2,
			@RequestParam(value = "gj1",required = false,defaultValue = "0") int gj1,
			@RequestParam(value = "gj2",required = false,defaultValue = "0") int gj2,
			HttpSession session) {
			
			
			ModelAndView mav = new ModelAndView("alert");
			
			
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
			
			RoomVO vo = new RoomVO();
			
		
			if(su1 != 0) {
				vo.setB_name("온새미로-서울");
				vo.setBlack_price(su1);
				branchM.fixBlackPrice(vo);
			}
			if(su2 != 0) {
				vo.setB_name("온새미로-서울");
				vo.setRed_price(su2);
				branchM.fixRedPrice(vo);
			}
			if(gr1 != 0) {
				vo.setB_name("온새미로-강릉");
				vo.setBlack_price(gr1);
				branchM.fixBlackPrice(vo);
			}
			if(gr2 != 0) {
				vo.setB_name("온새미로-강릉");
				vo.setRed_price(gr2);
				branchM.fixRedPrice(vo);
			}
			if(jj1 != 0) {
				vo.setB_name("온새미로-전주");
				vo.setBlack_price(jj1);
				branchM.fixBlackPrice(vo);
			}
			if(jj2 != 0) {
				vo.setB_name("온새미로-전주");
				vo.setRed_price(jj2);
				branchM.fixRedPrice(vo);
			}
			if(gj1 != 0) {
				vo.setB_name("온새미로-경주");
				vo.setBlack_price(gj1);
				branchM.fixBlackPrice(vo);	
			}
			if(gj2 != 0) {
				vo.setB_name("온새미로-경주");
				vo.setRed_price(gj2);
				branchM.fixRedPrice(vo);
			}
			
			String url = "/admin1/branch/charge";
			String msg = "수정완료";
			mav.addObject("url",url);
			mav.addObject("msg",msg);

			return mav;
	}
	@RequestMapping("/admin1/branch/option")
	public ModelAndView roomOption(RoomOptionVO vo,HttpSession session){
		
		ModelAndView mav = new ModelAndView("/admin1/branchManage/optionManage");
		
		
		if(session.getAttribute("userdata")==null) {
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo uvo = (UserVo)session.getAttribute("userdata");
			if(uvo.getKind()!=1) {
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		
		int a = branchM.optionCntString("온새미로-서울");
		int b = branchM.optionCntString("온새미로-강릉");
		int c = branchM.optionCntString("온새미로-전주");
		int d = branchM.optionCntString("온새미로-경주");
		
		if(a==0) {
			mav.addObject("b1", 1);
		}else {
			mav.addObject("osmrSu", branchM.optionList("온새미로-서울"));
		}
		if(b==0) {
			mav.addObject("b2", 1);
		}else {
			mav.addObject("osmrGr", branchM.optionList("온새미로-강릉"));
		}
		if(c==0) {
			mav.addObject("b3", 1);
		}else {
			mav.addObject("osmrJj", branchM.optionList("온새미로-전주"));
		}
		if(d==0) {
			mav.addObject("b4", 1);
		}else {
			mav.addObject("osmrGj", branchM.optionList("온새미로-경주"));
		}
		
		return mav;
	}
	
	@RequestMapping("/admin1/branch/option_reg")
	@ResponseBody
	ModelAndView option_reg(RoomOptionVO vo, HttpSession session) {
			
		ModelAndView mav = new ModelAndView("alert");
		
		if(session.getAttribute("userdata")==null) {
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo uvo = (UserVo)session.getAttribute("userdata");
			if(uvo.getKind()!=1) {
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		
		String url="/admin1/branch/option";
		String msg="실행됨";
		
		int cnt = branchM.optionCnt(vo);
		if(cnt < 3) {
			branchM.insertOption(vo);
			msg="이벤트 등록완료.";
		}else {
			msg="등록 갯수는 최대 3개 입니다.";
		}
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		return mav;
	}
	
	@RequestMapping("/admin1/option/delete")
	@ResponseBody
	ModelAndView delete(RoomOptionVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		branchM.deleteOption(vo);
		
		String url="/admin1/branch/option";
		String msg="삭제완료.";
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
}

