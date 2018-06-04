package com.szdx.service;

import com.szdx.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestEmp {
    ApplicationContext applicationContext = null ;
    EmployeeService employeeService ;

    @Before
    public void setUp()throws Exception{
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml") ;
        employeeService = applicationContext.getBean(EmployeeService.class) ;
    }
    @Test
    public void testFindById()throws Exception{
        employeeService.
    }
}
