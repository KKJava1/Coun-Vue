package com.jiawa.wiki.mapper;

import com.jiawa.wiki.req.EbookViewReq;
import com.jiawa.wiki.resp.StatisticResp;

import java.util.List;

public interface EbookSnapshotMapperCust {

    public void genSnapshot();

    List<StatisticResp> getStatistic();

    List<StatisticResp> get30Statistic();

    List<EbookViewReq> selectBookView();
}
