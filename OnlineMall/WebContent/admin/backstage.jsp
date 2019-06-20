<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系统后台</title>

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
		<h2>309网上商城后台</h2>
	</header>
	<div>
		<nav>
			<a href="<%=request.getContextPath()%>/UserManage_do">用户管理</a> 
			<a href="<%=request.getContextPath()%>/GoodsManage_do">商品管理</a>
			<a href="<%=request.getContextPath()%>/admin/findOrder.jsp">订单查询</a>
			<a href="<%=request.getContextPath()%>/index.jsp">退出</a>
		</nav>
	</div>
</body>
</html>