package com.bms.web;

import com.bms.entity.Book;
import com.bms.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by jiangxiaobai on 2018/1/4.
 */
@Controller
@RequestMapping("/bookAction")
public class BookAction {
    @Resource(name = "bookService")
    private BookService bookService;

    //添加图书
    @RequestMapping("/addBook")
    public String addBook(Book book, RedirectAttributes attr){
        if(book != null){
            if(bookService.addBook(book)){
                attr.addAttribute("rtype","1");
            }else {
                attr.addAttribute("rtype","-1");
            }
        }else{
            attr.addAttribute("rtype","-2");

        }
        return "redirect:/pages/addBook.jsp";
    }

    //查询图书
    @RequestMapping("/findBookList")
    @ResponseBody
    public List findBookList(){
        return bookService.findBookList();
    }

    //删除图书
    @RequestMapping("/deleteBook/stk/{bno}/ktl")
    public String deleteStu(@PathVariable(name = "bno") int bno, Book book, RedirectAttributes attr) {
        if (bno != 0) {
            book.setBno(bno);
            if (bookService.deleteBook(book)) {
                attr.addFlashAttribute("deleteMsg", "1");
                return "redirect:/pages/bookList.jsp";
            }
        }
        attr.addFlashAttribute("deleteMsg", "-1");
        return "redirect:/pages/bookList.jsp";
    }

    //修改图书
    @RequestMapping("/updateBook")
    @ResponseBody
    public String updateBook(Book book){
        if(bookService.updateBook(book)){
            return "success";
        }
        return "fail";
    }

    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }
}
