package aaa.controll;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import aaa.service.CommentService;

import aaa.vo.CommentVO;

@Controller
//@RequestMapping("/board/comment_detail")
public class CommentController {

	@Resource(name = "commentService")
	CommentService mCommentService;

	/*
	 * @RequestMapping("board/list") // 댓글 리스트
	 * 
	 * List<CommentVO> mCommentServiceList(Model model) throws Exception {
	 * 
	 * return mCommentService.commentListService(); }
	 */
   @RequestMapping("/board/list") //댓글 리스트
   @ResponseBody private List<CommentVO> mCommentServiceList(CommentVO vo) throws Exception{
	  
	  return mCommentService.commentListService(vo); 
	  }
	 

	@RequestMapping("/board/insert") // 댓글 작성
	@ResponseBody
	private int mCommentServiceInsert(@RequestParam int b_no, @RequestParam String content, @RequestParam String writer) throws Exception {

		CommentVO comment = new CommentVO();
		comment.setB_no(b_no);
		comment.setContent(content);
		// 임시로 "test"값 설정
		comment.setWriter(writer);

		return mCommentService.commentInsertService(comment);
	}

	@RequestMapping("/board/update") // 댓글 수정
	@ResponseBody
	private int mCommentServiceUpdateProc(@RequestParam int c_no, @RequestParam String content) throws Exception {

		CommentVO comment = new CommentVO();
		comment.setC_no(c_no);
		comment.setContent(content);

		return mCommentService.commentUpdateService(comment);
	}

	@RequestMapping("/board/delete/{c_no}") // 댓글 삭제
	@ResponseBody
	private int mCommentServiceDelete(@PathVariable int c_no) throws Exception {

		return mCommentService.commentDeleteService(c_no);
	}

}
