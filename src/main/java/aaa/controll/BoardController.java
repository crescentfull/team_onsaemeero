package aaa.controll;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import aaa.db.BoardMapp;

import aaa.vo.BoardReplyVO;
import aaa.vo.BoardVO;
import aaa.vo.ReservationVO;
import aaa.vo.UserVo;

@Controller
public class BoardController {
	
	@Resource
	BoardMapp mapper;

	//게시판 목록
	@RequestMapping("board/boardlist")
	String boardlist() {
		
		return "board/boardlist";
	}
	
	@RequestMapping("/board/all_list")
	ModelAndView alllist(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/all_list");
		
		mav.addObject("mainData",mapper.bblist(vo));
		
		return mav;
	}
	  @RequestMapping("/board/adminNotice_list") 
	  ModelAndView adminnoticelist(BoardVO vo) {
	  
	  ModelAndView mav = new ModelAndView("board/adminNotice_list");
	  
	  vo.setTotal(mapper.adminNotice_Total(vo)); 
	  mav.addObject("mainData",mapper.adminlist(vo)); 
	  
	  return mav;
	  
	  }
	  
	@RequestMapping("/board/notice_list")
	ModelAndView noticelist(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/notice_list");

		 vo.setTotal(mapper.notice_Total(vo)); 
		mav.addObject("mainData",mapper.noticelist(vo));

		return mav;
	}
	 
	  @RequestMapping("/board/faq_list") ModelAndView faqlist(BoardVO vo) {
	  
	  ModelAndView mav = new ModelAndView("board/faq_list");
	  
	  vo.setTotal(mapper.faq_Total(vo)); 
	  mav.addObject("mainData",mapper.faqlist(vo)); 
	  
	  return mav;
	  
	  }
	  
	  @RequestMapping("/board/qna_list") ModelAndView qnalist(HttpSession session, BoardVO vo) {
	  
	  ModelAndView mav = new ModelAndView("board/qna_list");
	
	  UserVo uvo = (UserVo)session.getAttribute("userdata");
	  uvo.setNowPage2(vo.getNowPage2());
	  uvo.setNowPage3(vo.getNowPage3());
	  //List<BoardVO> bvo = mapper.qnalist2(uv);
	  vo.setTotal(mapper.qna_Total(vo));
	  
	  vo.setTotal2((mapper.qnalist2_total(uvo)));
	  vo.setTotal3((mapper.qnalist3_total(uvo)));
	  
	  mav.addObject("mainData",mapper.qnalist(vo)); 
	  
	  mav.addObject("qnalist",mapper.qnalist2(uvo));
	  mav.addObject("qnalist2",mapper.qnalist3(uvo));
	  return mav;
	  
	  }
	  
	  @RequestMapping("/board/review_list") 
	  ModelAndView reviewlist(BoardVO vo) {
	  
	  ModelAndView mav = new ModelAndView("board/review_list");
	  
	  vo.setTotal(mapper.review_Total(vo)); 
	  mav.addObject("mainData",mapper.reviewlist(vo)); 
	  
	  return mav;
	  }
	  //지점후기
		@RequestMapping("/branch/branch_su_review")
		ModelAndView su_review(BoardVO vo) {
			
			ModelAndView mav = new ModelAndView("/branch/branch_su_review");
			vo.setTotal(mapper.reviewlistsu_total(vo)); 
			mav.addObject("mainData",mapper.reviewlistsu(vo));
			return mav;
		}
		@RequestMapping("/branch/branch_gr_review")
		ModelAndView gr_review(BoardVO vo) {
			
			ModelAndView mav = new ModelAndView("/branch/branch_gr_review");
			vo.setTotal(mapper.reviewlistgr_total(vo)); 
			mav.addObject("mainData",mapper.reviewlistgr(vo));
			return mav;
		}
		@RequestMapping("/branch/branch_jj_review")
		ModelAndView jj_review(BoardVO vo) {
			
			ModelAndView mav = new ModelAndView("/branch/branch_jj_review");
			vo.setTotal(mapper.reviewlistjj_total(vo)); 
			 mav.addObject("mainData",mapper.reviewlistjj(vo)); 
			
			return mav;
		}
		@RequestMapping("/branch/branch_kj_review")
		ModelAndView kj_review(BoardVO vo) {
			
			ModelAndView mav = new ModelAndView("/branch/branch_kj_review");
			vo.setTotal(mapper.reviewlistkj_total(vo)); 
			 mav.addObject("mainData",mapper.reviewlistkj(vo)); 
			return mav;
		}
		
		
		//지점 
		
