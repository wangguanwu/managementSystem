package com.szdx.service.impl;

import com.szdx.bean.Administrator;
import com.szdx.mapper.AdminMapper;
import com.szdx.service.LoginService;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Administrator login(String name, String password) {
        return adminMapper.login(name ,password ) ;
    }
}
