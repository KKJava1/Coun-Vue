package com.jiawa.wiki.controller;

import com.jiawa.wiki.domain.Forum;
import com.jiawa.wiki.resp.CommonResp;
import com.jiawa.wiki.resp.ForumResp;
import com.jiawa.wiki.service.ForumService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/forum")
public class ForumController {

    @Resource
    private ForumService forumService;

    @PostMapping("/save")
    public CommonResp<ForumResp> saveForum(@RequestBody ForumResp forumResp){
        return forumService.saveForum(forumResp);
    }

}
