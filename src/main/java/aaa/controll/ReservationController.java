package aaa.controll;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aaa.db.RoomMapp;
import aaa.db.bchMapp;
import aaa.vo.BlacklistVO;
import aaa.vo.RedCalculateVo;
import aaa.vo.ReservationVO;
import aaa.vo.RoomOptionVO;
import aaa.vo.RoomVO;
import aaa.vo.UserVo;

@Controller
public class ReservationController {

	@Resource
	RoomMapp mapper;
	
	@Resource
	bchMapp bchmapper;
	
	
	@RequestMapping("/reservation/roomList")
	ModelAndView list(ReservationVO rvo) {
		
		ModelAndView mav = new ModelAndView("reservation/roomList");
		
			mav.addObject("roomData",mapper.roomSearch(rvo));
			
		return mav;
	}
	
	@RequestMapping("branch/branch")
	   String branch() {
	      return "branch/branch";
	   }
	
	@RequestMapping("/reservation/calendar")
	ModelAndView cd(HttpSession session, RoomVO vo) {
		
		ModelAndView mav = new ModelAndView("/reservation/calendar");
		
		mav.addObject("roomvo", vo);
		
		UserVo uservo = new UserVo();
		
		if(session.getAttribute("userdata")!=null) {
			uservo = (UserVo)session.getAttribute("userdata");
		}
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int dt = cal.get(Calendar.DATE);
		
		String todate = "";
		if(month<10) {
			todate = year + "-0" + month + "-" + dt;
		}else {
			todate = year + "-" + month + "-" + dt;
		}
		
		System.out.println(vo);
		
		String id = uservo.getId();
		ReservationVO rvo = new ReservationVO();
		
		rvo.setId(id);
		rvo.setIndate(todate);
		
		mav.addObject("nowReservation", mapper.nowReservation(rvo));
		
		
		return mav;
	}
	

	@RequestMapping("/reservation/payment")
	ModelAndView payment(
			HttpSession session, RoomOptionVO rvo, BlacklistVO bvo,
			@RequestParam("red_price")int red_price,
			@RequestParam("indate")String indate,
			@RequestParam("outdate")String outdate) {
		
		ModelAndView mav = new ModelAndView("alert");
			

		if(session.getAttribute("userdata")!=null) {
			
			UserVo uservo = (UserVo)session.getAttribute("userdata");
			if(uservo.getUseynb().equals("b")) {
				mav.addObject("msg", "블랙리스트는 이용하실 수 없습니다.");
				mav.addObject("url", "/reservation/calendar");
				return mav;
			}else if(!uservo.getEmailchk().equals("y")) {
				mav.addObject("msg", "이메일 인증 후 이용하실 수 있습니다.");
				mav.addObject("url", "/login/mypage");
				return mav;
			}

		mav = new ModelAndView("/reservation/payment");
			
		}else{
			mav.addObject("msg", "로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}	
		
				
		mav.addObject("op",bchmapper.addOptionList(rvo));
		
		Calendar incld = Calendar.getInstance();
		Calendar outcld = Calendar.getInstance();
		
		Date d_indate = DateCast.strToDate(indate);
		Date d_outdate = DateCast.strToDate(outdate);
		
		incld.setTime(d_indate);
		outcld.setTime(d_outdate);
		
		int red_date = 0;
		int totalDate = 0;
		while(!incld.after(outcld)) {
			int day = incld.get(Calendar.DAY_OF_WEEK);
			System.out.println(day);
			if(day==6 || day==7) {
				red_date++;
			}
			incld.add(Calendar.DATE, 1);
			totalDate++;
		}
		int outday = outcld.get(Calendar.DAY_OF_WEEK);
		if(outday==6||outday==7) {
			red_date--;
		}
		totalDate--;
		RedCalculateVo calvo = new RedCalculateVo();
		calvo.setRed_date(red_date);
		calvo.setRed_price(red_price);
		mav.addObject("redData", calvo);
		mav.addObject("totalDate", totalDate);
			
		return mav;
	}
	
	
	@RequestMapping("/reservation/reservationchk")
	ModelAndView reservationChk(ReservationVO rvo, HttpSession session,
			@RequestParam("select1")String select1,
			@RequestParam("select2")String select2,
			@RequestParam("select3")String select3,
			@RequestParam("cardfirst")String card1,
			@RequestParam("cardsecond")String card2,
			@RequestParam("cardthird")String card3,
			@RequestParam("cardfourth")String card4,
			HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("confirm");
		
		session.setAttribute("reservation", rvo);
		
		String msg="결제하시겠습니까?";
		String url ="/reservation/reservationReg";
		
		if(session.getAttribute("userdata")==null) {
			mav = new ModelAndView("alert");
			
			msg = "로그인 후 이용해 주세요.";
			url = "/login/loginForm";
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			
			return mav;
		}
		
		if(select1.equals("카드선택")) {
			mav = new ModelAndView("alert");
			
			msg = "결제할 카드를 선택해주세요.";
			url = "reservation";
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			
			return mav;
		}else if(card1.equals("")||card1==null || card2.equals("")||card2==null ||
				card3.equals("")||card3==null || card4.equals("") || card4==null) {
			mav = new ModelAndView("alert");
			
			msg = "카드번호를 입력해 주세요.";
			url = "reservation";
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			
			return mav;
		}else if(select2.equals("월 선택")||select3.equals("년 선택")) {
			mav = new ModelAndView("alert");
			
			msg = "유효기간을 입력해 주세요.";
			url = "reservation";
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			
			return mav;
		}
		
		System.out.println(rvo);
		mav.addObject("msg", "결제하시겠습니까?");
		mav.addObject("url", "/reservation/reservationReg");
		
		
		return mav;
		
	}

	
	
	@RequestMapping("/reservation/reservation")
	ModelAndView reservation(ReservationVO rvo,
			@RequestParam(value="bbq", required=false)String bbq,
			@RequestParam(required=false, value="hanbok")String hanbok,
			@RequestParam(required=false, value="jangj")String jangj,
			HttpSession session) {
		
		if(session.getAttribute("reservation")!=null) {
			rvo = (ReservationVO)session.getAttribute("reservation");
			session.removeAttribute("reservation");
		}else {
			rvo.setRequest("바베큐"+bbq+"한복"+hanbok+"장작"+jangj+"\n"+rvo.getRequest());
		}
		ModelAndView mav = new ModelAndView("/reservation/reservation");
		
		mav.addObject("reservationdata", rvo);
		
		return mav;
	}
	
	
	@RequestMapping("/reservation/reservationReg")
	ModelAndView reservationReg(ReservationVO rvo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		rvo = (ReservationVO)session.getAttribute("reservation");
		
		System.out.println(rvo);
		System.out.println(rvo.getRequest());
		
		int cnt = mapper.reservationReg(rvo);

		if(cnt>0) { 			
			mav.addObject("msg", rvo.getPrice() + "원이 결제되었습니다.");
			mav.addObject("url", "/mail/sendReservation");
		}else {
			mav.addObject("msg", "결제 실패");
			mav.addObject("url", "reservation");
		}
		
		return mav; 
		
	}
	
	/*
	 * @RequestMapping("branch/branch_su") String branch_su() { return
	 * "branch/branch_su"; }
	 * 
	 * @RequestMapping("branch/branch_jj") String branch_jj() { return
	 * "branch/branch_jj"; }
	 * 
	 * @RequestMapping("branch/branch_gr") String branch_gr() { return
	 * "branch/branch_gr"; }
	 * 
	 * @RequestMapping("branch/branch_kj") String branch_kj() { return
	 * "branch/branch_kj"; }
	 */
}
