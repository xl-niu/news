<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fns" uri="/WEB-INF/jsp/fns.tld"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=0.5,maximum-scale=1,minimum-scale=1,user-scalable=no"
          charset="utf-8">
    <title>智奇铁路设备有限公司</title>
    <link rel="stylesheet" href="plugins/bootstrap-3.3.7-dist/css/bootstrap.css">
    <style type="text/css">
        .theme {background-color: #003380;color: #FFFFFF;}
        .navbar-collapse a {color: #FFFFFF;font-weight: bold;}
        .navbar-collapse a:focus {color: #003380;}

        .form-group span {margin-right: 15px;}
        .form-group .notification {background-color: #f68484;border-radius: 4px;color: #FFFFFF;font-size: 0.6em;padding-left: 4px;padding-right: 4px;}
        .panel-heading { font-size: 18px;}
        .panel-heading  .glyphicon{margin-right: 5px; font-size:1.2em;}
        .panel-heading a,.panel-heading a:hover,.panel-heading a:focus{color: #FFFFFF;text-decoration: none;}

        .form-group{vertical-align: middle;}
        .form-inline .form-group{width: 160px;}
        .pad-r-10{padding-right: 30px;}

        .jumbotron a {color: #C0C0C0;}
        .jumbotron a:hover {color: #FFFFFF;text-decoration: none;}
    </style>
</head>
<body>
<nav class="navbar theme">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#myNavbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">智奇铁路设备有限公司</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li class=""><a data-target="" data-toggle="tab" href="#">新闻中心</a></li>
                <li class=""><a data-toggle="tab" href="#">学习园地</a></li>
                <li class=""><a data-toggle="tab" href="#">经营动态</a></li>
                <li class=""><a data-toggle="tab" href="#">文化视野</a></li>
                <li class=""><a data-toggle="tab" href="#">服务平台</a></li>
                <li class=""><a data-toggle="tab" href="#">员工之家</a></li>
                <li class=""><a data-toggle="tab" href="#">后台管理</a></li>
            </ul>
            <div class="navbar-form navbar-right">
                <%--未登录--%>
                <div id="login" class="form-group">
                    <input type="text" class="form-control" placeholder="用户名...">
                    <input type="password" class="form-control" placeholder="密码...">
                    <button type="submit" class="btn btn-default">登录</button>
                </div>
                <%--登陆后--%>
                <div id="exit" class="form-group" style="font-size: 20px;">
                    <i class="glyphicon glyphicon-bell"></i><span class="notification" id="notices">${notice}</span>
                    <i class="glyphicon glyphicon-user "></i><span id="user">牛旭亮</span>
                    <button class="form-control btn btn-info">登出</button>
                </div>
            </div>
        </div>
    </div>
</nav>
<%--内容区域--%>
<div class="container" style="margin-top: -20px;">
    <%--轮播图--%>
    <div class="jumbotron" style="margin: 3px auto 5px;padding:0px;">
        <img src="/images/ZQLOG1.jpg" style="width: 100%;">
    </div>

    <div class="row">
        <%--公告--%>
        <div class="col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading"><span class="glyphicon glyphicon-volume-up" data-toggle="tooltip" data-placement="right" title="点击[公告]查看更多"></span><a>公告</a></div>
                <ul class="list-group">
                    <c:forEach var="obj" items="${News}" varStatus="vs" end="5">
                        <li class="list-group-item"><a>${fns:abbreviate(obj.newTitle,16)}<span class="text-right pull-right"><fmt:formatDate value="${obj.CreateDate}" pattern="yyyy-MM-dd"/></span></a></li>
                    </c:forEach>
                </ul>
            </div>
            <hr class="hidden-sm hidden-md hidden-lg">
        </div>
        <%--办公平台--%>
        <div class="col-sm-8" >
            <div class="panel panel-primary" style="height: 295px;">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#BGPT" data-toggle="tab">办公平台</a></li>
                    <li><a href="#MES" data-toggle="tab">MES报表</a></li>
                    <li><a href="#SBGL" data-toggle="tab">设备管理</a></li>
                    <li><a href="#CGGZ" data-toggle="tab">采购跟踪</a></li>
                    <li><a href="#NRYJ" data-toggle="tab">内容预警</a></li>
                    <li>
                        <form class="navbar-form navbar-left" style="margin: 7px auto 7px;" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="工号/姓名">
                            </div>
                            <button class="btn btn-primary btn-sm" style="line-height: 16px;">查询</button>
                        </form>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="BGPT">
                        <div style="padding:10px;">
                            <div class="list-group">
                                <div class="form-inline" style="font-size: 1.2em;padding: 20px;">
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-lock"></span>
                                        <label class="pad-r-10"> <a href="http://172.31.1.9:8086/NaNaWeb"
                                                                    target="_blank"> 工作流</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span>
                                        <label class="pad-r-10"> <a href="" target="_blank"> CAXA</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-qrcode"></span>
                                        <label class="pad-r-10"> <a href=""> 条码系统</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-cutlery"></span>
                                        <label class="pad-r-10"> <a href="http://172.31.2.26:2000/index.jsp"
                                                                    target="_blank"> 项目管理</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span><label class="pad-r-10"> <a
                                            href="http://plm.zqrail.com/Windchill/app/" target="_blank"> PLM</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span><label class="pad-r-10"> <a
                                            href="http://172.31.1.70/tiptop.html" target="_blank">ERP</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span><label class="pad-r-10"> <a
                                            href="http://172.31.1.3:8080/InfoViewApp/logon.jsp" target="_blank"> BI</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span><label class="pad-r-10"> <a
                                            href="http://172.31.2.21:14000/Home/LoginView"
                                            target="_blank">APS</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span><label class="pad-r-10"> <a
                                            href="http://172.31.1.36/MES_production_MESSC/"
                                            target="_blank">MES</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span><label class="pad-r-10"> <a
                                            href="http://172.31.2.28/starlims11.ZQ/" target="_blank">实验室系统</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span><label class="pad-r-10"> <a
                                            href="http://172.31.1.29" target="_blank">标准数据库</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-envelope"></span><label class="pad-r-10"> <a
                                            href="http://mail.zqrail.cn/" target="_blank">企业邮箱</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-globe"></span><label class="pad-r-10"> <a
                                            href="http://zqrail.cn/" target="_blank">公司外网</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span><label class="pad-r-10"> <a
                                            href="http://172.31.1.43:83/page/Login.aspx" target="_blank">MDC</a></label>
                                    </div>
                                    <div class="form-group">
                                        <span class="glyphicon glyphicon-user"></span><label class="pad-r-10"> <a
                                            href="http://172.31.1.58:8080" target="_blank"
                                            title="客户关系管理">CRM</a></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="MES">
                        <div style="padding:10px;">
                            <div class="list-group">
                                <a class="list-group-item">
                                    <span class="badge">2016-10-19</span>
                                    Cras justo odio
                                </a>
                                <a class="list-group-item">
                                    <span class="badge">2016-10-19</span>
                                    Cras justo odio
                                </a>
                                <a class="list-group-item">
                                    <span class="badge">2016-10-19</span>
                                    Cras justo odio
                                </a>
                                <a class="list-group-item">
                                    <span class="badge">2016-10-19</span>
                                    Cras justo odio
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="SBGL">
                        <div style="padding:10px;">
                            <div class="list-group">
                                <div class="alert alert-danger" role="alert">
                                    <a href="javascript:void(0);" class="alert-link">没有消息了！</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="CGGZ">
                        <div style="padding:10px;">
                            <div class="list-group">
                                <div class="alert alert-danger" role="alert">
                                    <a href="javascript:void(0);" class="alert-link">没有消息了！</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="NRYJ">
                        <div style="padding:10px;">
                            <div class="list-group">
                                <div class="alert alert-danger" role="alert">
                                    <a href="javascript:void(0);" class="alert-link">没有消息了！</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--新闻及会议--%>
    <div class="row">
        <div class="col-sm-8">
            <div class="panel panel-primary" style="height: 295px;"></div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-primary" style="height: 295px;">
                <div class="panel-heading"><span class="glyphicon glyphicon-home"></span>会议预约</div>
                <div class="panel-body">
                    <marquee onmouseover="this.stop()" onmouseout="this.start()" scrolldelay="1" behavior="scroll"
                                        direction="up" scrollamount="2">
                    <ul class="list-group">
                        <c:forEach varStatus="vs" var="obj" items="${meet}">
                            <li class="list-group-item-heading" style="font-size: 1.2em;"><a href="#">${obj.meetc}</a></li>
                        </c:forEach>
                    </ul>
                </marquee>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <div class="panel panel-primary" style="height: 295px;"></div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-primary" style="height: 295px;"></div>
        </div>
    </div>

</div>

<div class="jumbotron theme text-center" style="margin-bottom: -30px; padding-bottom: 10px;">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="list-unstyled list-inline">
                    <li><a>长春轨道客车股份有限公司</a></li>
                    <li><a>四方股份有限公司</a></li>
                    <li><a>中国中车</a></li>
                    <li><a>铁道院集团</a></li>
                    <li><a>Lucchini</a></li>
                    <li><a>Siemens</a></li>
                    <li><a>Bombardier</a></li>
                </ul>
            </div>
        </div>
    </div>
    <p>版权所有:智奇铁路设备有限公司</p>
</div>
<script src="/js/jquery-3.1.1.js"></script>
<script src="/plugins/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script>
    $(function () {
        init();
        $("[data-toggle='tooltip']").tooltip();
        /*var count=$("#notices");
        var mm=${notice};
        if(mm==''||mm==null){
           count.style.display="none";
        }
        alert(mm);*/

        $("#login .btn").click(function(){
            var username=$("#login input[type='text']").val();
            var password=$("#login input[type='password']").val();
            if (username == null || username == '') {
                alert("请输入用户名！")
            } else if (password == null || password == '') {
                alert("密码不能为空！")
            }
            if(username!=null&&password!=null&&username!=''&&password!=''){
                $.post("login",{username:username,password:password},function(data){
                    if(data=="\"reload\""){
                        window.location.reload();
                    }else {
                        alert(data);
                    }
                });
            }
        });
        $("#exit .btn").click(function(){
            $.post("logout",{},function(data){window.location.reload();});
        });
    });


    function init() {
        var user = "<%=session.getAttribute("user")%>";
        if (user == "null") {
            var exit = document.getElementById("exit");
            exit.style.display = 'none';
        } else {
            var login = document.getElementById("login");
            login.style.display = 'none';
        }
    }
</script>
</body>
</html>