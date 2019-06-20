<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>

<style type="text/css">
        *{
            padding:0;
            margin:0;
            text-decoration: none;
            list-style: none;
            text-align:center;
        }
        body{
            width:100%;
            height:100%;
            background-color: #eee;
        }
        .container{
            width:600px;
            height:600px;
            margin: 100px auto;
 
        }
        table{
        	width:100%;
        	height:600px;
            border:2px solid blueviolet;
            margin:0 auto;
        }
        a{
			text-decoration:none;
			font-size:18px;
			border-radius:4px;
		}
		a:hover{

			background-color: #f47d31;
		}
        
        </style>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
<script>
    	$(function(){
    		$("#mytable tbody tr:even").css("background-color","aliceblue");//偶数
    		$("#mytable tbody tr:odd").css("background-color","beige");//奇数
    	});
    </script>
<body>
<jsp:include page="backstage.jsp"></jsp:include>
<div class="container">
<h1>用户管理</h1>
<hr>
<table border="1" id="mytable">
<thead>
<tr>
<th>用户名</th><th>密码</th><th>邮箱</th><th>地址</th><th>操作</th>
</tr>
</thead>
<tbody>
<c:forEach items="${requestScope.userList }" var="u">
<tr>
<td>${u.uname }</td>
<td>${u.passwd }</td>
<td>${u.email }</td>
<td>${u.address }</td>
<td><a href="${pageContext.request.contextPath }/UserEdit_do?username=${u.uname }">删除</a><a href="${pageContext.request.contextPath }/AdminOrder?search=${u.uname }">查看订单</a></td>
</tr>
</c:forEach>
</tbody>
</table>


</div>


</body>
</html>