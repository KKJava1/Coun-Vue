package com.jiawa.wiki.resp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jiawa.wiki.domain.Comment;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CommentResp {
    private Long id;

    private Long userId;

    private Long ebookId;

    private Long parentId;

    private String name;

    private Long replytouserId;

    private String replyname;

    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private List<CommentResp> replies = new ArrayList<>();

    public List<CommentResp> getReplies() {
        return replies;
    }
    public void setReplies(List<CommentResp> replies) {
        this.replies = replies;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getEbookId() {
        return ebookId;
    }

    public void setEbookId(Long ebookId) {
        this.ebookId = ebookId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getReplytouserId() {
        return replytouserId;
    }

    public void setReplytouserId(Long replytouserId) {
        this.replytouserId = replytouserId;
    }

    public String getReplyname() {
        return replyname;
    }

    public void setReplyname(String replyname) {
        this.replyname = replyname;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "CommentResp{" +
                "id=" + id +
                ", userId=" + userId +
                ", ebookId=" + ebookId +
                ", parentId=" + parentId +
                ", name='" + name + '\'' +
                ", replytouserId=" + replytouserId +
                ", replyname='" + replyname + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
