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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

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
        if(user==null&& ebook==null){
            throw new BusinessException(BusinessExceptionCode.User_Ebook);
        }
        Date now = new Date();
        //设置创建时间
        req.setCreateTime(now);
        commentMapper.insert(req);
    }
}
