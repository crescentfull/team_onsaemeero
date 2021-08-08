package aaa.db;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.type.Alias;

import aaa.vo.UserVo;
import aaa.vo.BoardVO;
import aaa.vo.CancelVo;
import aaa.vo.ChatingVo;
import aaa.vo.ReservationVO;

@Mapper
public interface UserMapper {
	
	UserVo loginReg(UserVo vo);
	
	int joinReg(UserVo vo);
	
	int pwChange(UserVo vo);
	
	int deleteUser(UserVo vo);
	
	int mailchk(UserVo vo);
	
	Integer chkId(UserVo vo);
	Integer chkEmail(UserVo vo);
	
	UserVo findIdReg(UserVo vo);
	int findPwCnt(UserVo vo);
	
	List<ReservationVO> reservationChk(ReservationVO rvo);
	List<ReservationVO> bookingHistory(ReservationVO rvo);
	
	int deleteReservation(int no);
	
	int cancelReg(CancelVo cvo);
	
	int applyAdmin(String id);
	
	List<BoardVO> getQnA(UserVo vo);
	
	int modifyByIdReg(UserVo vo);
	
	List<CancelVo> cancelList(UserVo vo);
	
	List<ChatingVo> getMessagesFrom(String roomId);
	int addMessage(ChatingVo cvo);
	int newidcnt(String roomId);
	int deleteAllMessages(String roomId);
}
