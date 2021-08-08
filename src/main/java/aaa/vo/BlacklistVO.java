package aaa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "blacklistVO")
public class BlacklistVO {
	
	String id, name, id_no , email, phone, content;
	

	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
	public String getGender() { // 주민등록번호 맨 끝 자리만 저장된다
		String genNo = id_no.substring(id_no.length()-1); 
		
		return genNo;
	}
	

	
}
