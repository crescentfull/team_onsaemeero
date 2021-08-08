package aaa.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatingVo {
	
	private int newId;
	private String roomId;
	private String writer;
	private String body;
	
}
