package aaa.db;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.type.Alias;

import aaa.vo.BlacklistVO;
import aaa.vo.UserVo;


@Mapper
public interface adminMapp {
	
	List<UserVo> userTotal(UserVo vo); //전체 회원리스트
	UserVo userdd(UserVo vo);
	List<UserVo> getIdNo(); // 회원 주민번호 리스트
	int userSearchCnt(UserVo vo);
	int reCoverUser(BlacklistVO vo);
	
	
	List<UserVo> searchIdAdmin(UserVo vo);
	int adminSearchCnt(int kind);
	int adminreg(UserVo vo);
	
	List<UserVo> blackTotal(UserVo vo);
	int blackCnt();
	int regBlack(UserVo vo);
	int insertBlack(BlacklistVO vo);
	int deleteBlack(BlacklistVO vo);
	
	int backupId(String id);
	
	int returnAdmin(String id);
	
	String userPageCount(UserVo vo); // 이게 총 갯수 출력될 갯수
	String blackPageCnt(UserVo vo);
	String searchIdAdminPageCnt(UserVo vo);
	String userCntN(UserVo vo);
}
