package aaa.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.db.CommentMapppp;
import aaa.vo.CommentVO;

@Service("commentService")
public class CommentService {
 
    @Resource
    CommentMapppp mCommentMapper;
    
    public List<CommentVO> commentListService(CommentVO vo){
        
        return mCommentMapper.commentList(vo);
    }
    
    public int commentInsertService(CommentVO comment){
        
        return mCommentMapper.commentInsert(comment);
    }
    
    public int commentUpdateService(CommentVO comment){
        
        return mCommentMapper.commentUpdate(comment);
    }
    
    public int commentDeleteService(int c_no) throws Exception{
        
        return mCommentMapper.commentDelete(c_no);
    }
}



