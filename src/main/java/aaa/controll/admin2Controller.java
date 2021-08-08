package aaa.controll;

import java.net.http.HttpResponse;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import aaa.db.rsvMapp;
import aaa.db.salesMapp;
import aaa.time.Ymd;
import aaa.vo.ReservationVO;
import aaa.vo.UserVo;

@Controller
public class admin2Controller {
	@Resource
	rsvMapp mapper;
	
	@Resource
	salesMapp sm;
	
	@RequestMapping("/link2")
	ModelAndView link2() {
		ModelAndView mav = new ModelAndView("/link2");
		
		return mav;
	}
	
	@RequestMapping("/admin2/reserve/manage")
	ModelAndView search(ReservationVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView("/admin2/reserveManage/branch");
		
		UserVo uv = (UserVo) session.getAttribute("userdata");
		
		
		
		if(uv != null) {
			
			String bb = uv.getName();
			vo.setB_name(bb);
			
			
			System.out.println("1번 "+vo);
			if(vo.getPageIndex() == null) {
				vo.setPageIndex("1");
			}
			int pageNum = Integer.parseInt(vo.getPageIndex());
			if(pageNum >0) {
				String setPi = Integer.toString((pageNum-1)*10);
				vo.setPageIndex(setPi);
			}else {
				vo.setPageIndex("1");
			}
			System.out.println("2번 "+vo);
			List<ReservationVO> testResv = mapper.rsvSubList(vo);
			
			if(vo.getFirdate() == null ) {
				mav.addObject("inNull", "");
				return mav;
			}
			
			
			
			if(vo.getFirdate() == "" && vo.getSecdate() != "" ) {
				mav = new ModelAndView("alert");
				mav.addObject("msg", "날짜는 하나만 선택이 불가합니다.");
				mav.addObject("url", "/admin2/reserve/manage");
				return mav;
			}else if(vo.getSecdate() == "" && vo.getFirdate() != "" ) {
				mav = new ModelAndView("alert");
				mav.addObject("msg", "날짜는 하나만 선택이 불가합니다.");
				mav.addObject("url", "/admin2/reserve/manage");
				return mav;
			}else if(testResv.isEmpty()){
				
				mav.addObject("branch", bb);
				mav.addObject("eee", -1);
				return mav;
				
			}else if(bb.equals("온새미로-서울")){
				if(vo.getId()==null){
					vo.setId("");
					mav.addObject("total", mapper.rsvSubList(vo));
					mav.addObject("branch", bb);
					mav.addObject("indate", vo.getFirdate());
					mav.addObject("outdate", vo.getSecdate());
					mav.addObject("name", vo.getName());
					mav.addObject("cnt", mapper.rsvSubListCnt(vo));
					return mav;
				}
				mav.addObject("total", mapper.rsvSubList(vo));
				mav.addObject("branch", bb);
				mav.addObject("indate", vo.getFirdate());
				mav.addObject("outdate", vo.getSecdate());
				mav.addObject("name", vo.getName());
				mav.addObject("cnt", mapper.rsvSubListCnt(vo));
				return mav;
			
			}else if(bb.equals("온새미로-강릉")){
				if(vo.getId()==null){
					vo.setId("");
					mav.addObject("total", mapper.rsvSubList(vo));
					mav.addObject("branch", bb);
					mav.addObject("indate", vo.getFirdate());
					mav.addObject("outdate", vo.getSecdate());
					mav.addObject("name", vo.getName());
					mav.addObject("cnt", mapper.rsvSubListCnt(vo));
					return mav;
				}
				mav.addObject("total", mapper.rsvSubList(vo));
				mav.addObject("branch", bb);
				mav.addObject("indate", vo.getFirdate());
				mav.addObject("outdate", vo.getSecdate());
				mav.addObject("name", vo.getName());
				mav.addObject("cnt", mapper.rsvSubListCnt(vo));
				return mav;
			}else if(bb.equals("온새미로-전주")){
				if(vo.getId()==null){
					vo.setId("");
					mav.addObject("total", mapper.rsvSubList(vo));
					mav.addObject("branch", bb);
					mav.addObject("indate", vo.getFirdate());
					mav.addObject("outdate", vo.getSecdate());
					mav.addObject("name", vo.getName());
					mav.addObject("cnt", mapper.rsvSubListCnt(vo));
					return mav;
				}
				mav.addObject("total", mapper.rsvSubList(vo));
				mav.addObject("branch", bb);
				mav.addObject("indate", vo.getFirdate());
				mav.addObject("outdate", vo.getSecdate());
				mav.addObject("name", vo.getName());
				mav.addObject("cnt", mapper.rsvSubListCnt(vo));
				return mav;
			}else if(bb.equals("온새미로-경주")){
				if(vo.getId()==null){
					vo.setId("");
					mav.addObject("total", mapper.rsvSubList(vo));
					mav.addObject("branch", bb);
					mav.addObject("indate", vo.getFirdate());
					mav.addObject("outdate", vo.getSecdate());
					mav.addObject("name", vo.getName());
					mav.addObject("cnt", mapper.rsvSubListCnt(vo));
					return mav;
				}
				mav.addObject("total", mapper.rsvSubList(vo));
				mav.addObject("branch", bb);
				mav.addObject("indate", vo.getFirdate());
				mav.addObject("outdate", vo.getSecdate());
				mav.addObject("name", vo.getName());
				mav.addObject("cnt", mapper.rsvSubListCnt(vo));
				return mav;
				
			}else {
			mav = new ModelAndView("alert");
			
			String url = "/";
			String msg = "세션이 만료되었습니다";
			
			mav.addObject("url", url);
			mav.addObject("msg", msg);
			return mav;
			}
		}else {
		mav = new ModelAndView("alert");
		
		String url = "/";
		String msg = "세션이 만료되었습니다";
		
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		return mav;
	}
	}
	
