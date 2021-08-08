package aaa.db;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import aaa.vo.ReservationVO;
import aaa.vo.RoomOptionVO;
import aaa.vo.RoomVO;

@Mapper
public interface bchMapp {
	
	List<RoomVO> roomPrice();
	
	int fixBlackPrice(RoomVO vo);
	int fixRedPrice(RoomVO vo);
	
	List<RoomOptionVO> optionList(String b_name);
	int optionCntString(String b_name);
	int optionCnt(RoomOptionVO vo);
	int insertOption(RoomOptionVO vo);
	int deleteOption(RoomOptionVO vo);
	
	List<RoomOptionVO> addOptionList(RoomOptionVO rvo);
	
}
