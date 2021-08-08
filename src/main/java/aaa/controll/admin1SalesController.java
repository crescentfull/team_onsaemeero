package aaa.controll;

import java.security.KeyStore.Entry;
import java.text.ParseException;

import java.util.*;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aaa.db.salesMapp;
import aaa.time.Ymd;
import aaa.vo.BranchVo;
import aaa.vo.ReservationVO;
import aaa.vo.UserVo;

@Controller
public class admin1SalesController {
	
	@Resource
	salesMapp sm;
	
	@RequestMapping("admin1/sales/month")
	ModelAndView monthtest(Ymd ymd, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("admin1/salesSettlement/month");
		
		
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
		
		int i_year1 = 0;
		int i_year2 = 0;
		
		int i_month1 = 0;
		int i_month2 = 0;
		
		
		if(ymd.getYear1()!=null && ymd.getYear2()!=null && ymd.getMonth1()!=null && ymd.getMonth2()!=null) {
			if(ymd.getYear1().equals("년도")||ymd.getYear2().equals("년도")||ymd.getMonth1().equals("월")||ymd.getMonth2().equals("월")) {
				mav = new ModelAndView("alert");
				mav.addObject("msg", "연월을 입력하시오.");
				mav.addObject("url", "month");
				return mav;
			}else{
				i_year1 = Integer.parseInt(ymd.getYear1());
				i_year2 = Integer.parseInt(ymd.getYear2());
				i_month1 = Integer.parseInt(ymd.getMonth1());
				i_month2 = Integer.parseInt(ymd.getMonth2());
				
				if(i_year1>i_year2 || (i_year1==i_year2 && i_month1>i_month2) ) {
					mav = new ModelAndView("alert");
					mav.addObject("msg", "날짜 선택 조건이 잘못되었습니다.");
					mav.addObject("url", "month");
					return mav;
				}
			}
		}	
		
		int yeargap = i_year2-i_year1;
		int monthgap = 0;
		if(yeargap==0) {
			monthgap = i_month2-i_month1+1;
		}else if(yeargap==1) {
			monthgap = (12-i_month1+1) + i_month2;
		}else {
			monthgap = (12-i_month1+1) + (yeargap-1)*12 + i_month2;
		}
		BranchVo bvo = new BranchVo();
		
		HashMap<String, BranchVo> mapbvo = new HashMap<>();
		int temp = 0;
		
		for(int i=i_year1; i<=i_year2; i++) {
			if(i_year1==i_year2) {
				for(int j=i_month1; j<=i_month2; j++) {
					if(j<10){
						String strdate = Integer.toString(i)+"-0"+Integer.toString(j);
						bvo = new BranchVo();
						bvo.setDate(strdate);
						temp += 1;
						mapbvo.put(Integer.toString(temp), bvo);
					}else {
						String strdate = Integer.toString(i)+"-"+Integer.toString(j);
						bvo = new BranchVo();
						bvo.setDate(strdate);
						temp += 1;
						mapbvo.put(Integer.toString(temp), bvo);
					}
				}
			}else if(i==i_year1) {
				for(int j=i_month1; j<13; j++) {
					if(j<10){
						String strdate = Integer.toString(i)+"-0"+Integer.toString(j);
						bvo = new BranchVo();
						bvo.setDate(strdate);
						temp += 1;
						mapbvo.put(Integer.toString(temp), bvo);
					}else {
						String strdate = Integer.toString(i)+"-"+Integer.toString(j);
						bvo = new BranchVo();
						bvo.setDate(strdate);
						temp += 1;
						mapbvo.put(Integer.toString(temp), bvo);
					}
				}
			}else if(i==i_year2) {
				for(int j=1; j<i_month2+1; j++) {
					if(j<10){
						String strdate = Integer.toString(i)+"-0"+Integer.toString(j);
						bvo = new BranchVo();
						bvo.setDate(strdate);
						temp += 1;
						mapbvo.put(Integer.toString(temp), bvo);
					}else {
						String strdate = Integer.toString(i)+"-"+Integer.toString(j);
						bvo = new BranchVo();
						bvo.setDate(strdate);
						temp += 1;
						mapbvo.put(Integer.toString(temp), bvo);
					}
				}
			}
			if(i > i_year1 && i < i_year2) {
				for(int j=1; j<=12; j++) {
					if(j<10){
						String strdate = Integer.toString(i)+"-0"+Integer.toString(j);
						bvo = new BranchVo();
						bvo.setDate(strdate);
						temp += 1;
						mapbvo.put(Integer.toString(temp), bvo);
					}else {
						String strdate = Integer.toString(i)+"-"+Integer.toString(j);
						bvo = new BranchVo();
						bvo.setDate(strdate);
						temp += 1;
						mapbvo.put(Integer.toString(temp), bvo);
					}
				}
			}
		}
		
		ArrayList<BranchVo> listbvo = new ArrayList<>();
		
		for(int i=1; i<=monthgap; i++) {
			bvo = new BranchVo();
			String temp2 = mapbvo.get(Integer.toString(i)).getDate();
			bvo = sm.month(mapbvo.get(Integer.toString(i)));
			bvo.setDate(temp2);
			
			BranchVo bvo2 = new BranchVo();
			bvo2 = sm.monthCancel(temp2);
			bvo2.setDate(temp2);
			
			bvo.setSu(bvo.getSu()+bvo2.getSu());
			bvo.setGr(bvo.getGr()+bvo2.getGr());
			bvo.setKj(bvo.getKj()+bvo2.getKj());
			bvo.setJj(bvo.getJj()+bvo2.getJj());
			
			if(!bvo.getDate().equals("0-00") ) {listbvo.add(bvo);}
		}
		mav.addObject("monthData", listbvo);
		
		return mav;
		
	}
	
