package com.jiawa.wiki.controller;

import com.jiawa.wiki.domain.Comment;
import com.jiawa.wiki.domain.ReadProgress;
import com.jiawa.wiki.domain.UserBooks;
import com.jiawa.wiki.req.DocQueryReq;
import com.jiawa.wiki.req.DocSaveReq;
import com.jiawa.wiki.resp.CommentResp;
import com.jiawa.wiki.resp.DocQueryResp;
import com.jiawa.wiki.resp.CommonResp;
import com.jiawa.wiki.resp.PageResp;
import com.jiawa.wiki.service.CommentService;
import com.jiawa.wiki.service.DocService;
import com.jiawa.wiki.service.ReadProgressService;
import com.jiawa.wiki.service.UserBookService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/doc")
public class DocController {

    @Resource
    private DocService docService;

    @Resource
    private CommentService commentService;

    @Resource
    private UserBookService userBookService;

    @Resource
    private ReadProgressService readProgressService;

    @PostMapping("/saveDocrecord")
    public CommonResp<ReadProgress> saveDocrecord(@Valid @RequestBody ReadProgress req) {
        return readProgressService.saveDocrecord(req);
    }
    @GetMapping("/obrecord")
    public CommonResp<ReadProgress> obrecord(@RequestParam Long userId, @RequestParam Long ebookId) {
        return readProgressService.obrecord(userId,ebookId);
    }


    //提交评论
    @PostMapping("/handleSubmitComment")
    public CommonResp handleSubmitComment(@Valid @RequestBody Comment req) {
        CommonResp resp = new CommonResp<>();
        commentService.save(req);
        return resp;
    }

    //回复评论
    @PostMapping("/handleReplyComment")
    public CommonResp<CommentResp> handleReplyComment(@Valid @RequestBody CommentResp req) {
        CommonResp<CommentResp> resp = new CommonResp<>();
        CommentResp commentResp = commentService.saveReply(req);
        resp.setContent(commentResp);
        return resp;
    }

    //收藏书本
    @PostMapping("/collect")
    public CommonResp collect(@Valid @RequestBody UserBooks req) {
        CommonResp resp = new CommonResp<>();
        int collectStatus  = userBookService.collectBook(req);
        resp.setContent(collectStatus);
        return resp;
    }


    @GetMapping("/comments/{ebookId}")
    public CommonResp CommentResp(@PathVariable Long ebookId) {
        CommonResp<List<CommentResp>> resp = new CommonResp<>();
        List<CommentResp> comments = commentService.selectByEbookId(ebookId);
        resp.setContent(comments);
        return resp;
    }

    @GetMapping("/all/{ebookId}")
    public CommonResp all(@PathVariable Long ebookId) {
        CommonResp<List<DocQueryResp>> resp = new CommonResp<>();
        List<DocQueryResp> list = docService.all(ebookId);
        resp.setContent(list);
        return resp;
    }

    @GetMapping("/list")
    public CommonResp list(@Valid DocQueryReq req) {
        CommonResp<PageResp<DocQueryResp>> resp = new CommonResp<>();
        PageResp<DocQueryResp> list = docService.list(req);
        resp.setContent(list);
        return resp;
    }

    @PostMapping("/save")
    public CommonResp save(@Valid @RequestBody DocSaveReq req) {
        CommonResp resp = new CommonResp<>();
        docService.save(req);
        return resp;
    }

    @DeleteMapping("/delete/{idsStr}")
    public CommonResp delete(@PathVariable String idsStr) {
        CommonResp resp = new CommonResp<>();
        List<String> list = Arrays.asList(idsStr.split(","));
        docService.delete(list);
        return resp;
    }

    @GetMapping("/find-content/{id}")
    public CommonResp findContent(@PathVariable Long id) {
        CommonResp<String> resp = new CommonResp<>();
        String content = docService.findContent(id);
        resp.setContent(content);
        return resp;
    }

    @GetMapping("/vote/{id}")
    public CommonResp vote(@PathVariable Long id) {
        CommonResp commonResp = new CommonResp();
        docService.vote(id);
        return commonResp;
    }




}
