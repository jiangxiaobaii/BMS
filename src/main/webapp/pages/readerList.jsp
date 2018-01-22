<%--
  Created by IntelliJ IDEA.
  User: jiangxiaobai
  Date: 2018/1/6
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>读者列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<blockquote class="layui-elem-quote" style="font-size: 25px; text-align: center;">读者信息列表</blockquote>
<table id="tab" class="layui-table" border="1" width="1100">
    <tr>
        <td>编号</td><td>姓名</td>
        <td>性别</td><td>年龄</td>
        <td>专业</td><td>电话</td>
        <td>管理</td>
    </tr>
</table>
</body>
</html>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
    function loadData(){
        $("#tab tr:not(:first)").remove();
        $.get("${pageContext.request.contextPath}/readerAction/findBookList","",function (data) {
            $.each(data,function (i,v) {
                var tr="<tr>";
                tr+="<td>"+(i+1)+"</td>";
                tr+="<td>"+v.rname+"</td>";
                tr+="<td>"+v.rsex+"</td>";
                tr+="<td>"+v.rage+"</td>";
                tr+="<td>"+v.rmajor+"</td>";
                tr+="<td>"+v.rtel+"</td>";
                tr+="<td><a href='${pageContext.request.contextPath}/readerAction/deleteReader/"+ v.rno +"' class='layui-btn layui-btn-sm layui-btn-danger'>删除</a></td>";
                tr+="</tr>";
                $("#tab").append(tr);
            });
        });
    }
    window.onload=loadData;
</script>