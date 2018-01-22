package com.bms.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by jiangxiaobai on 2018/1/6.
 */
@Entity
@Table(name = "reader")
public class Reader implements Serializable{

    private int rno;//读者编号
    private String rname;//读者姓名
    private String rsex;//读者性别
    private int rage;//读者年龄
    private String rmajor;//读者专业
    private String rtel;//联系电话

    public Reader() {
        super();
    }

    public Reader(int rno, String rname, String rsex, int rage, String rmajor, String rtel) {
        this.rno = rno;
        this.rname = rname;
        this.rsex = rsex;
        this.rage = rage;
        this.rmajor = rmajor;
        this.rtel = rtel;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getRsex() {
        return rsex;
    }

    public void setRsex(String rsex) {
        this.rsex = rsex;
    }

    public int getRage() {
        return rage;
    }

    public void setRage(int rage) {
        this.rage = rage;
    }

    public String getRmajor() {
        return rmajor;
    }

    public void setRmajor(String rmajor) {
        this.rmajor = rmajor;
    }

    public String getRtel() {
        return rtel;
    }

    public void setRtel(String rtel) {
        this.rtel = rtel;
    }
}
