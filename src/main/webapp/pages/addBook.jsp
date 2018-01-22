<%--
  Created by IntelliJ IDEA.
  User: jiangxiaobai
  Date: 2018/1/4
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<html>
<head>
    <title>添加图书</title>
</head>
<body>
<blockquote class="layui-elem-quote" style="font-size: 25px; text-align: center;">添加图书</blockquote>
<center>
    <div style="font-size: 18px">
        <c:if test="${param.rtype==1}">
            <p style="color:green;">添加图书成功!</p>
        </c:if>
        <c:if test="${param.rtype==-1}">
            <p style="color:red;">添加图书失败!</p>
        </c:if>
        <c:if test="${param.rtype==-2}">
            <p style="color:red;">请填写完整图书信息!</p>
        </c:if>
    </div>
<form style="text-align: center;width: 600px; " class="layui-form" action="${pageContext.request.contextPath}/bookAction/addBook" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">图书名称：</label>
        <div class="layui-input-block">
            <input type="text" name="bname" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图书分类：</label>
        <div class="layui-input-block">
            <input type="text" name="btype" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图书作者：</label>
        <div class="layui-input-block">
            <input type="text" name="bauthor" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图书价格：</label>
        <div class="layui-input-block">
            <input type="text" name="bprice" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图书数量：</label>
        <div class="layui-input-block">
            <input type="text" name="bnumber" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上架时间：</label>
        <div class="layui-input-block">
            <input type="text" name="bintime" class="layui-input" placeholder="yyyy-MM-dd" id="test1">
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
</html>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
        });
    });
</script>
