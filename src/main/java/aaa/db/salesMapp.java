package aaa.db;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import aaa.time.Ymd;
import aaa.vo.BranchVo;
import aaa.vo.ReservationVO;

@Mapper
public interface salesMapp {
	
	
	List<ReservationVO> salesYListSu(Ymd ymd);
	List<ReservationVO> salesYListGr(Ymd ymd);
	List<ReservationVO> salesYListJj(Ymd ymd);
	List<ReservationVO> salesYListGj(Ymd ymd);
	
	List<ReservationVO> salesMListSu(Ymd ymd);
	List<ReservationVO> salesMListGr(Ymd ymd);
	List<ReservationVO> salesMListJj(Ymd ymd);
	List<ReservationVO> salesMListGj(Ymd ymd);
	
	
	List<ReservationVO> salesDListSu(Ymd ymd);
	List<ReservationVO> salesDListGr(Ymd ymd);
	List<ReservationVO> salesDListJj(Ymd ymd);
	List<ReservationVO> salesDListGj(Ymd ymd);
	
	BranchVo month(BranchVo bvo);
	BranchVo monthCancel(String canceldate);
	
	BranchVo year(BranchVo bvo);
	BranchVo yearCancel(String canceldate);
	
	BranchVo day(BranchVo bvo);
	BranchVo dayCancel(String canceldate);
	
}
