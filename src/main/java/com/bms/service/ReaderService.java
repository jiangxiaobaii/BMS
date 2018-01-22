package com.bms.service;

import com.bms.dao.ReaderDao;
import com.bms.entity.Reader;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by jiangxiaobai on 2018/1/6.
 */
@Service
@Repository("readerService")
public class ReaderService {

    @Resource(name = "readerDao")
    private ReaderDao readerDao;

    /**
     * 添加读者
     * @param reader
     * @return
     */
    public boolean addReader(Reader reader){
        return readerDao.addReader(reader);
    }

    public boolean deleteReader(Reader reader){return readerDao.deleteReader(reader);}

    /**
     * 查询读者
     * @return
     */
    public List findReaderList() {
        String hql = "from Reader r order by r.rage desc";
        return readerDao.findReaderList(hql);
    }

    public void setReaderDao(ReaderDao readerDao) {
        this.readerDao = readerDao;
    }
}