	@RequestMapping("/admin2/rsvManage/cancel")
	@ResponseBody
	ModelAndView cancel(@RequestParam("no") int no) {
		
		ModelAndView mav = new ModelAndView("/alert");
		
		int rst = mapper.resvDel(no);
		System.out.println("리턴값: "+rst);
		String url = "";
		String msg = "";
		if(rst == 1) {
			url = "/admin2/reserve/manage";
			msg = "예약취소 성공했습니다.";
			mav.addObject("url", url);
			mav.addObject("msg", msg);
		}else {
			url = "/admin2/reserve/manage";
			msg = "알 수 없는 오류 발생.";
			mav.addObject("url", url);
			mav.addObject("msg", msg);
		}
		 
		
		return mav;
	}
	
	@RequestMapping("/admin2/sales/year")
	ModelAndView year(Ymd ymd,HttpSession session) throws ParseException {
		
		ModelAndView mav = new ModelAndView("/admin2/salesManage/subyear");
		
		UserVo uv = (UserVo) session.getAttribute("userdata");
		
		
		if(uv != null) {
			
			String bb = uv.getName();
			ymd.setB_name(bb);
			
			String year1 = ymd.getYear1();
			String year2 = ymd.getYear2();
			
			if(bb == null || bb.equals("") || year1 == null || year1.equals("") ||
			   year2 == null || year2.equals("")  ) { 
					  
		 	   mav.addObject("xxx", "1"); 
			   mav.addObject("branch", bb);
			   return mav; 
			
			}else if(bb.equals("온새미로-서울")){
				
	  		  int y1 = Integer.parseInt(ymd.getYear1());
			  int y2 = Integer.parseInt(ymd.getYear2());
	  		
	  		  if(y2<y1) {
			    
			  mav = new ModelAndView("alert");
			  String url="/admin2/sales/year";
			  String msg="기간 선택이 잘못되었습니다.";
			
			  mav.addObject("msg", msg);
		  	  mav.addObject("url", url);
			  return mav;
			  
			}
	  		  
	  		  List<ReservationVO> rstlistSu = sm.salesYListSu(ymd);
			  mav.addObject("list", rstlistSu);
			  mav.addObject("branch", bb);
			  mav.addObject("year1",year1);
			  mav.addObject("year2",year2);
			  return mav;
				
			}else if(bb.equals("온새미로-강릉")){
				
	
		  	  int y1 = Integer.parseInt(ymd.getYear1());
			  int y2 = Integer.parseInt(ymd.getYear2());
		  		
		    if(y2<y1) {
				    
			  mav = new ModelAndView("alert");
			  String url="/admin2/sales/year";
			  String msg="기간 선택이 잘못되었습니다.";
			
			  mav.addObject("msg", msg);
			  mav.addObject("url", url);
			  return mav;
			  
			}
			
		      List<ReservationVO> rstlistGr = sm.salesYListGr(ymd);
			  mav.addObject("list", rstlistGr);
		  	  mav.addObject("branch", bb);
			  mav.addObject("year1",year1);
			  mav.addObject("year2",year2);
			  return mav;
					
			}else if(bb.equals("온새미로-전주")){
				
			  	
			  int y1 = Integer.parseInt(ymd.getYear1());
			  int y2 = Integer.parseInt(ymd.getYear2());
			  		
			  		
		      if(y2<y1) {
			      
		      mav = new ModelAndView("alert");
		      String url="/admin2/sales/year";
		      String msg="기간 선택이 잘못되었습니다.";
			
			  mav.addObject("msg", msg);
			  mav.addObject("url", url);
			  return mav;
			}
			
		      List<ReservationVO> rstlistJj = sm.salesYListJj(ymd);
			  mav.addObject("list", rstlistJj);
			  mav.addObject("branch", bb);
			  mav.addObject("year1",year1);
			  mav.addObject("year2",year2);
			  return mav;
				
			
			}else if(bb.equals("온새미로-경주")){
				
			  int y1 = Integer.parseInt(ymd.getYear1());
			  int y2 = Integer.parseInt(ymd.getYear2());
			  		
			  if(y2<y1) {
				    
				    
		      mav = new ModelAndView("alert");
		      String url="/admin2/sales/year";
		      String msg="기간 선택이 잘못되었습니다.";
			
			  mav.addObject("msg", msg);
			  mav.addObject("url", url);
			  return mav;
			}
			  
			  List<ReservationVO> rstlistGj = sm.salesYListGj(ymd);
			  mav.addObject("list", rstlistGj);
			  mav.addObject("branch", bb);
			  mav.addObject("year1",year1);
			  mav.addObject("year2",year2);
			  return mav;
				
			}else {
			
			  mav = new ModelAndView("alert");
			
			  String url = "/";
			  String msg = "세션이 만료되었습니다";
			
			  mav.addObject("url", url);
			  mav.addObject("msg", msg);
			  return mav;
			}
		}else {
			
		   mav = new ModelAndView("alert");
			
		   String url = "/";
		   String msg = "세션이 만료되었습니다";
			
		   mav.addObject("url", url);
		   mav.addObject("msg", msg);
		   return mav;
			
		}
	}
	
	
	@RequestMapping("/admin2/sales/month")
	ModelAndView month(Ymd ymd,HttpSession session) throws ParseException {
		
		ModelAndView mav = new ModelAndView("/admin2/salesManage/submonth");
		
		UserVo uv = (UserVo) session.getAttribute("userdata");
		
		
		if(uv != null) {
			
			String bb = uv.getName();
			ymd.setB_name(bb);
			
			String year1 = ymd.getYear1();
			String year2 = ymd.getYear2();
			String month1 = ymd.getMonth1();
			String month2 = ymd.getMonth2();
			
			if(bb == null || bb.equals("") || year1 == null || year1.equals("") ||
			   year2 == null || year2.equals("")  ) { 
					  
		 	   mav.addObject("xxx", "1"); 
			   mav.addObject("branch", bb);
			   return mav; 
			
			}else if(bb.equals("온새미로-서울")){
				
	  		  int y1 = Integer.parseInt(ymd.getYear1());
			  int y2 = Integer.parseInt(ymd.getYear2());
			  int m1 = Integer.parseInt(month1);
			  int m2 = Integer.parseInt(month2);
			  
			  if(y1 == y2 && m1 > m2) {
					
					mav = new ModelAndView("alert");
				    
					String url="/admin2/sales/month";
					String msg="기간 선택이 잘못되었습니다.";
					
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					return mav; 
			  }else if(y1>y2) {
				 	mav = new ModelAndView("alert");
				    
					String url="/admin2/sales/month";
					String msg="기간 선택이 잘못되었습니다.";
					
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					return mav; 
			  }
	  		  
	  		  List<ReservationVO> rstlistSu = sm.salesMListSu(ymd);
			  mav.addObject("list", rstlistSu);
			  mav.addObject("branch", bb);
			  mav.addObject("year1",year1);
			  mav.addObject("year2",year2);
			  mav.addObject("month1",month1);
			  mav.addObject("month2",month2);
			  return mav;
				
			}else if(bb.equals("온새미로-강릉")){
				
	
				int y1 = Integer.parseInt(ymd.getYear1());
				int y2 = Integer.parseInt(ymd.getYear2());
				int m1 = Integer.parseInt(month1);
				int m2 = Integer.parseInt(month2);
				  
			    if(y1 == y2 && m1 > m2) {
						
					mav = new ModelAndView("alert");
				    
					String url="/admin2/sales/month";
					String msg="기간 선택이 잘못되었습니다.";
					
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					return mav; 
				 }
		  		  
		  		  List<ReservationVO> rstlistGr = sm.salesMListGr(ymd);
				  mav.addObject("list", rstlistGr);
				  mav.addObject("branch", bb);
				  mav.addObject("year1",year1);
				  mav.addObject("year2",year2);
				  mav.addObject("month1",month1);
				  mav.addObject("month2",month2);
				  return mav;
					
			}else if(bb.equals("온새미로-전주")){
				
			  	
			  int y1 = Integer.parseInt(ymd.getYear1());
			  int y2 = Integer.parseInt(ymd.getYear2());
			  int m1 = Integer.parseInt(month1);
			  int m2 = Integer.parseInt(month2);
			  
			  if(y1 == y2 && m1 > m2) {
					
					mav = new ModelAndView("alert");
				    
					String url="/admin2/sales/month";
					String msg="기간 선택이 잘못되었습니다.";
					
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					return mav; 
			  }
	  		  
	  		  List<ReservationVO> rstlistJj = sm.salesMListJj(ymd);
			  mav.addObject("list", rstlistJj);
			  mav.addObject("branch", bb);
			  mav.addObject("year1",year1);
			  mav.addObject("year2",year2);
			  mav.addObject("month1",month1);
			  mav.addObject("month2",month2);
			  return mav;
					
			}else if(bb.equals("온새미로-경주")){
				
			  int y1 = Integer.parseInt(ymd.getYear1());
			  int y2 = Integer.parseInt(ymd.getYear2());
			  int m1 = Integer.parseInt(month1);
			  int m2 = Integer.parseInt(month2);
			  
			  if(y1 == y2 && m1 > m2) {
					
					mav = new ModelAndView("alert");
				    
					String url="/admin2/sales/month";
					String msg="기간 선택이 잘못되었습니다.";
					
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					return mav; 
			  }
	  		  
	  		  List<ReservationVO> rstlistGj = sm.salesMListGj(ymd);
			  mav.addObject("list", rstlistGj);
			  mav.addObject("branch", bb);
			  mav.addObject("year1",year1);
			  mav.addObject("year2",year2);
			  mav.addObject("month1",month1);
			  mav.addObject("month2",month2);
			  return mav;
				
			}else {
			
			  mav = new ModelAndView("alert");
			
			  String url = "/";
			  String msg = "세션이 만료되었습니다";
			
			  mav.addObject("url", url);
			  mav.addObject("msg", msg);
			  return mav;
			}
		}else {
			
		   mav = new ModelAndView("alert");
			
		   String url = "/";
		   String msg = "세션이 만료되었습니다";
			
		   mav.addObject("url", url);
		   mav.addObject("msg", msg);
		   return mav;
			
		}
	}
	
