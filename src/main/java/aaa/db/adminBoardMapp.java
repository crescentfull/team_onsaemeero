package aaa.db;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.type.Alias;

import aaa.vo.UserVo;


@Mapper
public interface adminBoardMapp {
	
	List<UserVo> bAdminMapp();
	int bAdminDelete(String id);
	int adminCnt();
}
