<%--
  Created by IntelliJ IDEA.
  User: MONSTER
  Date: 2018/6/10
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>部门管理页面</title>
</head>
<body>
<div class="szdx_dept_container">
    <%--导航栏--%>
    <%@ include file="./common/head.jsp"%>
    <%--中间部分--%>
    <div class="szdx_dept_body">
        <%--左侧栏--%>
            <%@ include file="./common/leftsidebar.jsp"%>
            <%--部门表格内容--%>
        <div class="dept_info col-sm-10">
            <div class="panel panel-success">
                <%--路径导航--%>
                <div class="panel-heaing">
                    <ol class="breadcrumb">
                        <li><a href="#">部门管理</a></li>
                        <li class="active">部门信息</li>
                    </ol>
                </div>
                <%--table--%>
                <table class="table table-bordered table-hover" id="dept_table">
                    <thead>
                        <th>部门编号</th>
                        <th>部门名称</th>
                        <th>部门老大</th>
                        <th>操作</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${departments}" var ="dept">
                            <tr>
                                <td>${dept.deptId}</td>
                                <td>${dept.deptName}</td>
                                <td>${dept.deptLeader}</td>
                                <td>
                                    <a href="#" role="button" class="btn btn-primary dept_edit_btn" data-toggle="modal" data-target=".dept-update-modal">编辑</a>
                                    <a href="#" role="button" class="btn btn-danger dept_delete_btn">删除</a>
                                </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${curPageNo}</span>页,共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。

                    </div>
                    <nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination">
                            <li><a href="/szdx/dept/getDeptList?pageNo=1">首页</a></li>
                            <c:if test="${curPageNo==1}">
                                <li class="disabled">
                                    <a href="#" aria-label="Previous" class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${curPageNo!=1}">
                                <li>
                                    <a href="#"aria-label="Previous"class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${totalPages < 5 ?totalPages:5}" step="1" val="itemPage">
                                <c:if test="${curPageNo == itemPage}">
                                    <li class="active"><a href="/szdx/dept/getDeptList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPageNo != itemPage}">
                                    <li><a href="/szdx/dept/getDeptList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>

                            </c:forEach>
                            <c:if test="${curPage==totalPages}">
                                <li class="disabled" class="nextPage">
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${curPage != totalPages}">
                                <li>
                                    <a href="#" aria-label="Next" class="nextPage">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <li><a href="/szdx/dept/getDeptList?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><%--panel-success--%>
        </div><%--dept_info--%>
    </div><%--.dept_body--%>
        <%@ include file="departmentAdd.jsp"%>
        <%@ include file="departmentUpdate.jsp"%>

        <!-- 尾部-->
        <%@ include file="./common/foot.jsp"%>

</div><%--container--%>
<script type="text/javascript">
    var curPage=${curPageNo};
    var totalPages = ${totalPages};
    //上一页
    $(".prePage").click(function(){
        if(curPage > 1 ){
            var pageNo = curPage - 1 ;
            $(this).attr("href","/szdx/dept/getDeptList?pageNo="+pageNo);
        }
    });
    //下一页
    $(".nextPage").click(function(){
        if(curPage<totalPages){
            var pageNo = curPage +1;
            $(this).attr("href","/szdx/dept/getDeptList?pageNo="+pageNo);
        }
    });
    /*部门删除操作*/
    $(".dept_delete_btn").click(function(){
       var deptId =$(this).parent().parent().find("td:eq(0)").text();
       var deptName =$(this).parent().parent().find("td:eq(1)").text();
       var curPage = ${curPageNo};
       if(confirm("确认删除["+deptName+"]的信息吗?")){
           $.ajax({
               url:"/szdx/dept/delDept/"+deptId,
               type:"DELETE",
               success:function(result){
                   if(result.code== 100){
                       alert("删除成功");
                       window.location.href="/szdx/dept/getDeptList?pageNo="+curPage;
                   }else{
                       alert(result.extendInfo.del_dept_error);
                   }
               }
           });
       }
    });
</script>
</body>
</html>