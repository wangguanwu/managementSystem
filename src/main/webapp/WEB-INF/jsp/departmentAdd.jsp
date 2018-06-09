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
    <title>部门新增页面</title>
</head>
<body>
<div class="modal fade dept-add-modal" tabindex="-1" role="dialog" aria-labelledby="dept-add-modal">
    <div class="modal-dialog" role="document"></div>
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span> </button>
            <h4 class="modal-title">部门新增</h4>
        </div>
        <div class="modal-body">
            <form class="form-horizontal add_dept_from">
                <div class="form-group">
                    <label for="add_deptName" class="col-sm-2 control-label">部门名称</label>
                    <div class="col-sm-8">
                        <input type="text" name="deptName" class="form-controll" id="add_deptName" placeholder="人事部"/>
                    </div>
                </div>
                <div class="formp-group">
                    <label for="add_deptLeader" class="col-sm-2 control-label">部门老大</label>
                    <div class="col-sm-8">
                        <input type="text" name="deptLeader" class="form-controller" id="add_deptLeader"/>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary dept_save_btn">保存</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(".dept_add_btn").click(function(){
        $(".dept-add-modal").modal({
            backdrop:static,
            keyboard:true
        });
    });
    $(".dept_save_btn").click(function(){
        var deptName = ${"#add_deptName"}.val();
        var deptLeader=${"#add_deptLeader"}.val();
        $.ajax({
            url:"/szdx/dept/addDept",
            type:"PUT",
            data:$(".add_dept_form").serialize();
            success:function(result){
                if(result.code==100){
                    alert("新增成功");
                    $(".dept-add-modal").modal("hide");
                    $.ajax({
                        url:"/szdx/dept/getTotalPages",
                        type:"GET",
                        success:function(result){
                            if(result.code==100){
                                var totalPages=result.extendInfo.totalPages;
                                window.location.href="/szdx/dept/getDeptList?pageNo="+totalPages;
                            }
                        }
                    });
                }
            }
        });
    })
</script>
</body>
</html>
