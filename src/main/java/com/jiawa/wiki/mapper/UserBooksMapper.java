package com.jiawa.wiki.mapper;

import com.jiawa.wiki.domain.UserBooks;
import com.jiawa.wiki.domain.UserBooksExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserBooksMapper {
    long countByExample(UserBooksExample example);

    int deleteByExample(UserBooksExample example);

    int deleteByPrimaryKey(@Param("userId") Long userId, @Param("ebookId") Long ebookId);

    int insert(UserBooks record);

    int insertSelective(UserBooks record);

    List<UserBooks> selectByExample(UserBooksExample example);

    UserBooks selectByPrimaryKey(@Param("userId") Long userId, @Param("ebookId") Long ebookId);

    int updateByExampleSelective(@Param("record") UserBooks record, @Param("example") UserBooksExample example);

    int updateByExample(@Param("record") UserBooks record, @Param("example") UserBooksExample example);

    int updateByPrimaryKeySelective(UserBooks record);

    int updateByPrimaryKey(UserBooks record);
}