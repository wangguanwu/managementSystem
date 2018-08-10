package com.szdx.controller.interceptors;

import com.szdx.bean.Administrator;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//登录拦截器
public class LoginInterceptors implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        Administrator administrator =(Administrator)httpServletRequest.getSession().getAttribute("admin");
        String logined = (String) httpServletRequest.getSession().getAttribute("logined");
        if(logined == null )
            return true ;
        else{//如果从登录中退出

        }
        if(administrator==null){
            return false ;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
