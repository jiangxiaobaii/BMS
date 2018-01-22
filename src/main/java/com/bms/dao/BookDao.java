package com.bms.dao;

import com.bms.entity.Book;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jiangxiaobai on 2018/1/4.
 */
@Repository("bookDao")
public class BookDao extends BaseDao{

    /**
     * 添加图书信息
     * @param book
     * @return
     */
    public boolean addBook(Book book){
        try {
            getSession().save(book);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 修改图书信息
     * @param book
     * @return
     */
    public boolean updateBook(Book book) {
        try {
            getSession().update(book);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 删除图书信息
     * @param book
     * @return
     */
    public boolean deleteBook(Book book){
        try {
            getSession().delete(book);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 查询所有图书
     * @param hql
     * @return
     */
    public List findBookList(String hql){
        return getSession().createQuery(hql).list();
    }



}
