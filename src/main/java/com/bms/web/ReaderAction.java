package com.bms.web;

import com.bms.entity.Reader;
import com.bms.service.ReaderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.jws.WebResult;
import java.util.List;

/**
 * Created by jiangxiaobai on 2018/1/6.
 */
@Controller
@RequestMapping("/readerAction")
public class ReaderAction {
    @Resource(name = "readerService")
    private ReaderService readerService;

    //添加读者
    @RequestMapping("/addReader")
    public String addReader(Reader reader, RedirectAttributes attr){
        if(reader != null){
            if(readerService.addReader(reader)){
                attr.addAttribute("rtype","1");
            }else {
                attr.addAttribute("rtype","-1");
            }
        }else{
            attr.addAttribute("rtype","-2");

        }
        return "redirect:/pages/addReader.jsp";
    }

    //删除读者
    @RequestMapping("/deleteReader/{rno}")
    public String deleteReader(@PathVariable int rno,Reader reader, RedirectAttributes attr){
        System.out.println(rno);
        if (rno != 0){
            reader.setRno(rno);
            if (readerService.deleteReader(reader)){
                attr.addFlashAttribute("deleteMsg","1");
                return "redirect:/pages/readerList.jsp";
            }
        }
        attr.addFlashAttribute("deleteMsg","-1");
        return "redirect:/pages/readerList.jsp";
    }

    //查询读者
    @RequestMapping("/findBookList")
    @ResponseBody
    public List findReaderList(){
        return readerService.findReaderList();
    }


    public void setReaderService(ReaderService readerService) {
        this.readerService = readerService;
    }
}