		@RequestMapping("branch/branch_su")
		ModelAndView branchsu(BoardVO vo) {
			ModelAndView mav = new ModelAndView("branch/branch_su");
			 mav.addObject("mainData",mapper.reviewlistsu(vo)); 
			return mav;
		}
	
		@RequestMapping("branch/branch_jj")
		ModelAndView branchjj(BoardVO vo) {
			ModelAndView mav = new ModelAndView("branch/branch_jj");
			
			 mav.addObject("mainData",mapper.reviewlistjj(vo)); 
			return mav;
		}
		
		@RequestMapping("branch/branch_gr")
		ModelAndView branchgr(BoardVO vo) {
			ModelAndView mav = new ModelAndView("branch/branch_gr");
			 mav.addObject("mainData",mapper.reviewlistgr(vo)); 
			return mav;
		}
		
		@RequestMapping("branch/branch_kj")
		ModelAndView branchkj(BoardVO vo) {
			ModelAndView mav = new ModelAndView("branch/branch_kj");
			 mav.addObject("mainData",mapper.reviewlistkj(vo)); 
			return mav;
		}
	  

	 
	
	//글 상세정보
	@RequestMapping("/board/board_detail")
	ModelAndView detail1(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/board_detail");
		
		mapper.addCount(vo);
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
		
	}

	@RequestMapping("/board/notice_detail")
	ModelAndView notice(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/notice_detail");
		
		mapper.addCount(vo);
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
		
	}
	@RequestMapping("/board/faq_detail")
	ModelAndView faq(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/faq_detail");
		
		mapper.addCount(vo);
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
		
	}
	@RequestMapping("/board/qna_detail")
	ModelAndView qna(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/qna_detail");
		
		mapper.addCount(vo);
		mav.addObject("mainData",mapper.bbDetail(vo));
		mav.addObject("replyData",mapper.brDetail(vo));
		return mav;
		
	}
	
	
	@RequestMapping("/board/adminNotice_detail")
	ModelAndView admin(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/adminNotice_detail");
		
		mapper.addCount(vo);
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
		
	}
	@RequestMapping("/board/review_detail")
	ModelAndView review(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/review_detail");
		
		mapper.addCount(vo);
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
		
	}
	
	//글 작성
	@RequestMapping("/board/notice_writeForm")
	String writeForm() {
		
		return "board/notice_writeForm";
		
	}
	
	  @RequestMapping("/board/qna_writeForm") String qwriteForm() {
	  
	  
	  return "board/qna_writeForm";
	  
	  }
	  
		
		  @RequestMapping("/board/review_writeForm") ModelAndView
		  rwriteForm(ReservationVO rvo) {
		  
		  ModelAndView mav = new ModelAndView("/board/review_writeForm");
		  System.out.println(rvo); 
		  mav.addObject("reviewData",rvo);
		  
		  return mav;
		  
		  }
	  
	  
	  @RequestMapping("/board/faq_writeForm") String fwriteForm() {
	  
	  
	  return "board/faq_writeForm";
	  
	  }
	  
