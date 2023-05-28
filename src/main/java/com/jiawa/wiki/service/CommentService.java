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
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

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
        //根据ebookId查询到电子书下的评论
        List<CommentResp> rawComments = commentMapper.selectListByEbookId(ebookId);
        //循环所有的userIds将他组成一个集合进行一个批量查询
        List<Long> userIds = rawComments.stream().map(CommentResp::getUserId).collect(Collectors.toList());
        List<User> userList = userMapper.selectByIds(userIds);

        //创建一个Map，用于后续的存储
        Map<Long, User> UserMap = userList.stream().collect(Collectors.toMap(User::getId, Function.identity()));

        // 创建一个映射，用于快速查找每个评论的所有直接回复
        Map<Long, List<CommentResp>> repliesMap = new HashMap<>();
        for (CommentResp comment : rawComments) {
            //根据键值对进行一个对应
            User user = UserMap.get(comment.getUserId());
            comment.setName(user.getName());
            comment.setAvatar(user.getAvatar());
            if (comment.getParentId() != null) {
                repliesMap.computeIfAbsent(comment.getParentId(), k -> new ArrayList<>()).add(comment);
                User replyUser = UserMap.get(comment.getReplytouserId());
                comment.setReplyname(replyUser.getName());
            }
         }
        // 递归地添加每个评论的所有回复
        for (CommentResp comment : rawComments) {
            addReplies(comment, repliesMap);
        }
        // 过滤出所有顶级评论（即没有父评论的评论）
        List<CommentResp> topComments = rawComments.stream()
                .filter(comment -> comment.getParentId() == null)
                .collect(Collectors.toList());

        return topComments;
    }
    //递归
    private void addReplies(CommentResp comment, Map<Long, List<CommentResp>> repliesMap) {
        List<CommentResp> directReplies = repliesMap.get(comment.getId());
        if (directReplies == null) {
            // 如果没有直接回复，就添加一个空数组
            comment.setReplies(new ArrayList<>());
        } else {
            // 如果有直接回复，就递归地添加它们的所有回复
            for (CommentResp reply : directReplies) {
                addReplies(reply, repliesMap);
            }
            comment.setReplies(directReplies);
        }
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
