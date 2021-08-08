package aaa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;



import lombok.Data;


@Data
public class CommentVO {

	
	int c_no, b_no;  
    String writer, content;
    Date reg_date, modify_date;
    
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public String getReg_dateStr() {
		
		return sdf.format(reg_date);
	}
	
	public String getContentBr() {
		
		return content.replaceAll("\n", "<br>");
	}
}
