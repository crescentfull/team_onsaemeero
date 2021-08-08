package aaa.controll;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import aaa.db.UserMapper;
import aaa.service.ChatService;
import aaa.service.MailService;
import aaa.vo.CancelVo;
import aaa.vo.ChatingVo;
import aaa.vo.ReservationVO;
import aaa.vo.UserVo;

@Controller
public class LoginController {

	@Resource
	UserMapper mapper;
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("base/header")
	String header(HttpSession session, UserVo vo) {
		
		session.getAttribute("userdata");
		
		return "base/header";
	}
	
	@RequestMapping("login/loginForm")
	String loginForm() {
		return "login/loginForm";
	}
	
	@RequestMapping("index")
	String index() {
		return "index";
	}
	
	
	@RequestMapping("/login/loginReg")
	ModelAndView loginReg(UserVo vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("login/loginReg");
		
		UserVo data = mapper.loginReg(vo);
		
		mav = new ModelAndView("alert");
		
		if(data!=null) {
			if(vo.getPw().equals(data.getPw())) {
				session.setAttribute("userdata", data);
				session.setMaxInactiveInterval(3600);
				UserVo chkvo = (UserVo)session.getAttribute("userdata");
				if(chkvo.getUseynb().equals("n")) {
					session.invalidate();
					mav.addObject("msg", "아이디가 없습니다.");
					mav.addObject("url", "loginForm");
				}else {
					mav.addObject("msg", "로그인 성공");
					mav.addObject("url", "/");
					
				}
				
				}else {
				mav.addObject("msg", "비밀번호가 틀렸습니다.");
				mav.addObject("url", "loginForm");
				}
			
		}else {
			mav.addObject("msg", "아이디가 없습니다.");
			mav.addObject("url", "loginForm");
		}
		
		return mav;
	}
	
	@RequestMapping("login/join")
	ModelAndView join(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("login/join");
		
		UserVo vo = new UserVo();
		
		if(session.getAttribute("joinData")!=null) {
			vo = (UserVo)session.getAttribute("joinData");
			mav.addObject("joinData", vo);
		}
		
		session.invalidate();
		
		return mav;
	}
	
	@RequestMapping("login/joinReg")
	ModelAndView joinReg(UserVo vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		String msg = "회원가입 성공! 로그인 하시고 이용해 주세요.";
		String url = "loginForm";
		System.out.println(vo);
		System.out.println(vo.getFront());
		
		vo.setId_no(vo.getFront()+"-"+vo.getBack());
		
		session.setAttribute("joinData", vo);
		
		if(!vo.getFront().equals("")&&!vo.getBack().equals("")&&vo.getFront()!=null&&vo.getBack()!=null) {
			String[] fronts = vo.getFront().split("");
			int age = Integer.parseInt(fronts[0]+fronts[1]);
			if(age<=21&&age>2) {
				if(vo.getBack().equals("3")||vo.getBack().equals("4")) {
					msg = "미성년자는 가입할 수 없습니다.";
					url = "join";
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					return mav;
				}
			}
		}
		
		if(!vo.getPhone().equals("")&&vo.getPhone()!=null) {
			String[] phones = vo.getPhone().split("");
			if(phones.length!=13 && phones.length!=11) {
				msg="휴대폰 번호를 알맞게 입력해 주세요.";
				url="join";
				
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				
				return mav;
				
			}else if(phones.length==11){
				for(int i=0; i<phones.length; i++) {
					int index = vo.getPhone().charAt(i);
					boolean num = false;
					if(index>=48 && index<=57) {
						num=true;
					}
					if(num==false) {
						msg="휴대폰 번호를 알맞게 입력해 주세요.";
						url="join";
						
						mav.addObject("msg", msg);
						mav.addObject("url", url);
						
						return mav;
					}
				}
				vo.setPhone(phones[0]+phones[1]+phones[2]+"-"+phones[3]+phones[4]+phones[5]+phones[6]+
						"-"+phones[7]+phones[8]+phones[9]+phones[10]);
			}else if(phones.length==13) {
				if(!(phones[3].equals("-")&&phones[8].equals("-"))) {
					msg="휴대폰 번호를 알맞게 입력해 주세요.";
					url="join";
					
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					
					return mav;
				}
			}
		}
		
		int cnt = 0;
		
		cnt = mapper.joinReg(vo);
		
		if(cnt>0) {

			mav.addObject("msg", msg);
			mav.addObject("url", url);
		}else {
			mav.addObject("msg", "실패");
			mav.addObject("url", "join");
		}
		
		session.invalidate();
		
		return mav;
	}


	
	
