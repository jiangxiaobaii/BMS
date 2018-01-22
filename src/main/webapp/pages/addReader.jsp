<%--
  Created by IntelliJ IDEA.
  User: jiangxiaobai
  Date: 2018/1/6
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<html>
<head>
    <title>添加读者</title>
</head>
<body>
<blockquote class="layui-elem-quote" style="font-size: 25px; text-align: center;">添加读者</blockquote>
<center>
    <div style="font-size: 18px">
        <c:if test="${param.rtype==1}">
            <p style="color:green;">添加读者成功!</p>
        </c:if>
        <c:if test="${param.rtype==-1}">
            <p style="color:red;">添加读者失败!</p>
        </c:if>
        <c:if test="${param.rtype==-2}">
            <p style="color:red;">请填写完整读者信息!</p>
        </c:if>
    </div>
    <form style="text-align: center;width: 600px; " class="layui-form" action="${pageContext.request.contextPath}/readerAction/addReader" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">读者姓名：</label>
            <div class="layui-input-block">
                <input type="text" name="rname" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">读者性别：</label>
            <div class="layui-input-block">
                <input type="text" name="rsex" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">读者年龄：</label>
            <div class="layui-input-block">
                <input type="text" name="rage" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">读者专业：</label>
            <div class="layui-input-block">
                <input type="text" name="rmajor" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话：</label>
            <div class="layui-input-block">
                <input type="text" name="rtel" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</center>
</body>
</body>
</html>
