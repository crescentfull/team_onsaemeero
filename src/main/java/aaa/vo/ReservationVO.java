package aaa.vo;

import lombok.Data;

@Data
public class ReservationVO {

	private int no, price, cnt;
	private String b_name, room_name, id, request, name;
	private String indate, outdate;
	String firdate, secdate,content,pageIndex;
	
	public String getRequestBr() {
		if(request == null) {
			return "";
		}else {
		return request.replaceAll("\n", "<br>");
		}
	}
	
}
