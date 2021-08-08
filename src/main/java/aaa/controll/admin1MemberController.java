package aaa.controll;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.lookup.VoidTypeBinding;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import aaa.db.*;
import aaa.vo.BlacklistVO;
import aaa.vo.UserVo;

@Controller
public class admin1MemberController {
	
	@Resource
	adminMapp adminM;
	
	
	@RequestMapping("/admin1/user/search")
	ModelAndView user(UserVo vo ,HttpSession session){
		
		ModelAndView mav = new ModelAndView("/admin1//userManage/userSch");
		if(session.getAttribute("userdata")==null) {
			mav = new ModelAndView ("alert");
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo vo2 = (UserVo)session.getAttribute("userdata");
			if(vo2.getKind()!=1) {
				mav = new ModelAndView ("alert");
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		
		String ynb ="";
		
		
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
		
		if(vo.getName()==null) {
			vo.setName("");
		}
		
		if(vo.getUseynb() == null) {
			ynb="y"; 
			vo.setUseynb("y"); 
		}else {
			ynb = vo.getUseynb();
		}
		
			if(ynb.equals("a")) {
				if(adminM.searchIdAdmin(vo).isEmpty()) {
					mav.addObject("xxx", 0);
					mav.addObject("useynb", ynb);
					return mav;
				}
				mav.addObject("xxx", 1);
				mav.addObject("rstlist", adminM.searchIdAdmin(vo));
				mav.addObject("cnt", adminM.searchIdAdminPageCnt(vo));
				mav.addObject("name", vo.getName());
				mav.addObject("useynb", ynb);
				return mav;
				
			}else if(ynb.equals("y")) { 
			System.out.println(vo);
			
			vo.setUseynb("y");
			if(adminM.userTotal(vo).isEmpty()) {
				mav.addObject("xxx", 0);
				mav.addObject("useynb", ynb);
				return mav;
			}else {
				mav.addObject("xxx", 1);
				mav.addObject("rstlist", adminM.userTotal(vo)); // 여기에 조건에 맞는 회원 목록이 나갑니다.
				mav.addObject("cnt", adminM.userPageCount(vo));
				mav.addObject("name", vo.getName());// 여기에 cnt 수가 담깁니다.
				mav.addObject("useynb", ynb);
				return mav;
			}
			
		}else if(ynb.equals("n")) {
			vo.setUseynb("n");
			
			if(adminM.userTotal(vo).isEmpty()) {
				mav.addObject("xxx", 0);
				mav.addObject("useynb", ynb);
				return mav;
			}else {
				mav.addObject("xxx", 1);
				mav.addObject("rstlist", adminM.userTotal(vo));
				mav.addObject("cnt", adminM.userCntN(vo));
				mav.addObject("name", vo.getName());
				mav.addObject("useynb", ynb);
				return mav;
			}
			
		}else if(ynb.equals("b")) {
			vo.setUseynb("b");
			if(adminM.blackTotal(vo).isEmpty()) {
				mav.addObject("xxx", 0);
				mav.addObject("useynb", ynb);
				return mav;
			}else {
				mav.addObject("xxx", 1);
				mav.addObject("rstlist", adminM.blackTotal(vo));
				mav.addObject("name", vo.getName());
				mav.addObject("cnt", adminM.blackPageCnt(vo));
				mav.addObject("useynb", ynb);
				return mav;
				
			}
			
		}
		
		
		
		/*
		 * if(pvo.getStart() != null) { int pstart = Integer.parseInt(pvo.getStart())+5;
		 * 
		 * 
		 * String start = Integer.toString(pstart);
		 * 
		 * mav.addObject("ps", start);
		 * 
		 * System.out.println("검사 " + start);
		 * 
		 * }
		 */
		
		return mav;
	}

	
	  @RequestMapping("/admin1/user/recoverBlack")
	  ModelAndView blackReg(BlacklistVO vo, HttpSession session) { 
	  
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
	  
	  
	  int rst = adminM.reCoverUser(vo);
	  
	  if(rst == 1 ) {
	  adminM.deleteBlack(vo);
	  mav.addObject("msg", "복구되었습니다.");
	  mav.addObject("url", "/admin1/user/search");
	  return mav;
	  }else {
		  mav.addObject("msg", "복구실패 입니다.");
		  mav.addObject("url", "/admin1/user/search");
		  return mav;
	  }
	  
	  }
	 
	
	@RequestMapping("/admin1/user/adminReg")
	@ResponseBody
	ModelAndView adminReg(UserVo vo, HttpSession session) {
		ModelAndView mav = new ModelAndView("alert");
		
		if(session.getAttribute("userdata")==null) {
			mav = new ModelAndView ("alert");
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo vo2 = (UserVo)session.getAttribute("userdata");
			if(vo2.getKind()!=1) {
				mav = new ModelAndView ("alert");
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		
		adminM.adminreg(vo);
		
		String msg = "관리자 등록 완료.";
		String url = "/admin1/user/search";
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		
		return mav;
	}
	
	@RequestMapping("/admin1/user/blackContentPop")
	ModelAndView blackContentPop(UserVo vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("/admin1/userManage/blackContentPop");
		
		
		if(session.getAttribute("userdata")==null) {
			mav = new ModelAndView ("alert");
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo vo2 = (UserVo)session.getAttribute("userdata");
			if(vo2.getKind()!=1) {
				mav = new ModelAndView ("alert");
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		
		mav.addObject("blackId", vo.getId());
		return mav;
	}
	
	@RequestMapping("/admin1/user/blackContentReg")
	ModelAndView blackContentReg(UserVo vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
			
		
		if(session.getAttribute("userdata")==null) {
			mav.addObject("msg","로그인 후 이용해 주세요.");
			mav.addObject("url", "/login/loginForm");
			return mav;
		}else {
			UserVo vo2 = (UserVo)session.getAttribute("userdata");
			if(vo2.getKind()!=1) {
				mav.addObject("msg","총 관리자만 이용할 수 있습니다.");
				mav.addObject("url", "/");
				return mav;
			}
		}
		
		  UserVo vvv = adminM.userdd(vo); 
		 		
		  BlacklistVO insert = new BlacklistVO();
		  
		  insert.setId(vvv.getId()); 
		  insert.setName(vvv.getName());
		  insert.setPhone(vvv.getPhone()); 
		  insert.setEmail(vvv.getEmail());
		  insert.setId_no(vvv.getId_no()); 
		  insert.setContent(vo.getContent());
		  
		  adminM.regBlack(vo); 
		  adminM.insertBlack(insert);
		  
		  mav.addObject("msg", "블랙리스트 등록!");
		  mav.addObject("url", "/admin1/user/search"); 
		 
		  return mav;
	}
	

	@RequestMapping("/admin1/user/stats")
	ModelAndView genderStats(HttpSession session) throws ParseException{
		System.out.println("통계 컨트롤러 진입");
		ModelAndView mav = new ModelAndView("/admin1/userManage/userStats"); //통계.jsp로 고고
		
		
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
		
		
		HashMap<String, Object> hm = new HashMap<>(); // 리턴할 해쉬맵 객체
		
		int maleCnt =0; //남자수
		int femaleCnt=0; //여자수
		 
		int gene20=0;
		int gene30=0;
		int gene40=0;
		int gene50=0;
		int gene60=0;
		
			for(int i=0;i<adminM.getIdNo().size();i++) { //mapper에서 가져온 회원 주민번호
				
				String cast = adminM.getIdNo().get(i).getGender().toString(); //형변환, getGender 위치 = *UserVo에 있다. 
																      //substring를 사용해 주민등록번호 맨 끝자리만 저장한다.
				if(cast.equals("1")||cast.equals("3")) {  //끝자리가 1,3일 경우 남자 카운트 올라간다.
					maleCnt += 1;
					}
				else {  								    //그 외, 즉 2,4일 경우 여자 카운트 올라간다.
					femaleCnt += 1;
					}
					
				}
			
			for(int i=0;i<adminM.getIdNo().size();i++) { 
			
				String cast = adminM.getIdNo().get(i).getAge().toString(); 
				System.out.println("나이야 제발 나오라 " +cast);
				String bfCastYyyy = dateCasting(cast);
				
				
				int yyyy = Integer.parseInt(bfCastYyyy);
				int year = Calendar.getInstance().get(Calendar.YEAR);
				int useryear = year-yyyy;
				
				
				String userYear = Integer.toString(useryear);
				
				char av = userYear.charAt(0);
				
				System.out.println(av);
				
				if(av == '2' ) {
					gene20 += 1;
				}else if(av == '3') {
					gene30 += 1;
				}else if(av == '4') {
					gene40 += 1;
				}else if(av == '5') {
					gene50 += 1;
				}else {
					gene60 += 1;
				}
			}
			
			
		
		List<String> mf = perCal(maleCnt,femaleCnt);
		
		List<String> gen = perCal(gene20,gene30,gene40,gene50,gene60);
		
		
		hm.put("남자", mf.get(0)); // 해쉬맵에 담고 view단으로
		hm.put("여자", mf.get(1));
		
		hm.put("20", gen.get(0));
		hm.put("30", gen.get(1));
		hm.put("40", gen.get(2));
		hm.put("50", gen.get(3));
		hm.put("60", gen.get(4));
		
		mav.addObject("id_no", hm);
		return mav;
	}
	
	
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	String dateCasting(String date) throws ParseException {
		
		SimpleDateFormat bfsdf = new SimpleDateFormat("yyMMdd");
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date formatDate = bfsdf.parse(date);
		String strDate = newDtFormat.format(formatDate);
		String[] dateArr = strDate.split("-");
		return dateArr[0];
				
	}
	
	List<String> perCal(int maleCnt, int femaleCnt) {
		int total = maleCnt + femaleCnt;
		double beforeRoundMalePer = (maleCnt/(double)total) * (double)100; // 반올림 하기 전
		double malePer = (Math.round(beforeRoundMalePer*10)/(double)10); // 남자 비율 반올림 첫째자리까지.
		
		double beforeRoundFemalePer = (femaleCnt/(double)total) * (double)100; // 반올림 하기 전
		double femalePer = (Math.round(beforeRoundFemalePer*10)/(double)10); 
		
		
		String male = Double.toString(malePer);
		String female = Double.toString(femalePer);
		
		List<String>rst = new ArrayList<>();
		rst.add(male);
		rst.add(female);
		return rst;
	}
	
	List<String> perCal(int gene20, int gene30, int gene40,int gene50, int gene60) {
		int total = gene20 + gene30 + gene40 + gene50 + gene60;
		double beforeRoundGene20Per = (gene20/(double)total) * (double)100; // 반올림 하기 전
		double per20 = (Math.round(beforeRoundGene20Per*10)/(double)10); // 남자 비율 반올림 첫째자리까지. // 4050비율
		
		double beforeRoundGene30Per = (gene30/(double)total) * (double)100; // 반올림 하기 전
		double per30 = (Math.round(beforeRoundGene30Per*10)/(double)10); // 남자 비율 반올림 첫째자리까지. // 4050비율
		
		double beforeRoundGene40Per = (gene40/(double)total) * (double)100; // 반올림 하기 전
		double per40 = (Math.round(beforeRoundGene40Per*10)/(double)10); // 남자 비율 반올림 첫째자리까지. // 4050비율
		
		double beforeRoundGene50Per = (gene50/(double)total) * (double)100; // 반올림 하기 전
		double per50 = (Math.round(beforeRoundGene50Per*10)/(double)10); // 남자 비율 반올림 첫째자리까지. // 4050비율
		
		
		//성별
		
		double beforeRoundGene60Per = 100-(per20+per30+per40+per50); 
		double per60 = (Math.round(beforeRoundGene60Per*10)/(double)10); 
		String g2 = Double.toString(per20);
		String g3 = Double.toString(per30);
		String g4 = Double.toString(per40);
		String g5 = Double.toString(per50);
		String g6 = Double.toString(per60);
		
		
		List<String>rst = new ArrayList<>();
		rst.add(g2);
		rst.add(g3);
		rst.add(g4);
		rst.add(g5);
		rst.add(g6);
		return rst;
	}
	
	@RequestMapping("/admin1/user/backupId")
	ModelAndView backupId(@RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView("alert");
		
		int cnt = 0;
		cnt = adminM.backupId(id);
		System.out.println(id);
		if(cnt>0) {
			mav.addObject("msg", "ID "+id+"가 복구되었습니다.");
			mav.addObject("url", "/admin1/user/search");
		}else {
			mav.addObject("msg", "ID 복구 실패. 다시 시도해주세요.");
			mav.addObject("url", "/admin1/user/search");
		}
		
		
		return mav;
	}
	
	@RequestMapping("/admin1/user/adminReturn")
	ModelAndView adminReturn(@RequestParam("id")String id) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = 0;
		cnt = adminM.returnAdmin(id);
		System.out.println(id);
		if(cnt>0) {
			mav.addObject("msg", "ID "+id+"가 신청이 반려 되었습니다.");
			mav.addObject("url", "/admin1/user/search");
		}else {
			mav.addObject("msg", "ID 반려 실패. 다시 시도해주세요.");
			mav.addObject("url", "/admin1/user/search");
		}
		
		
		return mav;
	}
}
