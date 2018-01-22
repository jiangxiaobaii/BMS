package com.bms.dao;

import com.bms.entity.Reader;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jiangxiaobai on 2018/1/6.
 */
@Repository("readerDao")
public class ReaderDao extends BaseDao {

    /**
     * 添加读者信息
     * @param reader
     * @return
     */
    public boolean addReader(Reader reader){
        try {
            getSession().save(reader);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 删除读者
     * @param reader
     * @return
     */
    public boolean deleteReader(Reader reader){
        try{
            getSession().delete(reader);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 查询所有读者
     * @param hql
     * @return
     */
    public List findReaderList(String hql){
        return getSession().createQuery(hql).list();
    }
}
