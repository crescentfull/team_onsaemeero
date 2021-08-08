package aaa.db;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import aaa.vo.ReservationVO;

@Mapper
public interface rsvMapp {
	
	List<ReservationVO> rsvList(ReservationVO vo);
	
	List<ReservationVO> rsvSubList(ReservationVO vo);
	
	Integer resvDel(int no);
	
	String rsvListCnt(ReservationVO vo);
	String rsvSubListCnt(ReservationVO vo);
}
