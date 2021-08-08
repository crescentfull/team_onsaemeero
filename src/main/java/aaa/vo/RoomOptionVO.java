package aaa.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "roomOptionVO")
public class RoomOptionVO {
	
	String b_name,event;
	int price;
}
