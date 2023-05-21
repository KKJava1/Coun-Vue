package com.jiawa.wiki.service;

import com.jiawa.wiki.domain.ReadProgress;
import com.jiawa.wiki.exception.BusinessException;
import com.jiawa.wiki.exception.BusinessExceptionCode;
import com.jiawa.wiki.mapper.ReadProgressMapper;
import com.jiawa.wiki.resp.CommentResp;
import com.jiawa.wiki.resp.CommonResp;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ReadProgressService {
    @Resource
    private ReadProgressMapper readProgressMapper;


    public CommonResp<ReadProgress> saveDocrecord(ReadProgress req) {
        CommonResp<ReadProgress> resp = new CommonResp<>();
        if(req.getUserId() == null){
            throw  new BusinessException(BusinessExceptionCode.User_Ebook);
        }
        ReadProgress readProgress = readProgressMapper.selectDocrecord(req.getUserId(), req.getEbookId());
        if(readProgress == null){
            readProgressMapper.insert(req);
            resp.setContent(req); // 设置返回内容
        }
        else{
            req.setId(readProgress.getId()); // 设定req的id
            readProgress.setDocId(req.getDocId());
            readProgressMapper.updateByPrimaryKey(req);
            resp.setContent(readProgress); // 设置返回内容
        }
        return resp;
    }


    public CommonResp<ReadProgress> obrecord(Long userId, Long ebookId) {
        CommonResp<ReadProgress> resp = new CommonResp<>();
        if(userId == null){
            throw  new BusinessException(BusinessExceptionCode.User_Ebook);
        }
        ReadProgress readProgress = readProgressMapper.selectDocrecord(userId,ebookId);
        resp.setContent(readProgress);
        return resp;
    }
}
