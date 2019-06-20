<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>购物车</title>

    <style>
        * {
            padding: 0;
            margin: 0;
            text-decoration: none;
            list-style: none;
            font-size: 18px;
            text-align: center;
        }

        body {
            width: 100%;
            height: 100%;
            background-color: #eee;
        }

        .container {
            width: 600px;
            height: 600px;
            margin: 100px auto;
        }

        table {
            width: 100%;
            border: 2px solid blueviolet;
            margin: 0 auto;
        }

        a {
            text-decoration: none;
            font-size: 18px;
            border-radius: 4px;
        }

        a:hover {

            background-color: #f47d31;
        }

        #goodpic {
            width: 50px;
            height: 50px;
        }
    </style>

</head>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
<script>
    $(function () {
        $("#mytable tbody tr:even").css("background-color", "aliceblue");//偶数
        $("#mytable tbody tr:odd").css("background-color", "beige");//奇数
    });
</script>

<body>
    <jsp:include page="header.jsp"></jsp:include>


    <div class="container">
        <hr>

        <c:choose>
            <c:when test="${empty (cart.map) }">
                <h3>购物车为空！</h3>
                <br>
                <br>

            </c:when>
            <c:otherwise>
                <h1>购物车列表</h1>
                <br>
                <br>
                <table border="1" id="mytable">
                    <thead>
                        <tr>
                            <th>商品名</th>
                            <th>数量</th>
                            <th>单价</th>
                            <th>小计</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="g" items="${cart.map}">
                            <tr>
                                <td><a
                                        href="${pageContext.request.contextPath }/GoodsShow_do?goodsName=${g.value.goods.gname}">${g.value.goods.gname}</a>
                                </td>
                                <td>
                                    <a
                                        href="${pageContext.request.contextPath }/ChangeQuantity_do?gname=${g.value.goods.gname }&sign=0"><input
                                            type=button value="-1"></a>
                                    &nbsp;&nbsp;${g.value.quantity}&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/ChangeQuantity_do?gname=${g.value.goods.gname }&sign=1"><input type=button
                                            value="+1"></a>
                                </td>
                                <td>${g.value.goods.price}</td>
                                <td>${g.value.subtotal}</td>
                                <td><a
                                        href="${pageContext.request.contextPath }/DeleteItem_do?gname=${g.value.goods.gname }">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td><a href="${pageContext.request.contextPath}/ClearCart_do">清空购物车</a></td>
                            <td colspan="3">总价:${cart.total }元</td>
                            <td><a href="${pageContext.request.contextPath}/CountCart">结算</a></td>
                        </tr>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath }/index.jsp">继续购物</a>

    </div>
    <div class="row">
        <div class="col-md-6 col-xs-4" style="border: 1px solid red;">左</div>
        <div class="col-md-6 col-xs-4" style="border: 1px solid red;">右</div>
    </div>
    <div class="row">
        <div class="col-md-6 col-xs-4" style="border: 1px solid yellow;">左</div>
        <div class="col-md-6 col-xs-4" style="border: 1px solid yellow;">右</div>
    </div>

</body>

</html>