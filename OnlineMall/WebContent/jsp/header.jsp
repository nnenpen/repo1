<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

</head>
<style>
header {
background-color: #2289f0;
display: block;
color: #ffffff;
text-align: center;
}

h2 {
font-size: 24px;
margin: 0px;
text-align: center;
}
nav {
display: block;
width: 100%;
float: left;
text-align: center;
background-color: white;
padding-top: 20px;
padding-bottom: 20px;
}
nav a:link, nav a:visited {
	display: inline;
	border-bottom: 3px solid #fff;
	padding: 10px;
	text-decoration: none;
	font-weight: bold;
	margin: 5px;
}

nav a:hover {
	color: white;
	background-color: #f47d31;
}
</style>
<body>
<header>
<h2>309网上商城</h2>
</header>
    <div>
    <nav>
            <a href="<%=request.getContextPath() %>/index.jsp">主页</a>
            <a href="<%=request.getContextPath() %>/jsp/cart.jsp">购物车</a>
                <c:choose>
                    <c:when test="${empty user }">
                        <a href="<%=request.getContextPath() %>/jsp/login.jsp">用户登陆</a>
                        <a href="<%=request.getContextPath() %>/jsp/register.jsp">用户注册</a>
                        <a href="<%=request.getContextPath() %>/admin/adminLogin.jsp">管理员入口</a>
                    </c:when>
                    <c:otherwise>
                                        当前登录用户：${user.uname }
                        <a href="<%=request.getContextPath() %>/jsp/personal.jsp">个人主页</a>
                        <a href="<%=request.getContextPath() %>/orderServlet">订单</a>
                        <a href="<%=request.getContextPath() %>/logout_do">退出登录</a>
            </c:otherwise>
            </c:choose>            
    </nav>
    </div>
</body>
</html>