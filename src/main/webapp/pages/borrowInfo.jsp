<%--
  Created by IntelliJ IDEA.
  User: jiangxiaobai
  Date: 2018/1/6
  Time: 14:41
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

<blockquote class="layui-elem-quote" style="font-size: 25px; text-align: center;">借还信息</blockquote>
    <table id="tab" class="layui-table">
        <tr>
            <th>编号</th>
            <th>读者</th>
            <th>图书</th>
            <th>借书时间</th>
            <th>还书时间</th>
        </tr>
        
    </table>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script>
    function loadData() {
        $("#tab tr:not(:first)").remove();
        $.post("${pageContext.request.contextPath}/borrowInfoAction/findBorrowInfoList",null,function (data) {
            $.each(data,function (i,v) {
                var tr = `<tr>
                    <td>`+ (i+1) +`</td>
                    <td>`+ v.reader.rname +`</td>
                    <td>`+ v.book.bname +`</td>
                    <td>`+ v.fstarttime +`</td>
                    <td>`+ v.fendtime +`</td>
                </tr>`;
                $("#tab").append(tr);
            })
        });
    }
    window.onload = loadData();
</script>
</html>
