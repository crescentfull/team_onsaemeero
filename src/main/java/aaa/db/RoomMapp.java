package aaa.db;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import aaa.vo.BlacklistVO;
import aaa.vo.ReservationVO;
import aaa.vo.RoomVO;

@Mapper
public interface RoomMapp {
	
	List<RoomVO> roomList(RoomVO vo);
	List<ReservationVO> roomSearch(ReservationVO rvo);
	
	int reservationReg(ReservationVO rvo);
	
	List<ReservationVO> nowReservation(ReservationVO rvo);

	List<BlacklistVO> selectBlack(BlacklistVO bvo);
}
