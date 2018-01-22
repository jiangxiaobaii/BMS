package com.bms.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by jiangxiaobai on 2018/1/3.
 */
@Entity
@Table(name = "user")
public class User implements Serializable {

    private int uno;
    private String uname;
    private String upwd;

    public User() {
    }

    public User(int uno, String uname, String upwd) {
        this.uno = uno;
        this.uname = uname;
        this.upwd = upwd;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }
}
