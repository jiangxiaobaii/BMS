<%--
  Created by IntelliJ IDEA.
  User: jiangxiaobai
  Date: 2017/1/3
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>图书馆管理系统</title>
    <style type="text/css">
        body{
            margin: 0;
            padding: 0;
        }
        #myiframe{
            width: 1160px;
            height: 560px;
            border: 0px;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">图书馆管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="javascript:toContext();"><i class="layui-icon" style="font-size: 30px;">&#xe60b;</i></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="layui-icon" style="font-size: 25px;">&#xe612;</i> ：${loginUser.uname}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:toModifypwd();">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="index.jsp">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="layui-icon" style="font-size: 20px;">&#xe649;</i> 图书管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:toBookList();">图书列表</a></dd>
                        <dd><a href="javascript:toAddBook();">添加图书</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon" style="font-size: 20px;">&#xe649;</i> 读者管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:toReaderList();">读者列表</a></dd>
                        <dd><a href="javascript:toaddReaer();">添加读者</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon" style="font-size: 20px;">&#xe649;</i> 图书借还管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:toBorrowInfoList();" >借还信息</a></dd>
                        <dd><a href="javascript:toAddBorrowInfo();">添加借书信息</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe id="myiframe" src="${pageContext.request.contextPath}/pages/Context.jsp" ></iframe>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    //跳转到关于系统页面
    function toContext(){
        $("#myiframe").attr("src","${pageContext.request.contextPath}/pages/Context.jsp")
    }

    //
    function toModifypwd(){
        $("#myiframe").attr("src","${pageContext.request.contextPath}/pages/ModifyPwd.jsp")
    }
    //跳转到图书列表页面
    function toBookList(){
        $("#myiframe").attr("src","${pageContext.request.contextPath}/pages/bookList.jsp");
    }

    //跳转到添加图书页面
    function toAddBook() {
        $("#myiframe").attr("src","${pageContext.request.contextPath}/pages/addBook.jsp");
    }

    //跳转到读者列表页面
    function toReaderList(){
        $("#myiframe").attr("src","${pageContext.request.contextPath}/pages/readerList.jsp");
    }

    //跳转到添加读者页面
    function toaddReaer() {
        $("#myiframe").attr("src","${pageContext.request.contextPath}/pages/addReader.jsp");
    }

    //跳转到借还列表页面
    function toBorrowInfoList(){
        $("#myiframe").attr("src","${pageContext.request.contextPath}/pages/borrowInfo.jsp");
    }

    //跳转到添加借书信息
    function toAddBorrowInfo() {
        $("#myiframe").attr("src","${pageContext.request.contextPath}/pages/addBorrowInfo.jsp");
    }
</script>
</body>
</html>