package aaa.db;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import aaa.vo.BoardReplyVO;
import aaa.vo.BoardVO;
import aaa.vo.UserVo;

@Mapper
public interface BoardMapp {//xml 연동해서 사용한다

	//게시판
	 List<BoardVO> bblist(BoardVO vo);
	 List<BoardVO> noticelist(BoardVO vo);
	 List<BoardVO> faqlist(BoardVO vo);
	 List<BoardVO> qnalist(BoardVO vo);
	 List<BoardVO> qnalist2(UserVo uvo);
	 List<BoardVO> qnalist3(UserVo uvo);
	 List<BoardVO> reviewlist(BoardVO vo);
	 List<BoardVO> reviewlistjj(BoardVO vo);
	 List<BoardVO> reviewlistgr(BoardVO vo);
	 List<BoardVO> reviewlistkj(BoardVO vo);
	 List<BoardVO> reviewlistsu(BoardVO vo);
	 List<BoardVO> adminlist(BoardVO vo);
	//게시판 페이징 카운트
	int qna_Total(BoardVO vo);
	int adminNotice_Total(BoardVO vo);
	int notice_Total(BoardVO vo);
	int review_Total(BoardVO vo);
	int faq_Total(BoardVO vo);
	
	int reviewlistsu_total(BoardVO vo);
	int reviewlistjj_total(BoardVO vo);
	int reviewlistgr_total(BoardVO vo);
	int reviewlistkj_total(BoardVO vo);
	
	int qnalist2_total(UserVo uvo);
	int qnalist3_total(UserVo uvo);
	// 
	 void addCount(BoardVO vo);
	
	 BoardVO bbDetail(BoardVO vo);
	 
	 int bbInsert(BoardVO vo);
	 int replyInsert(BoardVO vo);
	 
	 int bbModify(BoardVO vo);
	 
	 int bbDelete(BoardVO vo);
	 
	//답글
	 List<BoardReplyVO> brlist(BoardReplyVO vor);
	
	 //void addrCount(BoardReplyVO vor);
		
	 BoardVO brDetail(BoardVO vo);
	 
	 int brInsert(BoardVO vo);
	 int brInsert2(BoardVO vo);
	 int brInsert3(BoardVO vo);

	 
	 //int brModify(BoardReplyVO vor);
	 
	 //int brDelete(BoardReplyVO vor);
}