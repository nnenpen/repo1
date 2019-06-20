<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单</title>

</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>

<body>
<jsp:include page="header.jsp"></jsp:include>
	
<hr>
	<h1>订单列表</h1>
	<c:choose>
		<c:when test="${empty (listOrder) }">
               你还没有购买任何东西！
		</br>
		</c:when>
		<c:otherwise>
		<c:forEach var="order" items="${sessionScope.listOrder}">
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
				<td colspan="2" style="color:red;">已支付</td>
				<td colspan="2">${order.money}</td>
				</tr>
			</tbody>
			</table>
			<hr>
		</c:forEach>
		</c:otherwise>
	</c:choose>

</body>
</html>