	@RequestMapping("admin1/sales/year")
	ModelAndView yeartest(Ymd ymd, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("admin1/salesSettlement/year");
		
		
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
		
		
		int i_year1 = 0;
		int i_year2 = 0;
		
		if(ymd.getYear1()!=null && ymd.getYear2()!=null) {
			if(ymd.getYear1().equals("년도")||ymd.getYear2().equals("년도")) {
				mav = new ModelAndView("alert");
				mav.addObject("msg", "년도를 입력하시오.");
				mav.addObject("url", "year");
				return mav;
			}else {
				i_year1 = Integer.parseInt(ymd.getYear1());
				i_year2 = Integer.parseInt(ymd.getYear2());
				
				if(i_year1 > i_year2) {
					mav = new ModelAndView("alert");
					mav.addObject("msg", "날짜 선택 조건이 잘못되었습니다.");
					mav.addObject("url", "year");
					return mav;
				}
			}
		}
		int yeargap = i_year2-i_year1+1;
		
		BranchVo bvo = new BranchVo();
		
		HashMap<String, BranchVo> mapbvo = new HashMap<>();
		int temp = 0;
		
		for(int i=i_year1; i<=i_year2; i++) {
			String strdate = Integer.toString(i);
			bvo = new BranchVo();
			bvo.setDate(strdate);
			temp++;
			mapbvo.put(Integer.toString(temp), bvo);
		}
		
		ArrayList<BranchVo> listbvo = new ArrayList<>();
		
		for(int i=1; i<=mapbvo.size(); i++) {
			bvo = new BranchVo();
			String temp2 = mapbvo.get(Integer.toString(i)).getDate();
			bvo = sm.year(mapbvo.get(Integer.toString(i)));
			bvo.setDate(temp2);
			
			BranchVo bvo2 = new BranchVo();
			bvo2 = sm.yearCancel(temp2);
			bvo2.setDate(temp2);
			
			bvo.setSu(bvo.getSu()+bvo2.getSu());
			bvo.setGr(bvo.getGr()+bvo2.getGr());
			bvo.setKj(bvo.getKj()+bvo2.getKj());
			bvo.setJj(bvo.getJj()+bvo2.getJj());
			
			if(!bvo.getDate().equals("0")) {listbvo.add(bvo);}
		}
		mav.addObject("yearData", listbvo);
		
		return mav;
		
	}
	
