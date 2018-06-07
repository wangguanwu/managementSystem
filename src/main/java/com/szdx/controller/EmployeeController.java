package com.szdx.controller;

import com.szdx.bean.Employee;
import com.szdx.mapper.EmployeeMapper;
import com.szdx.service.EmployeeService;
import com.szdx.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/szd/emp")
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    /*员工删除操作
     *
     * */

    @RequestMapping(value = "deleteEmp/{empId}", method = RequestMethod.DELETE)
    @ResponseBody
    public JsonMsg deletEmp(@PathVariable("empId") Integer empId) {
        int res = 0;
        if (empId > 0) {
            res = employeeService.deleteEmpById(empId);
        }
        if (res != 1) {
            return JsonMsg.fail().addInfo("emp_del_error", "员工删除异常");
        }
        return JsonMsg.success();
    }

    /**
     * 更改员工信息
     *
     * @param
     * @Author MONSTER
     * @Date 2018/6/7 11:03
     * @Return
     **/
    @RequestMapping(value = "updateEmp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public JsonMsg updateEmp(@PathVariable("empId") Integer empId, Employee employee) {
        int result = this.employeeService.updateEmpById(empId, employee);
        if (result == 1) {
            return JsonMsg.success();
        } else {
            return JsonMsg.fail().addInfo("emp_update_error", "更改异常");
        }
    }

    /**
     * @param [empName]
     * @Author MONSTER
     * @Date 2018/6/7 11:18
     * @Return com.szdx.util.JsonMsg
     **/
    @RequestMapping(value = "/checkEmpExists", method = RequestMethod.GET)
    @RequestBody

    public JsonMsg checkEmpExists(@RequestParam("empName") String empName) {
        /*对输入的姓名和邮箱格式进行验证*/
        String regName = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF{2,5}";
        if (!empName.matches(regName)) {
            return JsonMsg.fail().addInfo("name_reg_error", "输入数字为2-5位中文或6-16位英文和数字组合");
        }
        Employee employee = employeeService.getEmpByName(empName);
        if (employee != null) {
            return JsonMsg.fail().addInfo("name_reg_error", "用户名重复");
        } else {
            return JsonMsg.success();
        }

    }

    /**
     * @param
     * @Author MONSTER
     * @Date 2018/6/7 13:53
     * @Return
     **/
    @RequestMapping(value = "/getTotalPages", method = RequestMethod.DELETE)
    @ResponseBody
    public JsonMsg goTotalPages() {
        int totalItems = employeeService.getEmpCount();
        int temp = totalItems / 5;
        int totalPage = (totalItems % 5 == 0) ? temp : temp + 1;
        return JsonMsg.success().addInfo("totalPages", totalPage);
    }

    /**
     * @param employee
     * @Author MONSTER
     * @Date 2018/6/7 13:56
     * @Return JsonMsg
     **/
    @RequestMapping(value = "/addEmp", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg addEmp(Employee employee) {
        int res = employeeService.addEmp(employee);
        if (res == 1) {
            return JsonMsg.success();
        } else {
            return JsonMsg.fail().addInfo();
        }
    }
    /**
    *通过empId获取employee的信息
    *@Author MONSTER
    *@Date 2018/6/7 14:09
    *@param empId
    *@Return
    **/
    @RequestMapping(value="getEmpById/{empId}",method=RequestMethod.GET)
    @ResponseBody
    public JsonMsg getEmpById(@PathVariable("empId") Integer empId){
        Employee employee = employeeService.getEmpById(empId);
        if(employee!=null){
            return JsonMsg.success().addInfo("employee",employee) ;
        }else{
            return JsonMsg.fail();
        }
    }
    @RequestMapping(value="/getEmpList",method=RequestMethod.GET)
    public String getEmp(Model model, @RequestParam(value="pageNo",defaultValue = "1")Integer pageNo){
        int limit = 5 ;
        /*记录的偏移量
        * 如第一页从第一行开始查询 offset = (1-1)*5 = 0 ，offset=offset+1 = 1
        * 第二页从第六行开始查询 offset = (2-1)*5 = 5  offset= offset+1，*/
        int offset = (pageNo-1)*limit ;
        //获取指定的页数包含员工的信息
        List<Employee> employeeList = employeeService.getEmpWithlimit(offset,limit) ;
        //获取总的记录数
        int totalItems = employeeService.getEmpCount();
        int temp = totalItems/limit ;
        /*总的页数*/
        int totalPages = (totalItems%limit == 0) ? temp : temp+1 ;
        model.addAttribute("employees",employeeList)
                .addAttribute("totalItems",totalItems)
                .addAttribute("totalPages",totalPages)
                .addAttribute("curPage",pageNo);
        return "employeePage";
    }





}
