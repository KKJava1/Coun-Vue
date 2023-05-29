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
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

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
        List<Forum> forumList = forumMapper.selectByExample(forumExample);
        //返回一个所有的用户id已便进行后续查询
        List<Long> UserIds = forumList.stream().map(Forum::getUserId).collect(Collectors.toList());
        //查询到所有用户信息
        Map<Long, User> userMap = userMapper.selectByIds(UserIds)
                .stream()
                .collect(Collectors.toMap(User::getId, Function.identity()));
        //使用函数式编程将Forum类型转换为ForumResp类型
        List<ForumResp> forumRespList = forumList.stream().map(forum -> {
            ForumResp forumResp = CopyUtil.copy(forum, ForumResp.class);
            User user = userMap.get(forum.getUserId());
            forumResp.setUserName(user.getName());
            forumResp.setAvatar(user.getAvatar());
            return forumResp;
        }).collect(Collectors.toList());

        PageHelper.startPage(req.getPage(), req.getSize());
        PageInfo<Forum> pageInfo = new PageInfo<>(forumList);
        PageResp<ForumResp> pageResp = new PageResp();
        pageResp.setList(forumRespList);
        pageResp.setTotal(pageInfo.getTotal());
        return pageResp;
    }

    public CommonResp forumcontent(Long id) {
        CommonResp resp=new CommonResp();
        if(id == null){
            throw new BusinessException(BusinessExceptionCode.ForumContent);
        }
        Forum forum = forumMapper.selectByPrimaryKey(id);
        ForumResp forumResp = CopyUtil.copy(forum, ForumResp.class);
        User user = userMapper.selectByPrimaryKey(forumResp.getUserId());
        forumResp.setUserName(user.getName());
        forumResp.setAvatar(user.getAvatar());
        resp.setContent(forumResp);
        return resp;
    }
}
