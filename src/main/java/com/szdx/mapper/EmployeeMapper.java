package com.szdx.mapper;

import com.szdx.bean.Employee;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface EmployeeMapper {
    String table_name = "tbl_emp";
    String insert_fields = "emp_name , emp_email ,gender,department_id";
    String select_fields="emp_id ,"+insert_fields ;
    /*=========删除==================*/
    @Delete({"delete from ",table_name,"where emp_id = #{empId}"})

    int deleteOneById(@Param("empId") Integer empId );
    int updateOneById(@Param("empId") Integer empId, @Param("employee")Employee employee) ;
    @Insert({"insert into ",table_name ,"(",insert_fields,") values(#{empName}," +
            "#{empEmail}," +
            "#{gender}," +
            "#{deptId})"})
    int insertOne(Employee employee ) ;

    /*=============查询===============================*/
    Employee selectOneById(@Param("empId") Integer empId ) ;
    Employee selectOneByName(@Param("empName") String empName);
    /*=============查询带有部门信息的Employee====================*/
    Employee selectWithDeptById(@Param("empId")Integer empId) ;
    /*
    * 分页查询
    * @param limit返回记录最大行数
    * @param offset返回记录行的偏移量
    * 如果offset = 10 ,limit = 5会从数据库第十一行记录返回5条查询结果*/
    List<Employee> selectByLimitAndOffset(@Param("offset") Integer offset,@Param("limit") Integer limit ) ;
    List<Employee> selectEmployeeList();
    /*
    * 查询记录总数
    */
    @Select({"select count(*) from ",table_name})
    int countEmps();
}
