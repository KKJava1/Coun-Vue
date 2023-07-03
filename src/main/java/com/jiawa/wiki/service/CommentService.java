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
//    public List<CommentResp> selectByEbookId(Long ebookId) {
//        // 根据ebookId查询到电子书下的评论，包括用户信息和所有的回复
//        List<CommentResp> rawComments = commentMapper.selectListByEbookId(ebookId);
//
//        // 构建一个映射，用于快速查找每个评论的所有直接回复
//        Map<Long, List<CommentResp>> repliesMap = rawComments.stream()
//                .filter(comment -> comment.getParentId() != null)
//                .collect(Collectors.groupingBy(CommentResp::getParentId));
//
//        // 递归地添加每个评论的所有回复
//        for (CommentResp comment : rawComments) {
//            addReplies(comment, repliesMap);
//        }
//
//        // 过滤出所有顶级评论（即没有父评论的评论）
//        List<CommentResp> topComments = rawComments.stream()
//                .filter(comment -> comment.getParentId() == null)
//                .collect(Collectors.toList());
//
//        return topComments;
//    }
    public List<CommentResp> selectByEbookId(Long ebookId) {
        List<CommentResp> commentRespList = commentMapper.selectCommentResp(ebookId);
        // 创建一个映射，用于快速查找每个评论的所有直接回复
        Map<Long, List<CommentResp>> repliesMap = new HashMap<>();
        //所有顶级评论的列表
        ArrayList<CommentResp> pidList = new ArrayList<>();
        for (CommentResp comment : commentRespList) {
            if (comment.getParentId() != null) {
                //通过getOrDefault方法，得到父id的key值的一个arrayList，如果没有就创建一个
                List<CommentResp> respList = repliesMap.getOrDefault(comment.getParentId(), new ArrayList<>());
                respList.add(comment);
                repliesMap.put(comment.getParentId(), respList);
            }
            else {
                pidList.add(comment);
            }
        }
        // 对每个顶级评论进行递归，添加所有级别的子评论
        for (CommentResp comment : pidList) {
            addReplies(comment, repliesMap);
        }
        return pidList;
    }
    //递归
    private void addReplies(CommentResp comment, Map<Long, List<CommentResp>> repliesMap) {
        //调用map的get方法，通过id获取到对应的value
        List<CommentResp> replies = repliesMap.get(comment.getId());
        if (replies != null) {
            //假如这个id底下有子评论，就进行一个递归调用
            for (CommentResp reply : replies) {
                addReplies(reply, repliesMap);
            }
        }
        comment.setReplies(replies != null ? replies : new ArrayList<>());
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
