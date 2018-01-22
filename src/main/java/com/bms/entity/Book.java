package com.bms.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by jiangxiaobai on 2018/1/4.
 */
@Entity
@Table(name = "book")
public class Book {

    private int bno;
    private String bname;//图书名称
    private String btype;//图书分类
    private String bauthor;//作者
    private double bprice;//价格
    private int bnumber;//数量

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bintime;//上架时间

    public Book() {
        super();
    }

    public Book(int bno, String bname, String btype, String bauthor, double bprice, int bnumber, Date bintime) {
        this.bno = bno;
        this.bname = bname;
        this.btype = btype;
        this.bauthor = bauthor;
        this.bprice = bprice;
        this.bnumber = bnumber;
        this.bintime = bintime;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBtype() {
        return btype;
    }

    public void setBtype(String btype) {
        this.btype = btype;
    }

    public String getBauthor() {
        return bauthor;
    }

    public void setBauthor(String bauthor) {
        this.bauthor = bauthor;
    }

    public double getBprice() {
        return bprice;
    }

    public void setBprice(double bprice) {
        this.bprice = bprice;
    }

    public int getBnumber() {
        return bnumber;
    }

    public void setBnumber(int bnumber) {
        this.bnumber = bnumber;
    }

    @Column(columnDefinition = "date")
    public Date getBintime() {
        return bintime;
    }

    public void setBintime(Date bintime) {
        this.bintime = bintime;
    }
}
