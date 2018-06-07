package com.szdx.controller;

import com.szdx.mapper.EmployeeMapper;
import com.szdx.service.EmployeeService;
import com.szdx.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/szd/emp")
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    /*员工删除操作
    *
    * */

    @RequestMapping(value="deleteEmp/{empId}",method=RequestMethod.DELETE)
    @ResponseBody
    public JsonMsg deletEmp(@PathVariable("empId")Integer empId){
        int res= 0 ;
        if(empId>0){
            res = employeeService.deleteEmpById(empId);
        }
        if(res!=1){
            return JsonMsg.fail().addInfo("emp_del_error","员工删除异常");
        }
        return JsonMsg.success();
    }
    /*
    * 更改员工信息
    *@param empId
    *@param employee
    *@return
    * */

}
