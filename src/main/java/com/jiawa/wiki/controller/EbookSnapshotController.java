package com.jiawa.wiki.controller;

import com.jiawa.wiki.domain.Ebook;
import com.jiawa.wiki.req.EbookViewReq;
import com.jiawa.wiki.resp.CommonResp;
import com.jiawa.wiki.resp.StatisticResp;
import com.jiawa.wiki.service.EbookSnapshotService;
import com.jiawa.wiki.util.RedisUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/ebook-snapshot")
public class EbookSnapshotController {


    @Resource
    private EbookSnapshotService ebookSnapshotService;

    @Resource
    private RedisUtil redisUtil;

    @GetMapping("/get-statistic")
    public CommonResp getStatistic() {
        List<StatisticResp> statisticResp = ebookSnapshotService.getStatistic();
        CommonResp<List<StatisticResp>> commonResp = new CommonResp<>();
        commonResp.setContent(statisticResp);
        return commonResp;
    }

    @GetMapping("/get-30-statistic")
    public CommonResp get30Statistic() {
        List<StatisticResp> statisticResp = ebookSnapshotService.get30Statistic();
        CommonResp<List<StatisticResp>> commonResp = new CommonResp<>();
        commonResp.setContent(statisticResp);
        return commonResp;
    }
    @GetMapping("/selectBookView")
    public CommonResp selectBookView() {
        List<EbookViewReq> viewReqList = ebookSnapshotService.selectBookView();
        CommonResp<List<EbookViewReq>> commonResp = new CommonResp<>();
        commonResp.setContent(viewReqList);
        return commonResp;
    }

}