	@RequestMapping("/admin2/sales/date")
	ModelAndView date(Ymd ymd,HttpSession session) throws ParseException {
		
		ModelAndView mav = new ModelAndView("/admin2/salesManage/subdate");
		
		UserVo uv = (UserVo) session.getAttribute("userdata");
		
		
		if(uv != null) {
			
			String bb = uv.getName();
			ymd.setB_name(bb);
			
			String date1 = ymd.getDate1();
			String date2 = ymd.getDate2();
			
			if(bb == null || bb.equals("") || date1 == null || date1.equals("") ||
			   date2 == null || date2.equals("")  ) { 
					  
		 	   mav.addObject("xxx", "1"); 
			   mav.addObject("branch", bb);
			   return mav; 
			
			}else if(bb.equals("온새미로-서울")){
				
	  		  
	  		  
	  		  List<ReservationVO> rstlistSu = sm.salesDListSu(ymd);
			  mav.addObject("list", rstlistSu);
			  mav.addObject("branch", bb);
			  mav.addObject("date1",date1);
			  mav.addObject("date2",date2);
			  return mav;
				
			}else if(bb.equals("온새미로-강릉")){
				
			
		      List<ReservationVO> rstlistGr = sm.salesDListGr(ymd);
			  mav.addObject("list", rstlistGr);
		  	  mav.addObject("branch", bb);
			  mav.addObject("date1",date1);
			  mav.addObject("date2",date2);
			  return mav;
					
			}else if(bb.equals("온새미로-전주")){
			
			
		      List<ReservationVO> rstlistJj = sm.salesDListJj(ymd);
			  mav.addObject("list", rstlistJj);
			  mav.addObject("branch", bb);
			  mav.addObject("date1",date1);
			  mav.addObject("date2",date2);
			  return mav;
				
			
			}else if(bb.equals("온새미로-경주")){
				
			  
			  List<ReservationVO> rstlistGj = sm.salesDListGj(ymd);
			  mav.addObject("list", rstlistGj);
			  mav.addObject("branch", bb);
			  mav.addObject("date1",date1);
			  mav.addObject("date2",date2);
			  return mav;
				
			}else {
			
			  mav = new ModelAndView("alert");
			
			  String url = "/";
			  String msg = "세션이 만료되었습니다";
			
			  mav.addObject("url", url);
			  mav.addObject("msg", msg);
			  return mav;
			}
		}else {
			
		   mav = new ModelAndView("alert");
			
		   String url = "/";
		   String msg = "세션이 만료되었습니다";
			
		   mav.addObject("url", url);
		   mav.addObject("msg", msg);
		   return mav;
			
		}
	}
	
