<%--
  Created by IntelliJ IDEA.
  User: MONSTER
  Date: 2018/6/5
  Time: 22:23
  To change this templfate use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>XXX公司人力资源管理部</title>
</head>
<body>
<div class="container">
    <%@include file="./common/head.jsp"%> 
    <div class="szdx_body" style="position:relative;top:-15px;">
      <%--左侧栏--%>
        <%@include file="./common/leftsidebar.jsp"%>
        <%--中间轮播内容--%>
        <div class="szdx_main_ad col-sm-10">
            <div class="panel panel_success">
                <div class="panel-heading">
                    <h3 style="text-align:center;">欢迎进入XXX公司人力资源管理系统!</h3>
                </div>
                <div class="panel-body" style="position:relative;top:-15px;">
                    <div id="szdx-carousel_1" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#szdx-carousel_1" data-silde-to="0" class="active"></li>
                            <li data-target="#szdx-carousel_1" data-silde-to="1"></li>
                            <li data-target="#szdx-carousel_1" data-silde-to="2"></li>
                        </ol>
                        <!--轮播项目-->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active" style="text-align:center;">
                                <img class="img-responsive center-block" src="/static/img/company1.jpg" alt="company1">
                                <div class="carousel-caption">
                                    <h3>漂亮大气的办公楼</h3>
                                </div>
                            </div>
                            <div class="item">
                                <img class="img-responsive center-block" src="/static/img/company2.jpg" alt="company2">
                                <div class="carousel-caption">
                                    <h3>优闲的放松场所</h3>
                                </div>
                            </div>
                            <div class="item">
                                <img class="img-responsive center-block" src="/static/img/company3.jpg" alt="company3">
                                <div class="carousel-caption">
                                    <h3>舒适的办公楼</h3>
                                </div>
                            </div>
                        </div>
                        <!--轮播导航-->
                        <a class="left carousel-control" href="#szdx-carousel_1" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#szdx-carousel_1" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="./common/foot.jsp"%>
    </div>
</div>
</body>
</html>
