package com.szdx.service.impl;

import com.szdx.bean.Employee;
import com.szdx.mapper.EmployeeMapper;
import com.szdx.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService  {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Override
    public List<Employee> getEmpWithlimit(int offset, int limit) {
        return employeeMapper.selectByLimitAndOffset(offset , limit ) ;
    }

    @Override
    public int getEmployeeCount() {
        return employeeMapper.countEmps();
    }

    @Override
    public int getEmpCount() {
        return employeeMapper.countEmps();
    }

    @Override
    public List<Employee> getEmpList() {
        return employeeMapper.selectEmployeeList();
    }

    @Override
    public Employee getEmpById(Integer empId) {
        return  employeeMapper.selectOneById(empId) ;
    }

    @Override
    public Employee getEmpByName(String  empName) {
        return employeeMapper.selectOneByName(empName) ;
    }

    @Override
    public int updateEmpById(Integer empId, Employee employee) {
        return employeeMapper.updateOneById(empId , employee ) ;
    }

    @Override
    public int deleteEmpById(Integer empId) {
        return employeeMapper.deleteOneById(empId) ;
    }

    @Override
    public int addEmp(Employee employee) {
        return employeeMapper.insertOne(employee) ;
    }
}
