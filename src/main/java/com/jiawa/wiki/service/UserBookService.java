package com.jiawa.wiki.service;

import com.jiawa.wiki.domain.Ebook;
import com.jiawa.wiki.domain.User;
import com.jiawa.wiki.domain.UserBooks;
import com.jiawa.wiki.domain.UserBooksExample;
import com.jiawa.wiki.exception.BusinessException;
import com.jiawa.wiki.exception.BusinessExceptionCode;
import com.jiawa.wiki.mapper.EbookMapper;
import com.jiawa.wiki.mapper.UserBooksMapper;
import com.jiawa.wiki.mapper.UserMapper;
import com.jiawa.wiki.util.CopyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

@Service
public class UserBookService {

    @Resource
    private UserBooksMapper userBooksMapper;
    @Resource
    private UserMapper userMapper;
    @Resource
    private EbookMapper ebookMapper;

    public int collectBook(@Valid UserBooks resp) {
        User user = userMapper.selectByPrimaryKey(resp.getUserId());
        Ebook ebook = ebookMapper.selectByPrimaryKey(resp.getEbookId());
        resp.setUserId(user.getId());
        resp.setEbookId(ebook.getId());

        // 检查用户是否已经收藏过这本书
        UserBooksExample userBooksExample = new UserBooksExample();
        UserBooksExample.Criteria criteria = userBooksExample.createCriteria();
        criteria.andUserIdEqualTo(user.getId());
        criteria.andEbookIdEqualTo(ebook.getId());
        List<UserBooks> userBooksList = userBooksMapper.selectByExample(userBooksExample);

        if (userBooksList.size() > 0) {
            // 已经收藏过，执行取消收藏的操作
            userBooksMapper.deleteByExample(userBooksExample);
            return 0; // 返回0，表示当前书籍未被收藏
        } else {
            // 未收藏，执行收藏的操作
            Date now = new Date();
            //设置创建时间
            resp.setAddedAt(now);
            userBooksMapper.insert(resp);
            return 1; // 返回1，表示当前书籍已被收藏
        }
    }

    public List<Ebook>  fetchCollect(Long id) {
        if(id ==null){
            throw new BusinessException(BusinessExceptionCode.User_Ebook);
        }
        List<Ebook> ebooks =userBooksMapper.selectebooksByUserId(id);
        return ebooks;
    }
}
