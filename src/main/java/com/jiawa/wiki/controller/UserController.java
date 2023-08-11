package com.jiawa.wiki.controller;

import com.alibaba.fastjson.JSONObject;
import com.jiawa.wiki.domain.Ebook;
import com.jiawa.wiki.domain.User;
import com.jiawa.wiki.domain.UserBooks;
import com.jiawa.wiki.req.UserLoginReq;
import com.jiawa.wiki.req.UserQueryReq;
import com.jiawa.wiki.req.UserResetPasswordReq;
import com.jiawa.wiki.req.UserSaveReq;
import com.jiawa.wiki.resp.CommonResp;
import com.jiawa.wiki.resp.PageResp;
import com.jiawa.wiki.resp.UserLoginResp;
import com.jiawa.wiki.resp.UserQueryResp;
import com.jiawa.wiki.service.UserBookService;
import com.jiawa.wiki.service.UserService;
import com.jiawa.wiki.util.SnowFlake;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/user")
public class UserController {

    private static final Logger LOG = LoggerFactory.getLogger(UserController.class);

    @Resource
    private UserService userService;

    @Resource
    private SnowFlake snowFlake;

    @Resource
    private RedisTemplate redisTemplate;
    @Resource
    private UserBookService userBookService;
    @GetMapping("/collect/{id}")
    public CommonResp collect(@Valid @PathVariable Long id) {
        CommonResp resp = new CommonResp<>();
        List<Ebook> list =userBookService.fetchCollect(id);
        resp.setContent(list);
        return resp;
    }

    @GetMapping("/list")
    public CommonResp list(@Valid UserQueryReq req) {
        CommonResp<PageResp<UserQueryResp>> resp = new CommonResp<>();
        PageResp<UserQueryResp> list = userService.list(req);
        resp.setContent(list);
        return resp;
    }

    @PostMapping("/save")
    public CommonResp save(@Valid @RequestBody UserSaveReq req) {
        req.setPassword(DigestUtils.md5DigestAsHex(req.getPassword().getBytes()));
        CommonResp resp = new CommonResp<>();
        userService.save(req);
        return resp;
    }

    @DeleteMapping("/delete/{id}")
    public CommonResp delete(@PathVariable Long id) {
        CommonResp resp = new CommonResp<>();
        userService.delete(id);
        return resp;
    }

    //修改密码
    @PostMapping("/reset-password")
    public CommonResp resetPassword(@Valid @RequestBody UserResetPasswordReq req) {
        req.setPassword(DigestUtils.md5DigestAsHex(req.getPassword().getBytes()));
        CommonResp resp = new CommonResp<>();
        userService.resetPassword(req);
        return resp;
    }

    @PostMapping("/regirster")
    public CommonResp regirster(@Valid @RequestBody User user) {
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        CommonResp resp = new CommonResp<>();
        userService.regirster(user);
        return resp;
    }
    @PostMapping("/login")
    public CommonResp login(@Valid @RequestBody UserLoginReq req, HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        System.out.println(header);
        req.setPassword(DigestUtils.md5DigestAsHex(req.getPassword().getBytes()));
        CommonResp<UserLoginResp> resp = new CommonResp<>();
        UserLoginResp userLoginResp = userService.login(req);
        //利用雪花算法生成唯一的token
        Long token = snowFlake.nextId();
        LOG.info("生成单点登录token：{}，并放入redis中", token);
        userLoginResp.setToken(token.toString());
        // 设置token过期时间为30分钟
        redisTemplate.opsForValue().set(token.toString(), JSONObject.toJSONString(userLoginResp), 1800, TimeUnit.SECONDS);
        resp.setContent(userLoginResp);
        return resp;
    }


    @GetMapping("/logout/{token}")
    public CommonResp logout(@PathVariable String token) {
        CommonResp resp = new CommonResp<>();
        redisTemplate.delete(token);
        LOG.info("从redis中删除token: {}", token);
        return resp;
    }

}
