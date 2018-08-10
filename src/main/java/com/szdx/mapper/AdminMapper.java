package com.szdx.mapper;

import com.szdx.bean.Administrator;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface AdminMapper {
    public Administrator login(@Param(value="name") String name , @Param(value="password") String password) ;
}
