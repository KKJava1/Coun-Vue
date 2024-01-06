package com.jiawa.wiki.service;

import com.jiawa.wiki.websocket.WebSocketServer;
import org.slf4j.MDC;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class WsService {

    @Resource
    public WebSocketServer webSocketServer;

    @Async
    public void sendInfo(String message, String logId) {
        MDC.put("LOG_ID", logId);
        webSocketServer.sendInfo("vote_type",message);
    }

    public void sendAddEbook(String message) {
        webSocketServer.sendInfo("addEbook_type",message);
    }
}
