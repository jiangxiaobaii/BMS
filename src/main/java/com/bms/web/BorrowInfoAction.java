package com.bms.web;

import com.bms.entity.BorrowInfo;
import com.bms.service.BookService;
import com.bms.service.BorrowInfoService;
import com.bms.service.ReaderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jiangxiaobai on 2018/1/6.
 */

@Controller
@RequestMapping("borrowInfoAction")
public class BorrowInfoAction {

    @Resource(name = "borrowInfoService")
    private BorrowInfoService borrowInfoService;
    @Resource(name = "bookService")
    private BookService bookService;
    @Resource(name = "readerService")
    private ReaderService readerService;

    @RequestMapping("/toAddBorrowInfo")
    @ResponseBody
    public List toAddBorrowInfo(){
        List list = new ArrayList();
        list.add(bookService.findBookList());
        list.add(readerService.findReaderList());
        return list;
    }

    //添加
    @RequestMapping("/addBorrowInfo")
    @ResponseBody
    public String addBorrowInfo(BorrowInfo borrowInfo){
        if(borrowInfoService.addBorrowInfo(borrowInfo)){
            return "success";
        }
        return "fail";
    }

    @RequestMapping("/findBorrowInfoList")
    @ResponseBody
    public List findBorrowInfoList(){
        return borrowInfoService.findBorrowInfoList();
    }

    public void setBorrowInfoService(BorrowInfoService borrowInfoService) {
        this.borrowInfoService = borrowInfoService;
    }

    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    public void setReaderService(ReaderService readerService) {
        this.readerService = readerService;
    }
}
