package com.bms.dao;

import com.bms.entity.BorrowInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jiangxiaobai on 2018/1/6.
 */

@Repository("borrowInfoDao")
public class BorrowInfoDao extends BaseDao {
    //添加
    public boolean addBorrowInfo(BorrowInfo borrowInfo){
        try{
            getSession().save(borrowInfo);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //查询
    public List findBorrowInfoList(String hql){
        try {
            return getSession().createQuery(hql).list();
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }


}