	HashMap<String, Integer> salesStats(List<ReservationVO> filter) throws ParseException{
		DateCast m2y = new DateCast();
		 
		
		int jan=0;
		int feb=0;
		int mar=0;
		int apr=0;
		int may=0;
		int jun=0;
		int jul=0;
		int aug=0;
		int sep=0;
		int oct=0;
		int nov=0;
		int dec=0;
		HashMap<String, Integer> result = new HashMap<>();
		for( ReservationVO i : filter ) {
			
			String y2 = i.getIndate();
			String month = m2y.dateToMonth(y2);
			
			
			if(month.equals("01")) {
				jan += i.getPrice();
			}else if(month.equals("02")) {
				feb += i.getPrice();
			}else if(month.equals("03")) {
				mar += i.getPrice();
			}else if(month.equals("04")) {
				apr += i.getPrice();
			}else if(month.equals("05")) {
				may += i.getPrice();
			}else if(month.equals("06")) {
				jun += i.getPrice();
			}else if(month.equals("07")) {
				jul += i.getPrice();
			}else if(month.equals("08")) {
				aug += i.getPrice();
			}else if(month.equals("09")) {
				sep += i.getPrice();
			}else if(month.equals("10")) {
				oct += i.getPrice();
			}else if(month.equals("11")) {
				nov += i.getPrice();
			}else if(month.equals("12")) {
				dec += i.getPrice();
			}
			int total = jan+feb+mar+apr+may+jun+jul+aug+sep+oct+nov+dec;
		
			result.put("1월", jan);
			result.put("2월", feb);
			result.put("3월", mar);
			result.put("4월", apr);
			result.put("5월", may);
			result.put("6월", jun);
			result.put("7월", jul);
			result.put("8월", aug);
			result.put("9월", sep);
			result.put("10월", oct);
			result.put("11월", nov);
			result.put("12월", dec);
			result.put("합계", total);
			
		}
		
		
		return result;
	}
	
}
