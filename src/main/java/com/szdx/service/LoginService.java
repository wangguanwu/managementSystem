package com.szdx.service;

import com.szdx.bean.Administrator;
import org.springframework.stereotype.Service;

@Service
public interface LoginService {
    public Administrator login(String name ,String password);

}
