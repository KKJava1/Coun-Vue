package com.jiawa.wiki.service;

import com.jiawa.wiki.domain.Forum;
import com.jiawa.wiki.domain.User;
import com.jiawa.wiki.mapper.ForumMapper;
import com.jiawa.wiki.mapper.UserMapper;
import com.jiawa.wiki.resp.CommonResp;
import com.jiawa.wiki.resp.ForumResp;
import com.jiawa.wiki.util.CopyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class ForumService {
    @Resource
    private ForumMapper forumMapper;
    @Resource
    private UserMapper userMapper;
    public CommonResp<ForumResp> saveForum(ForumResp forumResp) {
        CommonResp<ForumResp> commonResp = new CommonResp<>();
        Forum forum = CopyUtil.copy(forumResp, Forum.class);
        Date date =new Date();
        forumMapper.insert(forum);
        User user = userMapper.selectByPrimaryKey(forumResp.getUserId());
        // 创建一个新的ForumResp对象，并把Forum和用户名复制到这个ForumResp对象中
        ForumResp newForumResp = CopyUtil.copy(forum, ForumResp.class);
        newForumResp.setUserName(user.getName());
        commonResp.setContent(newForumResp);
        return commonResp;
    }
}
