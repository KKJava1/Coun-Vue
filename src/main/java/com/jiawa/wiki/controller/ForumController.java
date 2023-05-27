package com.jiawa.wiki.controller;

import com.jiawa.wiki.domain.Forum;
import com.jiawa.wiki.domain.ForumExample;
import com.jiawa.wiki.req.DocQueryReq;
import com.jiawa.wiki.req.ForumQueryReq;
import com.jiawa.wiki.resp.*;
import com.jiawa.wiki.service.ForumService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/forum")
public class ForumController {

    @Resource
    private ForumService forumService;

    @PostMapping("/save")
    public CommonResp<Forum> saveForum(@RequestBody Forum forum){
        return forumService.saveForum(forum);
    }
    @GetMapping("/fetchForumList")
    public CommonResp fetchForumList(ForumQueryReq req) {
        CommonResp<PageResp<ForumResp>> resp = new CommonResp<>();
        PageResp<ForumResp> forumRespList= forumService.fetchForumList(req);
        resp.setContent(forumRespList);
        return resp;
    }

}