	@RequestMapping("login/mypage")
	String mypage(HttpSession session, Model model) {
		
		UserVo vo = new UserVo();
		
		if(session.getAttribute("userdata")!=null) {
			vo = (UserVo)session.getAttribute("userdata");
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			model.addAttribute("url", "loginForm");
			
			return "alert";
		}
		
		return "login/mypage";
	}
	
	@RequestMapping("login/logOut")
	ModelAndView logOut(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		if(session.getAttribute("userdata")!=null) {
			UserVo vo = (UserVo)session.getAttribute("userdata");
			session.invalidate();
			mav.addObject("msg", vo.getName()+"님 로그아웃 되었습니다.");
		}else {
			mav.addObject("msg", "로그인이 되어있지 않았네요.");
		}
		mav.addObject("url", "/login/loginForm");
		
		return mav;
		
	}
	
	@RequestMapping("login/pwChange")
	ModelAndView pwChange(HttpSession session,
			@RequestParam("existingpw") String e_pw,
			@RequestParam("chpw") String chpw,
			@RequestParam("chkchpw")String chkchpw) {
		
		System.out.println(chpw);
		
		ModelAndView mav = new ModelAndView("alert");
		UserVo vo = new UserVo();
		if(session.getAttribute("userdata")!=null) {
			vo = (UserVo)session.getAttribute("userdata");
		}else {
			mav.addObject("msg", "로그인 후 이용해 주세요.");
			mav.addObject("url", "login/loginForm");
			return mav;
		}
		int cnt = 0;
		
		if(chpw.equals("")||chpw==null) {
			mav.addObject("msg", "변경할 비밀번호를 입력해 주세요.");
			mav.addObject("url", "mypage");
			
			return mav;
		}
		
		if(e_pw.equals(vo.getPw())) {

			if(chpw.equals(chkchpw)) {
				vo.setPw(chpw);
				cnt = mapper.pwChange(vo);
			}else {
				mav.addObject("msg", "변경할 비밀번호를 확인해주세요.");
				mav.addObject("url", "/login/mypage");
			}
		}else {
			mav.addObject("msg", "기존의 비밀번호가 틀렸습니다. 다시 입력해 주세요.");
			mav.addObject("url", "/login/mypage");
		}
		
		if(cnt>0) {
			mav.addObject("msg", vo.getName()+"님 비밀번호가 변경되었습니다. 다시 로그인 해주세요.");
			mav.addObject("url", "/login/loginForm");
		}
		
		return mav;
	}
	
