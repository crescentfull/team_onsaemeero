package aaa.controll;

import java.util.Calendar;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aaa.db.RoomMapp;
import aaa.db.bchMapp;
import aaa.db.BoardMapp;
import aaa.vo.BoardVO;
import aaa.vo.ReservationVO;
import aaa.vo.RoomOptionVO;
import aaa.vo.RoomVO;
import aaa.vo.UserVo;

@Controller
public class BranchController {


	



	@RequestMapping("/branch/branch_su_sightseeing")
	ModelAndView su_sightseeing() {
		
		ModelAndView mav = new ModelAndView("/branch/branch_su_sightseeing");
		
		return mav;
	}
	@RequestMapping("/branch/branch_su_place")
	ModelAndView su_place() {
		
		ModelAndView mav = new ModelAndView("/branch/branch_su_place");
		
		return mav;
	}
	
	
	
	


	@RequestMapping("/branch/branch_gr_sightseeing")
	ModelAndView gr_sightseeing() {
		
		ModelAndView mav = new ModelAndView("/branch/branch_gr_sightseeing");
		
		return mav;
	}
	@RequestMapping("/branch/branch_gr_place")
	ModelAndView gr_place() {
		
		ModelAndView mav = new ModelAndView("/branch/branch_gr_place");
		
		return mav;
	}
	
	
	
	


	@RequestMapping("/branch/branch_jj_sightseeing")
	ModelAndView jj_sightseeing() {
		
		ModelAndView mav = new ModelAndView("/branch/branch_jj_sightseeing");
		
		return mav;
	}
	@RequestMapping("/branch/branch_jj_place")
	ModelAndView jj_place() {
		
		ModelAndView mav = new ModelAndView("/branch/branch_jj_place");
		
		return mav;
	}
	
	
	
	
	


	@RequestMapping("/branch/branch_kj_sightseeing")
	ModelAndView kj_sightseeing() {
		
		ModelAndView mav = new ModelAndView("/branch/branch_kj_sightseeing");
		
		return mav;
	}
	@RequestMapping("/branch/branch_kj_place")
	ModelAndView kj_place() {
		
		ModelAndView mav = new ModelAndView("/branch/branch_kj_place");
		
		return mav;
	}
}
