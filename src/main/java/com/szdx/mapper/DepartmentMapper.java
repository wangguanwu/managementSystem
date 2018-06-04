package com.szdx.mapper;

import com.szdx.bean.Department;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface DepartmentMapper {
    String table_name = "tbl_dept";
    String insert_fields = "dept_name,dept_leader";
    String select_fields = "dept_id as 'deptId', "+
            "dept_name as 'deptName', "+
            "dept_leader as 'deptLeader'";
    /*
    * 删除*/
    @Delete({"delete from",table_name,"where dept_id =#{deptId}"})
    int deleteDeptById(@Param("deptId") Integer deptId) ;

    int updateDeptById(@Param("deptId")Integer deptId, @Param("department")Department department) ;
    @Insert({"insert into ", table_name,"(",insert_fields,") "+"values (#{department.deptName},#{" +
            "department.deptLeader})"})
    int insertDeptById(@Param("department") Department department );

    /*查询*/
    @Select({"select ",select_fields,"from",table_name,"where dept_id =#{deptId}"})
    Department selectOneById(@Param("deptId") Integer deptId);
    @Select({"select ",select_fields,"from",table_name,"where dept_id =#{deptLeader}"})
    Department selectOneByLeader(@Param("deptLeader") String deptLeader);
    @Select({"select ",select_fields,"from",table_name,"where dept_name =#{deptName}"})
    Department selectOneByName(@Param("deptName") String deptName);
    List<Department> selectDeptList();
    List<Department> selectDeptsByLimitAndOffset(@Param("offset") Integer offset ,@Param("limit") Integer limit);

    @Select({"select count(dept_id) from ", table_name, "where dept_leader =#{deptLeader}or dept_name=#{deptName}"})
    int checkDeptsExistsByNameAndLeader(@Param("deptLeader")String deptLeader,@Param("deptName") String deptName);

    @Select({"select count(*) from ",table_name})
    int countDepts();


}
