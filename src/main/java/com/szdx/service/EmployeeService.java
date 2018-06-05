package com.szdx.service;

import com.szdx.bean.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeService {
    public int getEmployeeCount();
    public int getEmpCount();
    public List<Employee> getEmpList();
    public Employee getEmpById(Integer empId);
    public Employee getEmpByName(String empName );
    public int updateEmpById(Integer empId, Employee employee);
    public int deleteEmpById(Integer empId);
    public int addEmp(Employee employee);
    public List<Employee> getEmpWithlimit(int offset ,int limit ) ;

}
