<%--
  Created by IntelliJ IDEA.
  User: MONSTER
  Date: 2018/6/8
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Employee add page</title>
</head>
<body>
<div class="modal fade emp-add-modal" tabindex="-1" role="dialog" aria-labelleby="emp-add=modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span> </button>
                <h4 class="modal-title">员工新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_emp_form">
                    <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="empName" class="form-control" id="add_inputName" placeholder="如:张三">
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <input type="email" name="empEmail" class="form-control" id="add_inputEmail" placeholder="222@qq.com">
                            <span id="helpBlock_add_inputEmail" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" checked="checked" name="gender" id="add_InputGener1" value="男">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="add_inputGender2" value="女">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_department" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="deptId" id="add_department">
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary emp_save_btn">保存</button>
            </div>
        </div><%--modal-content--%>
    </div><%--modal-dialog--%>
</div><%--.modal--%>
<script type="text/javascript">
    /*点击员工新增按钮，发送ajax请求到查询部门列表信息，弹出模态框*/
    /*将查询到的部门列表信息显示在对应模态框中部门信息*/
    $(".emp_add_btn").click(function(){
        $.ajax({
            url:"/szdx/dept/getDeptName",
            type:"GET",
            success:function(result){
                if(result.code == 100 ){
                    $.each(result.extendInfo.departmentList,function(item){
                        var optionFile = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionFile.appendTo("#add_department");
                    });
                }
            }
        });
        $(".emp-add-modal").modal({
            backdrop:static,
            keyboard:true,
        })
    });
    /*鼠标从姓名输入框移开的时候，判断姓名输入框的姓名是否重复*/
    $("#add_inputName").change(function(){
        var empName = $("#add_inputName").val();
        $.ajax({
            url:"/szdx/emp/checkEmpExists",
            type:"GET",
            data:"empName="+empName,
            success:function( result ){
                if( result.code==100){
                    $("#add_inputName").parent().parent().removeClass("has-error");
                    $("#add_inputName").parent().parent().addClass("has-success");
                    $("#helpBlock_add_inputName").text("用户名可以使用");
                    $(".emp_save_btn").attr("btn_name_exists","success");
                }else{
                    $("#add_inputName").parent().parent().addClass("has-error");
                    $("#add_inputName").parent().parent().removeClass("has-success");
                    $("#helpBlock_add_inputName").text(result.extendInfo.name_reg_error);
                    $(".emp_save_btn").attr("btn_name_exists","error");
                }
            }
        });
    });
    /*保存*/
    $(".emp_save_btn").click(function(){
        if($(".emp_save_btn").attr("btn_name_exists") == "error"){
            return false ;
        }
        var inputName = $("#add_inputName").val();
        var inputEmail = $("#add_inputEmail").val();
        var regName = /(^a-zA-Z0-9_-]{3,16}$)|([\u2E80-\u9FFF]{2,5})/;
        var regEmail = /(^[a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regName.test(inputName)){
            alert("测试：输入姓名不正确");
            $("#add_inputName").parent().parent().addClass("has-error");
            $("#helpBlock_add_inputName").text("输入姓名为2-5为中文或6-16位英文和数字组合");
            return false;
        }else{/*移除格式*/
            $("#add_inputName").parent().parent().removeClass("has-error");
            $("#add_inputName").parent().parent().addClass("has-success");
            $("#helpBlock_add_inputName").hide();
        }
        if(!regEmail.test(inputEmail)){
            alert("测试：输入姓名不正确");
            $("#add_inputEmail").parent().parent().addClass("has-error");
            $("#helpBlock_add_inputEmail").text("输入邮箱格式不正确!");
            return false;
        }else{/*移除格式*/
            $("#add_inputEmail").parent().parent().removeClass("has-error");
            $("#add_inputEmail").parent().parent().addClass("has-success");
            $("#helpBlock_add_inputEmail").hide();
        }
        $.ajax({
            url:"/szdx/emp/addEmp",
            type:"POST",
            data:$(".add_emp_form").serialize(),
            success:function(result){
                if(result.code==100) {
                    alert("员工新增成功");
                    $("#emp-add-modal").modal("hide");
                    //跳往最后一页
                    $.ajax({
                        url: "/szdx/emp/getTotalPages",
                        type: "GET",
                        success: function (result) {
                            var totalPage = result.extendInfo.totalPage;
                            window.location.href = "/szdx/emp/getEmpList?pageNo=" + totalPage;
                        }
                    });
                }else{
                    alert("员工新增失败!");
                }
            }
        });
    });

</script>
</body>
</html>
