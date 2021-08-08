package aaa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class UserVo {
	
	String id, pw, id_no, name, email, phone;
	Integer kind;
	Date regdate;
	String useynb, emailchk;
	String front,back;
	String idok, emailok;
	String pwchk;
	
	String content;
	
	String pageIndex;
	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
	public String getAge(){
		String age = id_no.substring(0, id_no.length()-1);
		
		return age;
	}
	public String getGender() { // 주민등록번호 맨 끝 자리만 저장된다
		String genNo = id_no.substring(id_no.length()-1); 
		
		return genNo;
	}
	
	
	public String getRegtimeX() { //admin1/userManage 회원리스트
		
		return sdf.format(regdate); // 회원리스트에 가입 년,월,일만
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
