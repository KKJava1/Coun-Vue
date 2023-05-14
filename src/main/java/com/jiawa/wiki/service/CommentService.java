package com.jiawa.wiki.service;

import com.jiawa.wiki.domain.Comment;
import com.jiawa.wiki.domain.Ebook;
import com.jiawa.wiki.domain.User;
import com.jiawa.wiki.exception.BusinessException;
import com.jiawa.wiki.exception.BusinessExceptionCode;
import com.jiawa.wiki.mapper.CommentMapper;
import com.jiawa.wiki.mapper.DocMapper;
import com.jiawa.wiki.mapper.EbookMapper;
import com.jiawa.wiki.mapper.UserMapper;
import com.jiawa.wiki.resp.CommentResp;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CommentService {
    @Resource
    private CommentMapper commentMapper;
    @Resource
    private UserMapper userMapper;
    @Resource
    private EbookMapper ebookMapper;

    private static final Logger LOG = LoggerFactory.getLogger(CommentService.class);


    public void save(Comment req) {
        if(req.getContent() == ""){
            throw new BusinessException(BusinessExceptionCode.Commit);
        }
        User user = userMapper.selectByPrimaryKey(req.getUserId());
        Ebook ebook = ebookMapper.selectByPrimaryKey(req.getEbookId());
        if(user==null){
            throw new BusinessException(BusinessExceptionCode.User_Ebook);
        }
        Date now = new Date();
        //设置创建时间
        req.setCreateTime(now);
        commentMapper.insert(req);
    }

    public List<CommentResp> selectByEbookId(Long ebookId) {
        List<CommentResp> comments = commentMapper.selectListByEbookId(ebookId);

        for (CommentResp comment : comments) {
            User user = userMapper.selectByPrimaryKey(comment.getUserId());
            comment.setName(user.getName());

            if (comment.getReplytouserId() != null) {
                User replyuser = userMapper.selectByPrimaryKey(comment.getReplytouserId());
                comment.setReplyname(replyuser.getName());
            }
        }
        return comments;
    }


    //回复评论
    public CommentResp saveReply(CommentResp req) {
        if(req.getContent() == ""){
            throw new BusinessException(BusinessExceptionCode.Commit);
        }
        User user = userMapper.selectByPrimaryKey(req.getUserId());
        User replyuser = userMapper.selectByPrimaryKey(req.getReplytouserId());
        Date now = new Date();
        //设置创建时间
        req.setCreateTime(now);
        commentMapper.insertCommentResp(req);
        // 使用这个 ID 来查询并返回新插入的数据
        CommentResp commentResp = commentMapper.selectByCommentRespId(req.getId());
        commentResp.setName(user.getName());
        commentResp.setReplyname(replyuser.getName());
        return commentResp;
    }
}
