package com.bms.service;

import com.bms.dao.BookDao;
import com.bms.entity.Book;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by jiangxiaobai on 2018/1/4.
 */
@Service("bookService")
public class BookService {

    @Resource(name = "bookDao")
    private BookDao bookDao;

    /**
     * 添加图书
     * @param book
     * @return
     */
    public boolean addBook(Book book){
        return bookDao.addBook(book);
    }

    /**
     * 删除图书
     * @param book
     * @return
     */
    public boolean deleteBook(Book book){
        return bookDao.deleteBook(book);
    }

    /**
     * 修改图书
     * @param book
     * @return
     */
    public boolean updateBook(Book book){
        return bookDao.updateBook(book);
    }

    /**
     * 查询图书
     * @return
     */
    public List findBookList() {
        String hql = "from Book b order by b.bintime desc";
        return bookDao.findBookList(hql);
    }

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }
}

