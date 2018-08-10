package com.szdx.controller;

import com.szdx.bean.Administrator;
import com.szdx.service.LoginService;
import com.szdx.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.Request;
import sun.net.httpserver.HttpServerImpl;

import javax.jws.WebParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/szdx")
public class LoginController {
    /*跳转到的登录页面
     */
    @Autowired
    private LoginService loginService;
    @RequestMapping(value="/login",method={RequestMethod.GET})
    public String login(){
        return "login";
    }
    /*对输入的用户名做出简单的判断*/
    @RequestMapping(value = "/dologin",method={RequestMethod.POST})
    @ResponseBody
    public JsonMsg dologin(HttpServletRequest request , Administrator administrator){

        if (administrator != null) {
            Administrator admin = loginService.login(administrator.getName(), administrator.getPassword());
            if (admin != null) {//管理员合法
                /*保存用户登录信息*/
                request.getSession().setAttribute("logined","logined");
                request.getSession().setAttribute("admin", admin);
                return JsonMsg.success();
            }else{
                return JsonMsg.fail().addInfo("login_error", "管理员身份不存在");

            }
        } else {
            return JsonMsg.fail().addInfo("login_error", "输入账号用户名和密码不匹配，请重新输入");
        }
    }
    /*跳转到主页面*/

    @RequestMapping(value="/main", method=RequestMethod.GET)
    /**
    *@
    *
    *
    **/
    /**
    *@Author MONSTER
    *@Date 2018/6/7 10:56
    *
    **/
    public String mainpage(){
        return "main";
    }
    /**
    *@Author MONSTER
    *@Date 2018/6/7 10:59
    *@param request
    *@Return string
    **/
    @RequestMapping(value = "/logout",method=RequestMethod.GET)
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();/*会话信息过期*/
        request.getSession().setAttribute("logined","logined");//表示已经登陆过了
        return "login";
    }
    
}
