package com.bms.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by jiangxiaobai on 2018/1/6.
 */
@Entity
@Table(name = "borrowInfo")
public class BorrowInfo implements Serializable {

    private int bno;

    private Reader reader;

    private Book book;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
    private Date fstarttime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
    private Date fendtime;

    public BorrowInfo() {
        super();
    }

    public BorrowInfo(int bno, Reader reader, Book book, Date fstarttime, Date fendtime) {
        this.bno = bno;
        this.reader = reader;
        this.book = book;
        this.fstarttime = fstarttime;
        this.fendtime = fendtime;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    @ManyToOne
    @JoinColumn(name = "rno")
    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    @ManyToOne
    @JoinColumn(name = "bid")
    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Column(columnDefinition = "date")
    public Date getFstarttime() {
        return fstarttime;
    }

    public void setFstarttime(Date fstarttime) {
        this.fstarttime = fstarttime;
    }

    @Column(columnDefinition = "date")
    public Date getFendtime() {
        return fendtime;
    }

    public void setFendtime(Date fendtime) {
        this.fendtime = fendtime;
    }
}
