package aaa.db;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import aaa.vo.CommentVO;


@Mapper
public interface CommentMapppp {
	
    // 댓글 개수
    int commentCount();
 
    // 댓글 목록
    List<CommentVO> commentList(CommentVO comment) ;
 
    // 댓글 작성
    int commentInsert(CommentVO comment);
    
    // 댓글 수정
    int commentUpdate(CommentVO comment);
 
    // 댓글 삭제
    int commentDelete(int c_no);



	 
	}
	 


