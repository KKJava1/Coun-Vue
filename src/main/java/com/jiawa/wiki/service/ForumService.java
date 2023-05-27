package com.jiawa.wiki.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiawa.wiki.domain.Forum;
import com.jiawa.wiki.domain.ForumExample;
import com.jiawa.wiki.domain.User;
import com.jiawa.wiki.exception.BusinessException;
import com.jiawa.wiki.exception.BusinessExceptionCode;
import com.jiawa.wiki.mapper.ForumMapper;
import com.jiawa.wiki.mapper.UserMapper;
import com.jiawa.wiki.req.ForumQueryReq;
import com.jiawa.wiki.resp.CommonResp;
import com.jiawa.wiki.resp.ForumResp;
import com.jiawa.wiki.resp.PageResp;
import com.jiawa.wiki.resp.UserQueryResp;
import com.jiawa.wiki.util.CopyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ForumService {
    @Resource
    private ForumMapper forumMapper;
    @Resource
    private UserMapper userMapper;
    public CommonResp<Forum> saveForum(Forum forum) {
        //登录后才能进行一个发表意见，虽然前端已经进行了一个校验，但是我们还是需要校验一下
        if(forum.getUserId() == null){
            throw new BusinessException(BusinessExceptionCode.User_Ebook);
        }
        CommonResp commonResp = new CommonResp();
        Date now=new Date();
        forum.setCreateTime(now);
        int insert = forumMapper.insert(forum);
        commonResp.setContent(insert);
        return commonResp;
    }

    public PageResp<ForumResp> fetchForumList(ForumQueryReq req) {
        ForumExample forumExample =new ForumExample();
        PageHelper.startPage(req.getPage(), req.getSize());

        List<Forum> forumList = forumMapper.selectByExample(forumExample);
        PageInfo<Forum> pageInfo = new PageInfo<>(forumList);
        List<ForumResp> forumRespList = CopyUtil.copyList(forumList, ForumResp.class);

        //循环出来每一个数组
        forumRespList.forEach(forumResp -> {
            User user = userMapper.selectByPrimaryKey(forumResp.getUserId());
            forumResp.setAvatar(user.getAvatar());
            forumResp.setUserName(user.getName());
        });

        PageResp<ForumResp> pageResp = new PageResp();
        pageResp.setList(forumRespList);
        pageResp.setTotal(pageInfo.getTotal());
        return pageResp;
    }
}
