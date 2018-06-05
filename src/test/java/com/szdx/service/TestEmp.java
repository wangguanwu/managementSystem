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
        System.out.println(employeeService.getEmpById(1));
    }
    @Test
    public void testFindByName()throws Exception{
        System.out.println(employeeService.getEmpByName("王东"));
    }
    @Test
    public void testFindBy(){
        Employee employee = new Employee();
        employee.setEmpEmail("2334@qq.com");
        employee.setEmpId(10);
        employee.setEmpName("令狐聪");
        employee.setGender("男");
        int r = employeeService.addEmp(employee) ;
        System.out.println(r);
    }
    @Test
    public void testDeleteById()throws Exception{
        System.out.println(employeeService.deleteEmpById(1));
    }
    @Test
    public void testSelectCounts()throws Exception{
        System.out.println(employeeService.getEmpCount());
    }
    @Test
    public void testSelectList()throws Exception{
      System.out.println( employeeService.getEmpList( )) ;
    }
    @Test
    public void testSelectListLimit()throws Exception{
        System.out.println(employeeService.getEmpWithlimit(0 , 5));
    }
    @Test
    public void testSelect()throws Exception{
        Employee employee = new Employee();
        employee.setEmpId(3);
        employee.setEmpName("小龙女");
        employee.setGender("女");
        employee.setdeptId(2);
        employee.setEmpEmail("345@qq.com");
        int r =employeeService.updateEmpById(employee.getEmpId(),employee);
        System.out.println( r );
    }


}