	  @RequestMapping("/board/adminNotice_writeForm") String awriteForm() {
	  
	  
	  return "board/adminNotice_writeForm";
	  
	  }
	 
	
	//글 작성 액션
	@RequestMapping("/board/writeReg")
	ModelAndView writeReg(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");

		int cnt = 0;
		System.out.println("writeReg cnt : "+cnt);
		
		if(vo.getTitle()=="") {
			mav.addObject("msg","제목이 없습니다.");
			mav.addObject("url","javascript:history.back();");
		}else if(vo.getKind().equals("notice")) {
			cnt= mapper.bbInsert(vo);
			mav.addObject("msg","작성되었습니다");
			mav.addObject("url","notice_list");
		}
		else if(vo.getKind().equals("adminNotice")) {
			cnt= mapper.bbInsert(vo);
			mav.addObject("msg","작성되었습니다");
			mav.addObject("url","adminNotice_list");
		}
		else if(vo.getKind().equals("review")) {
			if(vo.getCategory()=="") {
				mav.addObject("msg","지점이 지정되지 않았습니다");
				mav.addObject("url","review_writeForm");
			}else {
			cnt= mapper.bbInsert(vo);
			mav.addObject("msg","작성되었습니다");
			mav.addObject("url","review_list");
		}
		}
		else if(vo.getKind().equals("faq")) {
			cnt= mapper.bbInsert(vo);
			mav.addObject("msg","작성되었습니다");
			mav.addObject("url","faq_list");
		}	
		else if(vo.getKind().equals("qna")) {
			if(vo.getCategory()=="") {
				mav.addObject("msg","지점이 지정되지 않았습니다");
				mav.addObject("url","qna_writeForm");
			}else {
				cnt= mapper.replyInsert(vo);
			mav.addObject("msg","작성되었습니다");
			mav.addObject("url","qna_list");
			}
		}
		else if(vo.getKind().equals("reply")) {
			cnt= mapper.bbInsert(vo);
			mav.addObject("msg","작성되었습니다");
			mav.addObject("url","qna_list");
		}

		return mav;	
	}
	
	//글 수정 
	@RequestMapping("/board/board_modifyForm")
	ModelAndView modifyForm(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/board_modifyForm");
		
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
	}
	@RequestMapping("/board/notice_modifyForm")
	ModelAndView nmodifyForm(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/notice_modifyForm");
		
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
	}
	@RequestMapping("/board/review_modifyForm")
	ModelAndView rmodifyForm(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/review_modifyForm");
		
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
	}
	@RequestMapping("/board/faq_modifyForm")
	ModelAndView fmodifyForm(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/faq_modifyForm");
		
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
	}
	@RequestMapping("/board/qna_modifyForm")
	ModelAndView qmodifyForm(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/qna_modifyForm");
		
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
	}

	@RequestMapping("/board/adminNotice_modifyForm")
	ModelAndView amodifyForm(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/adminNotice_modifyForm");
		
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
	}
	
	//글 수정 액션
	@RequestMapping("/board/modifyReg")
	ModelAndView modifyReg(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		/*
		 * String msg = "암호가 일치하지 않습니다"; String url = "modifyForm?no="+vo.getNo();
		 */
		int cnt = 0;

		
	
		
		
		System.out.println("modifyReg cnt : "+cnt);
		
		if(vo.getTitle() == "") {
			mav.addObject("msg","제목이 없습니다.");
			mav.addObject("url","javascript:history.back();");
		}else if(vo.getKind().equals("notice")) {
			cnt = mapper.bbModify(vo);
			mav.addObject("msg","수정되었습니다");
			mav.addObject("url","notice_detail?no="+vo.getNo());
			
		}else if(vo.getKind().equals("adminNotice")) {
			cnt = mapper.bbModify(vo);
			mav.addObject("msg","수정되었습니다");
			mav.addObject("url","adminNotice_detail?no="+vo.getNo());
		}
		else if(vo.getKind().equals("review")) {
			cnt = mapper.bbModify(vo);
			mav.addObject("msg","수정되었습니다");
			mav.addObject("url","review_detail?no="+vo.getNo());
		}
		else if(vo.getKind().equals("faq")) {
			cnt = mapper.bbModify(vo);
			mav.addObject("msg","수정되었습니다");
			mav.addObject("url","faq_detail?no="+vo.getNo());
		}	
		
		else if(vo.getKind().equals("qna")) {
			cnt = mapper.bbModify(vo);
			mav.addObject("msg","수정되었습니다");
			mav.addObject("url","qna_detail?no="+vo.getNo());
		}else if(vo.getKind().equals("reply")) {
			cnt = mapper.bbModify(vo);
			System.out.println("modifyReg gno : "+vo);
			mav.addObject("msg","수정되었습니다");
			mav.addObject("url","qna_detail?no="+vo.getGno());
		}
		System.out.println("modifyReg cnt : "+cnt);

		return mav;
	}
	
