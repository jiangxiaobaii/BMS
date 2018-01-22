package com.bms.service;

import com.bms.dao.BorrowInfoDao;
import com.bms.entity.BorrowInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by jiangxiaobai on 2018/1/6.
 */

@Service("borrowInfoService")
public class BorrowInfoService {
    @Resource(name = "borrowInfoDao")
    private BorrowInfoDao borrowInfoDao;

    //添加
    public boolean addBorrowInfo(BorrowInfo borrowInfo){
        return borrowInfoDao.addBorrowInfo(borrowInfo);
    }

    //查询
    public List<?> findBorrowInfoList(){
        String hql = "from BorrowInfo b";
        return borrowInfoDao.findBorrowInfoList(hql);
    }

    public void setBorrowInfoDao(BorrowInfoDao borrowInfoDao) {
        this.borrowInfoDao = borrowInfoDao;
    }
}
