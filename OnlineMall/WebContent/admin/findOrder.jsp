<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<style>
header {
	background-color: #2289f0;
	display: block;
	color: #ffffff;
	text-align: center;
}
/* 搜素框 */
        .search-input {
            width: 500px;
            height: 30px;
            margin: 50px auto 0px;
        }

        form .search {
            width: 400px;
            height: 24px;
            border: 2px solid #ff5000;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            text-indent: 10px;
        }

        form .btn {
            border: 2px solid #ff5000;
            background-color: #ff5000;
            height: 24px;
            width: 40px;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
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
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
<script type="text/javascript"  defer="defer" >
// 	function find(){
// 		var uname=document.getElementById("search").value;
// 		if(uname.length==0){
// 			alert("请输入用户名");
// 		}
// 		else{

// 			var url="/OnlineMall/AdminOrder?uname="+uname;
// 			alert(url);
// 			window.location.href=url;
// 		}
// 	}
</script>
</head>
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
	<form action="/OnlineMall/AdminOrder" method="post">
			根据用户查询订单:
			<br>
			<br>
			<input type="text" class="search" name="search" id="search" placeholder="模糊查询"> 
			<input type="submit" name="search" id="search" class="btn" value="搜索"  >
	</form>
	<h1>订单列表</h1>
	<c:choose>
		<c:when test="${empty (adminlistOrder) }">
               你还没有购买任何东西！
		<br></br>
		</c:when>
		<c:otherwise>
		<c:forEach var="order" items="${requestScope.adminlistOrder}">
			<table  id="mytable">
			<thead>
				<tr>
					<td colspan="3">订单</td>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>订单号</td>
						<td colspan="2">${order.id}</td>
					</tr>
					<tr>
						<td>订单号</td>
						<td colspan="2">${order.order_id}</td>
					</tr>
					
					<tr>
						<td>商品名</td>
						<td>数量</td>
						<td>单价</td>
					</tr>
					<c:forEach var="goods" items="${order.listOrderDetail}">
						<tr>
						<td>${goods.gname}</td>
						<td>${goods.number}</td>
						<td>${goods.price}</td>
						</tr>

					</c:forEach>
				<tr>
				<td colspan="2">支付</td>
				<td colspan="2">${order.money}</td>
				</tr>
			</tbody>
			</table>
			<hr>
		</c:forEach>
		</c:otherwise>
	</c:choose>
	<hr>
</body>
</html>