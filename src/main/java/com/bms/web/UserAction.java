package com.bms.web;

import com.bms.entity.User;
import com.bms.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by jiangxiaobai on 2018/1/3.
 */
@Controller
@RequestMapping("/userAction")

public class UserAction {
    @Resource(name = "userService")
    private UserService userService;

    //用户登录
    @RequestMapping("/loginUser")
    public String loginUser(User user,RedirectAttributes attr,HttpSession session){
        if (user != null){
            user =  userService.doLogin(user);
            if (user != null){
                session.setAttribute("loginUser", user);
                return "redirect:/main.jsp";
            }else{
                attr.addAttribute("rtype","-1");
            }
        }else {
            attr.addAttribute("rtype","-1");
        }
        return "redirect:/index.jsp";
    }

    //注册
    @RequestMapping("/RegisterUser")
    public String  RegisterUser(User user, RedirectAttributes attr){
        if (userService.addUser(user)){
            return "redirect:/index.jsp";
        }else {
            attr.addAttribute("utype","-1");
        }
        return "redirect:/register.jsp";
    }


    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
