package aaa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	
	String kind, kinds, title, pname, id, pw, content, upfile, search,sort, category,reply;
	
	Integer no, cnt, gno, level, seq;
	
	Date reg_date, modify_date;
	
	boolean today = false;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	public String getReg_dateStr() {
		
		return sdf.format(reg_date);
	}
	
	public String getContentBr() {
		
		return content.replaceAll("\n", "<br>");
	}
	
	/*! 페이징처리 */
	
	int total, limit= 10, pageLimit = 5, nowPage = 1;
	
	public int getTotalPage() { //totalpage필수
		
		int res = total/limit;
		
		if(total%limit > 0 ) //페이지수 무조건 올림
			res++;
		
		return res;
	}
	
	public int getStart() { //시작페이지 게시글번호 생성로직
		
		return (nowPage -1)*limit;
	}
	
	//글번호 생성 제한 로직 (4번까지
	public int getStartPage() { 
		
		return (nowPage-1)/pageLimit*pageLimit+1;
	}
	
	public int getEndPage() {
		
		int res = getStartPage()+pageLimit-1;
		//마지막페이지 안넘어가도록 막아주는 로직
				if(res>getTotalPage())
					res = getTotalPage();
		return res;
	}
	int total2, limit2= 10, pageLimit2 = 5, nowPage2 = 1;
	
	public int getTotalPage2() { //totalpage필수
		
		int res = total2/limit2;
		
		if(total2%limit2 > 0 ) //페이지수 무조건 올림
			res++;
		
		return res;
	}
	
	public int getStart2() { //시작페이지 게시글번호 생성로직
		
		return (nowPage2 -1)*limit2;
	}
	
	//글번호 생성 제한 로직 (4번까지
	public int getStartPage2() { 
		
		return (nowPage2-1)/pageLimit2*pageLimit2+1;
	}
	
	public int getEndPage2() {
		
		int res = getStartPage2()+pageLimit2-1;
		//마지막페이지 안넘어가도록 막아주는 로직
				if(res>getTotalPage2())
					res = getTotalPage2();
		return res;
	}
	int total3, limit3= 10, pageLimit3 = 5, nowPage3 = 1;
	
	public int getTotalPage3() { //totalpage필수
		
		int res = total3/limit3;
		
		if(total3%limit3 > 0 ) //페이지수 무조건 올림
			res++;
		
		return res;
	}
	
	public int getStart3() { //시작페이지 게시글번호 생성로직
		
		return (nowPage3 -1)*limit3;
	}
	
	//글번호 생성 제한 로직 (4번까지
	public int getStartPage3() { 
		
		return (nowPage3-1)/pageLimit3*pageLimit3+1;
	}
	
	public int getEndPage3() {
		
		int res = getStartPage3()+pageLimit3-1;
		//마지막페이지 안넘어가도록 막아주는 로직
				if(res>getTotalPage3())
					res = getTotalPage3();
		return res;
	}
}
 