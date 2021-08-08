package aaa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardReplyVO {

	String kind, title, pname, id, pw, content, upfile, search,sort;
	
	Integer no, cnt, gno, level, seq;
	
	Date reg_date, modify_date;
	
	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	public String getReg_dateStr() {
		
		return sdf.format(reg_date);
	}
	
	public String getContentBr() {
		
		return content.replaceAll("\n", "<br>");
	}
}
