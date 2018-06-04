package com.szdx.service;

import com.szdx.bean.Department;
import com.szdx.bean.Employee;
import com.szdx.mapper.EmployeeMapper;
import com.szdx.service.DepartmentService;
import com.szdx.service.EmployeeService;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.XmlWebApplicationContext;

import java.util.Arrays;
import java.util.List;

public class TestDept {
    ApplicationContext applicationContext = null ;
    DepartmentService departmentService ;

    @Before
    public void setUp()throws Exception{
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml") ;
        departmentService = applicationContext.getBean(DepartmentService.class) ;
    }
    @Test
    public void testSelecyById()throws Exception{
            Department department = departmentService.getDeptById(1) ;
            System.out.println(department);
    }
    @Test
    public void testGetByName()throws Exception{
        Department department = departmentService.getDeptByName("保卫部");
        System.out.println(department);
    }
    @Test
    public void testAddDept()throws Exception{
        Department department = new Department();
        department.setDeptId(7);
        department.setDeptLeader("西门吹雪");
        department.setDeptName("保卫部");
        int i =  departmentService.addDept(department ) ;
        System.out.println(departmentService.getDeptByName("保卫部"));
    }
    @Test
    public void testFindAllDept() throws Exception{
       List<Department> list = departmentService.getDeptList( 0 ,5 ) ;
       System.out.println(list);

    }
    @Test
    public void testdeleteDeptById()throws Exception{
        int i =  departmentService.deleteDeptById(1) ;
        this.testFindAllDept();

    }
    @Test
    public void testUpdateById()throws Exception{
        Department department = new Department();
        department.setDeptName("人力资源部");
        department.setDeptId(8);
        department.setDeptLeader("李七夜");
        System.out.println(departmentService.getDeptById(department.getDeptId()));
        departmentService.updateDeptById(department.getDeptId(),department) ;
        System.out.println(departmentService);

    }
    @Test
    public void testGetCount(){
        System.out.println(departmentService.getDeptCount());
    }


}
