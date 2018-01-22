<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jiangxiaobai
  Date: 2018/1/4
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>图书列表</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        #myform{
            padding: 15px;
        }
    </style>
</head>
<body>
<blockquote class="layui-elem-quote" style="font-size: 25px; text-align: center;">图书信息列表</blockquote>
    <div id="msg"></div>
    <table class="layui-table" id="tab" border="1" width="1100">
        <tr>
            <td>编号</td><td>图书名称</td>
            <td>图书分类</td><td>图书作者</td>
            <td>图书价格</td><td>数量</td>
            <td>上架时间</td><td>管理</td>
        </tr>
    </table>
</body>
</html>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
    function loadData(){
        $("#tab tr:not(:first)").remove();
        $.get("${pageContext.request.contextPath}/bookAction/findBookList","",function (data) {
            $.each(data,function (i,v) {
                var tr="<tr>";
                tr+="<td>"+(i+1)+"</td>";
                tr+="<td>"+v.bname+"</td>";
                tr+="<td>"+v.btype+"</td>";
                tr+="<td>"+v.bauthor+"</td>";
                tr+="<td>"+v.bprice+"</td>";
                tr+="<td>"+v.bnumber+"</td>";
                var time=new Date(v.bintime);
                tr+="<td>"+time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+"</td>";
                tr+="<td><a href='javascript:;' onclick='toUpdateBook(" + JSON.stringify(v) + ")' class='layui-btn layui-btn-sm layui-btn-warm'>修改</a>" +
                    "<a href='${pageContext.request.contextPath}/bookAction/deleteBook/stk/"+ v.bno +"/ktl' class='layui-btn layui-btn-sm layui-btn-danger'>删除</a></td>";
                tr+="</tr>";
                $("#tab").append(tr);
            });
        });
    }
    window.onload=loadData;
</script>
<script>
    var layer;
    layui.use('layer',function () {
        layer = layui.layer;
    })
    function toUpdateBook(data){
        console.log(data);
        var date = new Date( data.bintime);
        var bintime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();

        var div = `<div id="myform">
        <form id="uForm" class="layui-form" method="post">
            <input type="hidden" name="bno" value="`+data.bno+`"/>
            <div class="layui-form-item">
                <label class="layui-form-label">图书名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="bname"  value="`+data.bname+`" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图书分类：</label>
                <div class="layui-input-block">
                    <input type="text" name="btype" value="`+data.btype+`" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图书作者：</label>
                <div class="layui-input-block">
                    <input type="text" name="bauthor" value="`+data.bauthor+`" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图书价格：</label>
                <div class="layui-input-block">
                    <input type="text" name="bprice" value="`+data.bprice+`" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图书数量：</label>
                <div class="layui-input-block">
                    <input type="text" name="bnumber" value="`+data.bnumber+`" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">上架时间：</label>
                <div class="layui-input-block">
                    <input type="text" name="bintime" value="`+ bintime +`" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit onclick="doUpdateBook()">立即修改</button>
                </div>
            </div>
        </form>
        </div>`;
        layer.open({
            type:1,
            title: '修改图书',
            content: div
        });
    }

    function doUpdateBook() {
        var param = $("#uForm").serialize();
        console.log(param);
        $.post("${pageContext.request.contextPath}/bookAction/updateBook",param,function (data) {
            if(data == "success"){
                layer.closeAll();
                layer.msg('修改成功');
                loadData();
            }else{
                layer.msg('修改失败');
            }
        })
    }
</script>
