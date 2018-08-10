<%--
  Created by IntelliJ IDEA.
  User: MONSTER
  Date: 2018/6/7
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Update Page</title>
</head>
<body>
<div class="modal fade emp-update-modal" tabindex="-1" role="dialog" aria-labelledby="emp-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                    <h4 class="modal-title">员工更改</h4>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_emp_form">
                    <div class="form-group">
                        <label for="update_static_empName" class="col-sm-2 control-label">姓名</label>
                        <div  class="col-sm-8">
                            <p  class="form-control-static" id="update_static_empName"></p>
                        </div>
                        <input id="update_empName" type="hidden" name="empName"/>
                    </div>
                    <div class="form-group">
                        <label for="update_empEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <input type="email" name="empEmail" class="form-control" id="update_empEmail"/>
                            <span id="helpBlock_update_inputEmail" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="update_empGender1" value="男">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="update_empGender2" value="女">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_department" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="deptId" id="update_department"></select>
                            </div>
                        </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary emp_update_btn" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(".emp_edit_btn").click(function(){
        //获取点击修改员工的id和Name
        var updateEmpId = $(this).parent().parent().find("td:eq(0)").text();
        //根据员工ID或name查询员工信息进行回显
        $.ajax({
            url:"/szdx/emp/getEmpById/"+updateEmpId,
            type:"GET",
            success:function(result){
                if(result.code==100){
                    var emp = result.extendInfo.employee;
                    $("#update_empName").val(emp.empName);
                    $("#update_static_empName").text(emp.empName);
                    $("#update_empEmail").val(emp.empEmail);
                    $(".emp-update-modal input[name=gender]").val([emp.gender]);
                    $("#update_department").val(emp.departmentId);
                }
            }
        });
    //    部门回显列表
        $.ajax({
            url:"/szdx/dept/getDeptName",
            type:"GET",
            success:function(result){
                if(result.code==100){
                    $.each(result.extendInfo.departmentList,function(){
                        var optEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                        $("#update_department").empty();
                        optEle.appendTo("#update_department");
                    });
                }
            }
        });
        $(".emp_update_btn").attr("updateEmpId",updateEmpId);
    });
    $(".emp_update_btn").click(function(){
        $("#update_empName").val($("#update_static_empName").text());
        var updateEmpId = $(this).attr("updateEmpId");
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var updateEmpEmail = $("#update_empEmail").val();
        if(!regEmail.test(updateEmpEmail)){
            $("#update_empEmail").parent().parent().removeClass("has-success");
            $("#update_empEmail").parent().parent().addClass("has-error");
            $("#helpBlock_update_inputEmail").text("邮箱格式不正确");
        }else{
            $("#update_empEmail").parent().parent().removeClass("has-error");
            $("#update_empEmail").parent().parent().addClass("has-success");
            $("#helpBlock_update_inputEmail").text("");
        }
        /*点击更新按钮，发送AJAX到后台进行保存*/
        $.ajax({
            url:"/szdx/emp/updateEmp/"+updateEmpId,
            type:"PUT",
            data:$(".update_emp_form").serialize(),
            success:function(result){
                if(result.code == 100 ){
                    alert("员工更改成功！");
                    $(".emp-update-modal").modal("hide");
                    var curPage = ${curPage};
                    window.location.href="/szdx/emp/getEmpList?pageNo="+curPage;
                }else{
                }else
                    alert(result.extendInfo.emp_update_error);
                }
            }
        });
    });

</script>
</body>
</html>
