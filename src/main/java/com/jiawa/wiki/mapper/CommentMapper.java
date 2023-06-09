package com.jiawa.wiki.mapper;

import com.jiawa.wiki.domain.Comment;
import com.jiawa.wiki.domain.CommentExample;
import java.util.List;

import com.jiawa.wiki.resp.CommentResp;
import org.apache.ibatis.annotations.Param;

public interface CommentMapper {
    long countByExample(CommentExample example);

    int deleteByExample(CommentExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExample(CommentExample example);

    Comment selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByExample(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

    List<CommentResp> selectListByEbookId(Long ebookId);

    int insertCommentResp(CommentResp req);

    CommentResp selectByCommentRespId(Long id);

    List<CommentResp> selectCommentResp(Long ebookId);
}