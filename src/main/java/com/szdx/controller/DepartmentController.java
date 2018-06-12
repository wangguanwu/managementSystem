package com.szdx.controller;

import com.szdx.bean.Department;
import com.szdx.service.DepartmentService;
import com.szdx.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/szdx/dept")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    /**
    *部门删除
    *@Author MONSTER
    *@Date 2018/6/7 14:29
    *@param
    *@Return json
    **/
    @RequestMapping(value="/delDept/{deptId}", method = RequestMethod.DELETE)
    @ResponseBody
    public JsonMsg deleteDept(@PathVariable("deptId") Integer deptId){
        int res = 0 ;
        if(deptId > 0 ){
            res = departmentService.deleteDeptById(deptId);
        }
        if(res!=1){
            JsonMsg.fail().addInfo("del_dept_error","删除异常");
        }
        return JsonMsg.success();
    }
    /**
    *部门更改
    *@Author MONSTER
    *@Date 2018/6/7 14:32
    *@param deptId ,department
    *@Return json
    **/
    @RequestMapping(value="/updateDeptById/{deptId}",method=RequestMethod.PUT)
    @ResponseBody
    public JsonMsg updateDeptById(@PathVariable(value="deptId") Integer deptId , Department department){
        int res = 0 ;
        if(deptId > 0 ){
            res = departmentService.updateDeptById(deptId,department) ;
        }
        if(res!=1){
            JsonMsg.fail().addInfo("del_dept_error","部门更改失败");
        }
        return JsonMsg.success();
    }
    /**
    *部门添加
    *@Author MONSTER
    *@Date 2018/6/7 14:36
    *@param department
    *@Return json
    **/
    @RequestMapping(value="/addDept",method = RequestMethod.PUT)
    @ResponseBody
    public JsonMsg addDept(Department department){
        int res = departmentService.addDept(department) ;
        if(res!=1){
            JsonMsg.fail().addInfo("del_dept_error","添加异常");
        }
        return JsonMsg.success();
    }
    /**
     *部门信息总页码数
     *@Author MONSTER
     *@Date 2018/6/7 14:39
     *@param
     *@Return com.szdx.util.JsonMsg
     **/
    @RequestMapping(value="/getTotalPages",method=RequestMethod.GET)
    @ResponseBody
    public JsonMsg getTotalPages(){
        int limit = 5 ;
        int totalItems = departmentService.getDeptCount();
        int temp = totalItems/limit ;
        int totalPages = (totalItems%limit == 0) ? temp : temp+1 ;
        return JsonMsg.success().addInfo("totalPages",totalPages);


    }


    /**
    *通过部门ID返回指定部门
    *@Author MONSTER
    *@Date 2018/6/7 14:44
    *@param
    *@Return
    **/
    @RequestMapping(value="/getDeptById/{deptId}")
    @ResponseBody
    public JsonMsg getDeptById(@PathVariable("deptId") Integer deptId){
        Department department = null ;
        if(deptId > 0 )
            department = departmentService.getDeptById(deptId);
        if(department==null)
            return JsonMsg.fail().addInfo("get_dept_error","无部门信息");
        return JsonMsg.success().addInfo("department",department);
    }

    /**
    *分页查询：返回指定页数对应的数据
    *@Author MONSTER
    *@Date 2018/6/7 14:46
    *@param
    *@Return java.lang.String
    **/
    @RequestMapping(value="/getDeptList",method=RequestMethod.GET)
    public String  getDeptList(Model model , @RequestParam(value="pageNo",defaultValue = "1")Integer pageNo){
        int limit = 5 ;
        int totalItems = departmentService.getDeptCount();
        int temp = totalItems/limit ;
        int totalPages = (totalItems%limit == 0 ) ? temp : temp+1 ;
        int offset =  (pageNo-1)*limit ;
        List<Department> list = departmentService.getDeptList(offset,limit) ;
        model.addAttribute("departments",list)
                .addAttribute("totalItems",totalItems)
                .addAttribute("totalPages",totalPages)
                .addAttribute("curPageNo",pageNo) ;
        return "departmentPage";
    }
    /**
    *查询所有部门信息
    *@Author MONSTER
    *@Date 2018/6/7 15:01
    *@param
    *@Return
    **/
    @RequestMapping(value="getDeptName",method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getDeptName(){
        List<Department> departments = departmentService.getDeptByName();
        if(departments!=null)
            return JsonMsg.success().addInfo("departmentList",departments);
        return JsonMsg.fail();
    }
}