	@RequestMapping("login/deleteUser")
	ModelAndView deleteUser(HttpSession session,
				@RequestParam("existingpw") String e_pw) {
		ModelAndView mav = new ModelAndView("alert");
		
		UserVo vo = new UserVo();
		if(session.getAttribute("userdata")!=null) {
			vo = (UserVo)session.getAttribute("userdata");
		}else {
			mav.addObject("msg", "로그인 후 이용해 주세요.");
			mav.addObject("url", "login/loginForm");
			return mav;
		}
		
		int cnt = 0;
		
		String msg="비밀번호를 다시 입력해 주세요.";
		String url = "mypage";
		
		if(e_pw.equals(vo.getPw())) {
			
			cnt = mapper.deleteUser(vo);
			
			if(cnt>0) {
				session.invalidate();
				msg="회원 탈퇴 성공";
				url = "loginForm";
			}
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	@RequestMapping("login/chkId")
	ModelAndView chkId(UserVo vo, HttpServletResponse response,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		String msg = "이용 가능한 아이디입니다.";
		String url = "join";
		int idchk_cnt = 0;
		
		if(vo.getId().equals("")||vo.getId()==null) {
			msg = "아이디를 입력해 주세요.";
		}else {
			
			String[] idsplit = vo.getId().split("");
			
			if(idsplit.length>10) {
				msg="아이디가 너무 깁니다. 10자 이하로 다시 입력해 주세요.";
				url="join";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				return mav;
			}
			
			for(int i=0; i< idsplit.length; i++) {
				boolean num = false;
				boolean alpha = false;
				int index = vo.getId().charAt(i);
				
				if(index >=97 && index <= 122) {
					alpha = true;
				}else if(index >=48 && index <=57) {
					num = true;
				}
				
				if(alpha==false && num==false || idsplit[i].equals(" ")) {
					msg = "아이디에는 대문자, 공백, 한글을 사용할 수 없습니다.";
					url = "join";
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					return mav;
				}
				
			}
			
			idchk_cnt = mapper.chkId(vo);
			
			if(idchk_cnt>0) {
				msg = "중복된 아이디가 있습니다. 다시 입력해 주세요.";
				
			}else if(idchk_cnt==0){
				vo.setIdok("check");
			}
		}
		
		session.setAttribute("joinData", vo);
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	@RequestMapping("login/chkemail")
	ModelAndView chkEmail(UserVo vo, HttpServletResponse response,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		String msg = "이용 가능한 이메일입니다.";
		String url = "join";
		int emailchk_cnt = 0;
		
		if(vo.getEmail().equals("")||vo.getEmail()==null) {
			msg = "이메일을 입력해 주세요.";
		}else {
			
			emailchk_cnt = mapper.chkEmail(vo);
			
			if(emailchk_cnt>0) {
				msg = "중복된 이메일이 있습니다. 다시 입력해 주세요.";
			}else {
				vo.setEmailok("check");
			}
		}
		
		session.setAttribute("joinData", vo);
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	@RequestMapping("login/find")
	String find() {
		return "login/find";
	}
	
	@RequestMapping("login/findId")
	String findId() {
		return "login/findId";
	}
	
	@RequestMapping("login/findIdReg")
	ModelAndView findIdRed(UserVo vo) {
		
		UserVo idvo = mapper.findIdReg(vo);
		
		String msg = "등록된 이메일로 전송되었습니다.";
		String url = "loginForm";
		
		String id="";
		ModelAndView mav = new ModelAndView();
		if(idvo==null) {
			msg = "등록된 아이디가 없습니다.";
			url = "find";
		}else {
			id = idvo.getId();
			mav =  mailService.send(vo.getEmail(), "아이디", id);
		}
		
		
		mav = new ModelAndView("alert");
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	@RequestMapping("login/findPw")
	String findPw() {
		return "login/findPw";
	}
	
	@RequestMapping("login/findPwReg")
	ModelAndView findPwRed(UserVo vo) {
		
		System.out.println(vo);
		
		int pwcnt = mapper.findPwCnt(vo);
		
		System.out.println(vo);
		
		ModelAndView mav = new ModelAndView();
		
		String msg = "등록된 이메일로 전송되었습니다.";
		String url = "loginForm";
		
		if(pwcnt>0) {
			
			String alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			String[] each = alpha.split("");
			for(int i=0; i<1000; i++) {
				int n = (int)Math.floor(Math.random()*36);
				String temp = each[0];
				each[0] = each[n];
				each[n] = temp;
			}
			String no = "";
			for(int i=0; i<13; i++) {
				no += each[i];
			}
			
			vo.setPw(no);
			int pwvo = mapper.pwChange(vo);
			
			System.out.println(vo.getPw());
			
			if(pwvo>0) {
				String pw = vo.getPw();
				mav =  mailService.send(vo.getEmail(), "임시 비밀번호", pw);
			}
		}else {
			msg="입력한 정보에 대한 계정이 없습니다.";
			url = "findPw";
		}
		
		mav = new ModelAndView("alert");
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	@RequestMapping("/login/reservationchk")
	ModelAndView reservationChk(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("/login/reservationchk");
		
		UserVo vo = new UserVo();
		
		if(session.getAttribute("userdata")!=null) {
			vo = (UserVo)session.getAttribute("userdata");
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
		
		String id = vo.getId();
		
		ReservationVO rvo = new ReservationVO();
		
		rvo.setId(id);
		rvo.setIndate(todate);
		
		mav.addObject("reservationData", mapper.reservationChk(rvo));
		
		
		return mav;
	}

	
	@RequestMapping("/login/bookinghistory")
	ModelAndView bookingHistory(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("/login/bookinghistory");
		
		UserVo vo = new UserVo();
		
		if(session.getAttribute("userdata")!=null) {
			vo = (UserVo)session.getAttribute("userdata");
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
		
		String id = vo.getId();
		
		ReservationVO rvo = new ReservationVO();
		
		rvo.setId(id);
		rvo.setIndate(todate);
		
		mav.addObject("historyData", mapper.bookingHistory(rvo));
		
		List<ReservationVO> chknull = (List)mapper.bookingHistory(rvo);
		
		if(chknull.size()==0) {
			mav = new ModelAndView("alert");
			
			mav.addObject("msg", "과거 이용 내역이 없습니다.");
			mav.addObject("url", "mypage");
		}
		
		return mav;
	}
	
	@RequestMapping("login/cancelroom")
	ModelAndView cancelRoom(HttpSession session,
			CancelVo cvo) {
		
		ModelAndView mav = new ModelAndView("confirm");
		
		String msg="환불까지 며칠의 시간이 소요됩니다. 취소하시겠습니까?";
		String url = "cancelchkmsg";
		
		UserVo uservo = new UserVo();
		
		if(session.getAttribute("userdata")!=null) {
			uservo = (UserVo)session.getAttribute("userdata");
		}else {
			mav = new ModelAndView("alert");
			mav.addObject("msg", "로그인 후 이용해 주세요.");
			mav.addObject("url", "login/loginForm");
			return mav;
		}
		cvo.setId(uservo.getId());
		
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
		cvo.setCanceldate(todate);
		
		Date d_indate = DateCast.strToDate(cvo.getIndate());
		Date d_todate = DateCast.strToDate(todate);
		
		long calDate = d_indate.getTime() - d_todate.getTime();
		
		long calDateDays = calDate / (24*60*60*1000);
		calDateDays = Math.abs(calDateDays);
		
		if(calDateDays>7) {
			cvo.setCancelprice(cvo.getPrice());
		}else if(calDateDays>5) {
			cvo.setCancelprice(cvo.getPrice()*7/10);
			cvo.setNet(cvo.getPrice()-cvo.getCancelprice());
			msg = "위약금 30%인 "+ cvo.getCancelprice() + "원만 환불되며, 며칠의 시간이 소요됩니다. 취소하시겠습니까?";
		}else if(calDateDays>3) {
			cvo.setCancelprice(cvo.getPrice()/2);
			cvo.setNet(cvo.getPrice()-cvo.getCancelprice());
			msg = "위약금 50%인 "+cvo.getNet() +"원을 제외한 "+cvo.getCancelprice() + "원만 환불되며, 며칠의 시간이 소요됩니다. 취소하시겠습니까?";
		}else if(calDateDays>1){
			cvo.setCancelprice(cvo.getPrice()*3/10);
			cvo.setNet(cvo.getPrice()-cvo.getCancelprice());
			msg = "위약금 70%인 "+cvo.getNet() + "원을 제외한 " + cvo.getCancelprice() + "원만 환불되며, 며칠의 시간이 소요됩니다. 취소하시겠습니까?";
		}else {
			cvo.setCancelprice(0);
			cvo.setNet(cvo.getPrice());
			msg = "체크인 전날부터는 환불이 불가능합니다. 취소하시겠습니까?";
		}

		session.setAttribute("cancel", cvo);
		
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
		
	}
	
	@RequestMapping("login/cancelchkmsg")
	ModelAndView cancelchkmsg(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		CancelVo cvo = new CancelVo();
		
		if(session.getAttribute("cancel")!=null) {
		
			int deletecnt = 0;
			cvo = (CancelVo)session.getAttribute("cancel");
			
			deletecnt = mapper.deleteReservation(cvo.getNo());
			if(deletecnt>0) {
				mapper.cancelReg(cvo);	
			}
		}else {
			mav.addObject("msg", "취소 실패");
			mav.addObject("url", "mypage");
			
			return mav;
		}
		session.removeAttribute("cancel");
		
		mav.addObject("msg", "취소되었습니다. 감사합니다.");
		mav.addObject("url", "mypage");
		
		return mav;
	}
	
	@RequestMapping("login/applyAdmin")
	ModelAndView applyAdmin(HttpSession session) {
		ModelAndView mav = new ModelAndView("confirm");
		
		int cnt = 0;
		UserVo vo = new UserVo();
		if(session.getAttribute("userdata")!=null) {
			vo = (UserVo)session.getAttribute("userdata");
			
			if(vo.getKind()==4) {
				mav = new ModelAndView("alert");
				mav.addObject("msg", "이미 관리자 신청을 하셨습니다.");
				mav.addObject("url", "mypage");
				return mav;
			}else if(vo.getKind()==1 || vo.getKind()==2) {
				mav = new ModelAndView("alert");
				mav.addObject("msg", "이미 관리자입니다.");
				mav.addObject("url", "mypage");
				return mav;
			}
			
			cnt = mapper.applyAdmin(vo.getId());
			
		}else {
			mav = new ModelAndView("alert");
			
			mav.addObject("msg", "로그인 후 이용해 주세요.");
			mav.addObject("url", "loginForm");
			
			return mav;
		}
		
		if(cnt>0) {
			mav.addObject("msg", "관리자로 신청했습니다. 승인 후 이용 가능합니다.");
			mav.addObject("url", "mypage");
			
			vo.setKind(4);
			
			session.setAttribute("userdata", vo);
			
		}else {
			mav.addObject("msg", "관리자 신청 실패! 다시 신청해주세요.");
			mav.addObject("url", "mypage");
		}
		
		return mav;
		
	}
	
	@RequestMapping("login/modifyById")
	ModelAndView modifyById(HttpSession session,UserVo vo,
			@RequestParam("existingpw")String existingpw) {
		
		ModelAndView mav = new ModelAndView("confirm");
		
		if(session.getAttribute("userdata")!=null) {
			UserVo s_vo = (UserVo)session.getAttribute("userdata");
			
			if(existingpw.equals(s_vo.getPw())) {
				
				if(!s_vo.getEmail().equals(vo.getEmail())) {
					int cnt = mapper.chkEmail(vo);
					if(cnt>0) {
						mav = new ModelAndView("alert");
						mav.addObject("msg", "중복된 이메일이 있습니다.");
						mav.addObject("url", "mypage");
						return mav;
					}
				}
				
				if(!vo.getPhone().equals("")&&vo.getPhone()!=null) {
					String[] phones = vo.getPhone().split("");
					if(phones.length!=13 && phones.length!=11) {
						mav = new ModelAndView("alert");
						mav.addObject("msg", "휴대폰 번호를 알맞게 입력해 주세요.");
						mav.addObject("url", "mypage");
						
						return mav;
						
					}else if(phones.length==11){
						for(int i=0; i<phones.length; i++) {
							int index = vo.getPhone().charAt(i);
							boolean num = false;
							if(index>=48 && index<=57) {
								num=true;
							}
							if(num==false) {
								mav.addObject("msg", "휴대폰 번호를 알맞게 입력해 주세요.");
								mav.addObject("url", "mypage");
								
								return mav;
							}
						}
						vo.setPhone(phones[0]+phones[1]+phones[2]+"-"+phones[3]+phones[4]+phones[5]+phones[6]+
								"-"+phones[7]+phones[8]+phones[9]+phones[10]);
					}else if(phones.length==13) {
						if(!(phones[3].equals("-")&&phones[8].equals("-"))) {
							mav.addObject("msg", "휴대폰 번호를 알맞게 입력해 주세요.");
							mav.addObject("url", "mypage");
							
							return mav;
						}
					}
				}
				
				mav.addObject("msg", "정보를 수정하시겠습니까?");
				mav.addObject("url", "modifyByIdReg");
				
				s_vo.setName(vo.getName());
				s_vo.setPhone(vo.getPhone());
				s_vo.setEmail(vo.getEmail());
				
				session.setAttribute("userdata", s_vo);
				
			}else if(existingpw.equals("")) {
				mav.addObject("msg", "현재 비밀번호를 입력해 주세요.");
				mav.addObject("url", "mypage");
			}else {
				session.invalidate();
				mav.addObject("msg", "현재 비밀번호를 틀렸습니다. 다시 로그인 후 이용해주세요.");
				mav.addObject("url", "loginForm");
			}
		}else {
			mav = new ModelAndView("alert");
			mav.addObject("msg", "로그인 후 이용해 주세요.");
			mav.addObject("url", "login/loginForm");
			return mav;
		}
		return mav;
		
	}
	
	@RequestMapping("login/modifyByIdReg")
	ModelAndView modifyByIdReg(HttpSession session,UserVo vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		vo = (UserVo)session.getAttribute("userdata");
		int cnt = 0;
		cnt = mapper.modifyByIdReg(vo);
		
		if(cnt>0) {
			mav.addObject("msg", "수정되었습니다.");
			mav.addObject("url", "mypage");
		}else {
			mav.addObject("msg", "실패");
			mav.addObject("url", "mypage");
		}
		
		return mav;
		
	}
	
	@RequestMapping("login/useagree")
	String useagree() {
		return "login/useagree";
	}
	
	@RequestMapping("/login/bookingCancel")
	ModelAndView bookingCancel(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("/login/bookingCancel");
		
		if(session.getAttribute("userdata")!=null) {
			UserVo vo = (UserVo)session.getAttribute("userdata");
			
			mav.addObject("cancelList", mapper.cancelList(vo));
		}else {
			mav = new ModelAndView("alert");
			mav.addObject("msg", "로그인 후 이용해 주세요.");
			mav.addObject("url", "login/loginForm");
			return mav;
		}
		
		return mav;
	}
	
	@RequestMapping("admin_messenger/messenger")
	String messenger(HttpSession session, Model model, String roomId) {
		
		UserVo uservo = new UserVo();
		
		if(session.getAttribute("userdata")!=null) {
			uservo = (UserVo)session.getAttribute("userdata");
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			model.addAttribute("url", "/login/loginForm");
			return "alert";
		}
		
		model.addAttribute("roomId", roomId);
		
		if(roomId.equals("jj")) {
			model.addAttribute("roomname", "전주");
		}else if(roomId.equals("kj")) {
			model.addAttribute("roomname", "경주");
		}if(roomId.equals("gr")) {
			model.addAttribute("roomname", "강릉");
		}if(roomId.equals("su")) {
			model.addAttribute("roomname", "서울");
		}
		
		return "admin_messenger/messenger";
	}
	
	@RequestMapping("admin_messenger/doAddMessage")
	public Map doAddMessage(String roomId, String writer, String body) {
		Map rs = new HashMap<>();
		
		chatService.addMessage(roomId, writer, body);
		
		rs.put("resultCode", "S-1");
		rs.put("msg", "채팅 메시지가 추가되었습니다.");
		
		return rs;
	}
	
	@RequestMapping("admin_messenger/getMessagesFrom")
	@ResponseBody
	public Map getMessagesFrom(String roomId, int from) {
		
		List<ChatingVo> messages = chatService.getMessagesFrom(roomId, from);
		
		Map rs = new HashMap<>();
		
		rs.put("resultCode", "S-1");
		rs.put("msg", "새 메세지들을 가져왔습니다.");
		rs.put("messages", messages);
		
		return rs;
	}
	
	@RequestMapping("admin_messenger/total")
	String total() {
		return "admin_messenger/total";
	}
	
	@RequestMapping("admin_messenger/deleteAllMessages")
	ModelAndView deleteAllMessages(String roomId) {
		ModelAndView mav = new ModelAndView("alert");
		
		int cnt = 0;
		System.out.println(roomId);
		cnt = mapper.deleteAllMessages(roomId);
		
		if(cnt>0) {
			mav.addObject("msg", "삭제 되었습니다.");
			mav.addObject("url", "messenger?roomId="+roomId);
		}
		
		return mav;
	}
}
