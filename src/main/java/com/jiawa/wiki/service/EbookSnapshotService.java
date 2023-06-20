package com.jiawa.wiki.service;

import com.jiawa.wiki.controller.EbookSnapshotController;
import com.jiawa.wiki.mapper.EbookSnapshotMapperCust;
import com.jiawa.wiki.resp.StatisticResp;
import com.jiawa.wiki.util.RedisUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class EbookSnapshotService {

    private static final Logger LOG = LoggerFactory.getLogger(EbookSnapshotService.class);
    @Resource
    private EbookSnapshotMapperCust ebookSnapshotMapperCust;
    @Resource
    private RedisTemplate redisTemplate;
    @Resource
    private RedisUtil redisUtil;
    public void genSnapshot() {
        ebookSnapshotMapperCust.genSnapshot();
    }

    /**
     * 获取首页数值数据：总阅读数、总点赞数、今日阅读数、今日点赞数、今日预计阅读数、今日预计阅读增长
     */
    public List<StatisticResp> getStatistic() {

        List<StatisticResp> statisticFromRedis = redisUtil.getStatisticFromRedis("statistic");
        LOG.info("访问Redis");
        if(statisticFromRedis == null){
            List<StatisticResp> statistic = ebookSnapshotMapperCust.getStatistic();
            redisUtil.setStatisticToRedis("statistic",statistic,120);
            statisticFromRedis = statistic;
        }
        return statisticFromRedis;
    }



    /**
     * 30天数值统计
     */
    public List<StatisticResp> get30Statistic() {
        return ebookSnapshotMapperCust.get30Statistic();
    }

}
