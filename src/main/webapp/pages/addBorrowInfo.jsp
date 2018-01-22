<%--
  Created by IntelliJ IDEA.
  User: jiangxiaobai
  Date: 2018/1/6
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加借还信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<blockquote class="layui-elem-quote" style="font-size: 25px; text-align: center;">添加借还信息</blockquote>
<center>
    <form id="addBorrowInfo" class="layui-form" style="width: 600px;">
        <div style="height: 30px;"></div>
        <div class="layui-form-item">
            <label class="layui-form-label">读者：</label>
            <div class="layui-input-block">
                <select name="reader.rno" lay-verify="required">
                    <option value="">请选择读者</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图书：</label>
            <div class="layui-input-block">
                <select name="book.bno" lay-verify="required">
                    <option value="">请选择图书</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">借阅时间：</label>
            <div class="layui-input-block">
                <input type="text" name="fstarttime" class="layui-input" placeholder="yyyy-MM-dd" id="test1">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">还书时间：</label>
            <div class="layui-input-block">
                <input type="text" name="fendtime" class="layui-input" placeholder="yyyy-MM-dd" id="test2">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit onclick="addBorrowInfo()">立即添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
<center>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script>
    var form;
    var laydate;
    layui.use(['form', 'laydate'], function(){
        form = layui.form;
        laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test1'
        });
        laydate.render({
            elem: '#test2'
        });
    });

    window.onload = function(){
        var reader = $("select[name='reader.rno']");
        var book = $("select[name='book.bno']");
        $("select[name='reader.rno'] option:not(:first)").remove();
        $("select[name='book.bno'] option:not(:first)").remove();
        $.post("${pageContext.request.contextPath}/borrowInfoAction/toAddBorrowInfo",null,function (data) {
            $.each(data[0],function (i,v) {
                book.append("<option value='" + v.bno + "'>" + v.bname + "</option>");
            });
            $.each(data[1],function (i,v) {
                reader.append("<option value='" + v.rno + "'>" + v.rname + "</option>");
            });
            form.render();
        });
    }

    function addBorrowInfo() {
        var param = $("#addBorrowInfo").serialize();
        console.log(param);
        $.post("${pageContext.request.contextPath}/borrowInfoAction/addBorrowInfo",param,function (data) {
            if(data == "success"){
                $("#addBorrowInfo")[0].reset();
                alert("添加成功！");
            }
        });
    }
</script>
</html>