	//글 삭제
	@RequestMapping("/board/board_deleteForm")
	String deleteForm(BoardVO vo) {
		
		return "board/board_deleteForm";
	}

	//글 삭제 액션
	@RequestMapping("/board/deleteReg")
	ModelAndView deleteReg(BoardVO vo) {
		
		
		ModelAndView mav = new ModelAndView("alert");
		
		
		int cnt = 0;
		int cnr = 0;
		
		
		if(vo.getKind().equals("notice")) {
			cnt = mapper.bbDelete(vo);
			mav.addObject("msg","삭제되었습니다");
			mav.addObject("url","notice_list");
		}
		else if(vo.getKind().equals("adminNotice")) {
			cnt = mapper.bbDelete(vo);
			mav.addObject("msg","삭제되었습니다");
			mav.addObject("url","adminNotice_list");
		}
		else if(vo.getKind().equals("review")) {
			cnt = mapper.bbDelete(vo);
			mav.addObject("msg","삭제되었습니다");
			mav.addObject("url","review_list");
		}
		else if(vo.getKind().equals("faq")) {
			cnt = mapper.bbDelete(vo);
			mav.addObject("msg","삭제되었습니다");
			mav.addObject("url","faq_list");
		} 
		else if(vo.getKind().equals("qna")) {
			cnt = mapper.bbDelete(vo);
			mav.addObject("msg","삭제되었습니다");
			mav.addObject("url","qna_list");
		}else if(vo.getKind().equals("reply")) {
			cnr = mapper.brInsert3(vo);
			cnt = mapper.bbDelete(vo);
			System.out.println("reply? : "+vo);
			mav.addObject("msg","삭제되었습니다");
			mav.addObject("url","qna_list");
		}
		System.out.println("deleteReg cnt : "+cnt);
		System.out.println("deleteReg cnr : "+cnr);
		return mav;
	}
	//!!! 답변
	//답글 리스트
	@RequestMapping("/board/bordreply_list")
	ModelAndView brlist(BoardReplyVO vor) {
		
		ModelAndView mav = new ModelAndView("#");

		mav.addObject("replyData",mapper.brlist(vor));

		return mav;
	}
	
	@RequestMapping("/board/reply_modifyForm")
	ModelAndView brmodifyForm(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/reply_modifyForm");
		
		mav.addObject("replyData",mapper.brDetail(vo));
		mav.addObject("mainData",mapper.bbDetail(vo));
		return mav;
	}

	//답변폼

	 
	//답변 작성 액션
	  @RequestMapping("/board/brwriteReg")
		ModelAndView brwriteReg(BoardVO vo) {
			
			ModelAndView mav = new ModelAndView("alert");
			
		
			
			int cnt = 0;
			int cnt2 = 0;
			
			
			if(vo.getTitle()=="") {
				mav.addObject("msg","제목이 없습니다.");
				mav.addObject("url","javascript:history.back();");
			}else {
				cnt = mapper.brInsert(vo);
				cnt2 = mapper.brInsert2(vo);
				mav.addObject("msg","작성이 완료되었습니다");
				mav.addObject("url","qna_detail?no="+vo.getNo());
			}
			 
			System.out.println("writeReg cnt : "+cnt+","+cnt2);
			return mav;	
		}
		
	 
}


