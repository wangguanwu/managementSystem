<%--
  Created by IntelliJ IDEA.
  User: MONSTER
  Date: 2018/6/10
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>department Update Page</title>
</head>
<body>
<div class="modal fade dept-update-modal" tabindex="-1" role="dialog" aria-labelledby="dept-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
                <h4 class="modal-title">部门更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_dept_form">
                    <div class="form-group">
                        <label for="update_deptName" class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="deptName" class="form-control" id="update_deptName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_deptLeader" class="col-sm-2 control-label">部门老大</label>
                        <div class="col-sm-8">
                            <input type="text" name="deptLeader" class="form-control" id="update_deptLeader"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="footer">
                <button type="button" class="btn btn-default" date-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary update_dept_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var edit_deptId = 0 ;
    var curPageNo = ${curPageNo};
    $(".dept_edit_btn").click(function(){
        edit_deptId = $(this).parent().parent().find("td:eq(0)").text();
        alert("id"+edit_deptId);
        //查询对应ID的部门信息
        $.ajax({
            url:"/szdx/dept/getDeptById/"+edit_deptId,
            type:"GET",
            success:function(result){
                if(result.code==100){
                    var deptData = result.extendInfo.department;
                    //回显
                    $("#update_deptName").val(deptData.deptName);
                    $("#update_deptLeader").val(deptData.deptName);
                }else{
                    alert(result.extendInfo.get_dept_error);
                }
            }
        });
    });
    $(".update_dept_btn").click(function(){
        $.ajax({
            url:"/szdx/dept/updateDept/"+edit_deptId,
            type:"PUT",
            data:$(".update_dept_form").serialize(),
            success:function(result){
                if(result.code == 100 ){
                    alert("更新成功");
                    window.location.href="/szdx/dept/getDeptList?pageNo="+curPage;
                }else{
                    alert(result.extendInfo.update_dept_error);
                }
            }
        });
    });
</script>
</body>
</html>
