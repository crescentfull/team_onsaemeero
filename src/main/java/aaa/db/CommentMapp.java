package aaa.db;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import aaa.vo.CommentVO;

@Mapper
public interface CommentMapp {

	//댓글 갯수
	int commentCount();
    
    // 댓글 목록
    List<CommentVO> commentList() ;
    // 댓글 작성
    int commentInsert(CommentVO comment);
    
    // 댓글 수정
    int commentUpdate(CommentVO comment) ;
 
    // 댓글 삭제
    int commentDelete(int cno);
}
