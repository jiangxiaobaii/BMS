package com.bms.dao;

import org.springframework.stereotype.Repository;
import com.bms.entity.User;

import java.util.List;
/**
 * Created by jiangxiaobai on 2018/1/3.
 */
@Repository("userDao")
public class UserDao extends BaseDao {
    //查询所有用户
    public List findUserList(String hql){
        return getSession().createQuery(hql).list();
    }

    //添加用户
    public boolean addUser(User user){
        try {
            getSession().save(user);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
