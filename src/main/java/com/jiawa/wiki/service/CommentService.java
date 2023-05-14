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
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

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
        List<CommentResp> rawComments = commentMapper.selectListByEbookId(ebookId);
        List<CommentResp> processedComments = new ArrayList<>();
        // 将主评论添加到processedComments数组中
        for (CommentResp comment : rawComments) {
            User user = userMapper.selectByPrimaryKey(comment.getUserId());
            comment.setName(user.getName());
            if (comment.getReplytouserId() != null) {
                User replyuser = userMapper.selectByPrimaryKey(comment.getReplytouserId());
                comment.setReplyname(replyuser.getName());
            }

            if (comment.getParentId() == null) { // 主评论
                comment.setReplies(new ArrayList<>()); // 添加空的replies数组
                processedComments.add(comment); // 添加到处理后的评论数组
            }
        }
        // 将回复评论添加到对应的主评论的replies数组中
        for (CommentResp reply : rawComments) {
            if (reply.getParentId() != null) { // 回复评论
                for (CommentResp parentComment : processedComments) {
                    if (parentComment.getId().equals(reply.getParentId())) {
                        parentComment.getReplies().add(reply);
                        break;
                    }
                }
            }
        }
        return processedComments;
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