	@RequestMapping("admin1/sales/day")
	ModelAndView daytest(Ymd ymd, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("admin1/salesSettlement/day");
		
		
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
		
		String arrdate1[] = null;
		String arrdate2[] = null;
		
		int i_year1 = 0;
		int i_year2 = 0;
		int i_month1 = 0;
		int i_month2 = 0;
		int i_day1 = 0;
		int i_day2 = 0;
		
		if(ymd.getDate1()!=null && ymd.getDate2()!=null) {
			
			if(ymd.getDate1().equals("")||ymd.getDate2().equals("")){
				mav = new ModelAndView("alert");
				mav.addObject("msg", "날짜를 입력해 주시오.");
				mav.addObject("url", "day");
				return mav;
			}
			
			mav.addObject("date1", ymd.getDate1());
			mav.addObject("date2", ymd.getDate2());
			
			arrdate1 = ymd.getDate1().split("-");
			arrdate2 = ymd.getDate2().split("-");
			
			i_year1 = Integer.parseInt(arrdate1[0]);
			i_year2 = Integer.parseInt(arrdate2[0]);
			
			i_month1 = Integer.parseInt(arrdate1[1]);
			i_month2 = Integer.parseInt(arrdate2[1]);
			
			i_day1 = Integer.parseInt(arrdate1[2]);
			i_day2 = Integer.parseInt(arrdate2[2]);
			
		}
		
		BranchVo bvo = new BranchVo();
		
		HashMap<String, BranchVo> mapbvo = new HashMap<>();
		int temp = 0;
		Calendar cld = Calendar.getInstance();
		for(int i=i_year1; i<=i_year2; i++) {
			
			if(i_year1==i_year2) {
				
				for(int j=i_month1; j<=i_month2; j++) {
					if(j<10){
						String strdate = Integer.toString(i)+"-0"+Integer.toString(j);
						
						Date monmon = DateCast.strToMonth(strdate);
						cld.setTime(monmon);
						int d_lastdate = cld.getActualMaximum(cld.DATE);
						
						if(i_month1==i_month2) {
							
							for(int k=i_day1; k<=i_day2; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
							
						}else if(j==i_month1) {
							
							for(int k=i_day1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
							
						}else if(j==i_month2) {
							for(int k=1; k<=i_day2; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else if(j > i_month1 && j < i_month2) {
							for(int k=1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}
						
					}else {
						String strdate = Integer.toString(i)+"-"+Integer.toString(j);
						Date monmon = DateCast.strToMonth(strdate);
						cld.setTime(monmon);
						int d_lastdate = cld.getActualMaximum(cld.DATE);
						
						if(i_month1==i_month2) {
							for(int k=i_day1; k<=i_day2; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else if(j==i_month1) {
							for(int k=i_day1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else if(j==i_month2) {
							for(int k=1; k<=i_day2; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else if(j>i_month1 && j<i_month2) {
							for(int k=1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}
					}
				}
				
			}else if(i==i_year1) {
				for(int j=i_month1; j<13; j++) {
					if(j<10){
						String strdate = Integer.toString(i)+"-0"+Integer.toString(j);
						Date monmon = DateCast.strToMonth(strdate);
						cld.setTime(monmon);
						int d_lastdate = cld.getActualMaximum(cld.DATE);
						
						if(j==i_month1) {
							for(int k=i_day1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else{
							for(int k=1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}
					}else {
						String strdate = Integer.toString(i)+"-"+Integer.toString(j);
						Date monmon = DateCast.strToMonth(strdate);
						cld.setTime(monmon);
						int d_lastdate = cld.getActualMaximum(cld.DATE);
						
						if(j==i_month1) {
							for(int k=i_day1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else{
							for(int k=1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}
					}
				}
			}else if(i==i_year2) {
				for(int j=1; j<i_month2+1; j++) {
					if(j<10){
						String strdate = Integer.toString(i)+"-0"+Integer.toString(j);
						Date monmon = DateCast.strToMonth(strdate);
						cld.setTime(monmon);
						int d_lastdate = cld.getActualMaximum(cld.DATE);
						
						if(j==i_month2) {
							for(int k=1; k<=i_day2; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else{
							for(int k=1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}
					}else {
						String strdate = Integer.toString(i)+"-"+Integer.toString(j);
						Date monmon = DateCast.strToMonth(strdate);
						cld.setTime(monmon);
						int d_lastdate = cld.getActualMaximum(cld.DATE);
						
						if(j==i_month2) {
							for(int k=1; k<=i_day2; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else{
							for(int k=1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}
					}
				}
			}
			if(i > i_year1 && i < i_year2) {
				for(int j=1; j<=12; j++) {
					if(j<10){
						String strdate = Integer.toString(i)+"-0"+Integer.toString(j);
						Date monmon = DateCast.strToMonth(strdate);
						cld.setTime(monmon);
						int d_lastdate = cld.getActualMaximum(cld.DATE);
						
						for(int k=1; k<=d_lastdate; k++) {
							if(k<10) {
								strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-0"+Integer.toString(k);
								bvo = new BranchVo();
								bvo.setDate(strdate);
								temp++;
								mapbvo.put(Integer.toString(temp), bvo);
							}else {
								strdate = Integer.toString(i)+"-0"+Integer.toString(j)+"-"+Integer.toString(k);
								bvo = new BranchVo();
								bvo.setDate(strdate);
								temp++;
								mapbvo.put(Integer.toString(temp), bvo);
							}
						}
						
					}else {
						String strdate = Integer.toString(i)+"-"+Integer.toString(j);
						Date monmon = DateCast.strToMonth(strdate);
						cld.setTime(monmon);
						int d_lastdate = cld.getActualMaximum(cld.DATE);
						
						if(i_month1==i_month2) {
							for(int k=i_day1; k<=i_day2; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else if(j==i_month1) {
							for(int k=i_day1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else if(j==i_month2) {
							for(int k=1; k<=i_day2; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}else if(j>i_month1 && j<i_month2) {
							for(int k=1; k<=d_lastdate; k++) {
								if(k<10) {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-0"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}else {
									strdate = Integer.toString(i)+"-"+Integer.toString(j)+"-"+Integer.toString(k);
									bvo = new BranchVo();
									bvo.setDate(strdate);
									temp++;
									mapbvo.put(Integer.toString(temp), bvo);
								}
							}
						}
					}
				}
			}
		}
		
		ArrayList<BranchVo> listbvo = new ArrayList<>();
		
		for(int i=1; i<=mapbvo.size(); i++) {
			bvo = new BranchVo();
			String temp2 = mapbvo.get(Integer.toString(i)).getDate();
			bvo = sm.day(mapbvo.get(Integer.toString(i)));
			bvo.setDate(temp2);
			
			BranchVo bvo2 = new BranchVo();
			bvo2 = sm.dayCancel(temp2);
			bvo2.setDate(temp2);
			
			bvo.setSu(bvo.getSu()+bvo2.getSu());
			bvo.setGr(bvo.getGr()+bvo2.getGr());
			bvo.setKj(bvo.getKj()+bvo2.getKj());
			bvo.setJj(bvo.getJj()+bvo2.getJj());
			
			if(!bvo.getDate().equals("0-00-00")) {listbvo.add(bvo);}
		}
		mav.addObject("dayData", listbvo);
		
		return mav;
		
	}
	
	

	
}
