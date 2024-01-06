package com.jiawa.wiki.controller;

import com.jiawa.wiki.aspect.LogAspect;
import com.jiawa.wiki.req.EbookQueryReq;
import com.jiawa.wiki.req.EbookSaveReq;
import com.jiawa.wiki.resp.CommonResp;
import com.jiawa.wiki.resp.EbookQueryResp;
import com.jiawa.wiki.resp.PageResp;
import com.jiawa.wiki.service.EbookService;
import com.jiawa.wiki.service.WsService;
import io.netty.util.internal.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/ebook")
public class EbookController {

    private final static Logger LOG = LoggerFactory.getLogger(LogAspect.class);

    @Resource
    private EbookService ebookService;

    @Resource
    private WsService wsService;
    @GetMapping("/list")
    public CommonResp list(@Valid EbookQueryReq req) {
        CommonResp<PageResp<EbookQueryResp>> resp = new CommonResp<>();
        PageResp<EbookQueryResp> list = ebookService.list(req);
        resp.setContent(list);
        return resp;
    }

    @PostMapping("/save")
    public CommonResp save(@Valid @RequestBody EbookSaveReq req) {
        CommonResp resp = new CommonResp<>();
        boolean success = ebookService.save(req);
        resp.setSuccess(success);
        resp.setMessage(success ? "保存成功" : "保存失败");
        if(success && ObjectUtils.isEmpty(req.getId()) ){
            wsService.sendAddEbook("【" + req.getName() + "】发布！");
        }
        return resp;
    }


    @DeleteMapping("/delete/{id}")
    public CommonResp delete(@PathVariable Long id) {
        CommonResp resp = new CommonResp<>();
        ebookService.delete(id);
        return resp;
    }
    //文件上传
    @RequestMapping("/upload/avatar")
    public CommonResp upload(@RequestParam MultipartFile avatar) throws IOException {
        LOG.info("文件上传开始",avatar);
        LOG.info("文件名{}",avatar.getOriginalFilename());
        LOG.info("文件大小{}",avatar.getSize());
        //保存文件在本地
        String originalFilename = avatar.getOriginalFilename();
        String savePath="D:/file/img/"+originalFilename;
        File dest=new File(savePath);
        avatar.transferTo(dest);
        LOG.info(dest.getAbsolutePath());
        return new CommonResp();
    }
    //文件下载
    @GetMapping("/download/avatar/{filename}")
    public ResponseEntity<InputStreamResource> downloadAvatar(@PathVariable String filename) throws IOException {
        Path path = Paths.get("D:/file/img/", filename);
        InputStreamResource resource = new InputStreamResource(Files.newInputStream(path));
        String mimeType = Files.probeContentType(path);
        if (mimeType == null) { // fallback to the default content type if type could not be determined
            mimeType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(mimeType))
                .body(resource);
    }

}
