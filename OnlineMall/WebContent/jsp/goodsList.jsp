<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Goods"%>
<%@page import="com.dao.GoodsDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Iterator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>商品列表</title>

</head>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
<script>
    $(function () {
        $("#mytable tbody tr:even").css("background-color", "aliceblue");//偶数
        $("#mytable tbody tr:odd").css("background-color", "beige");//奇数
    });
    function addcart(goodsname) {
        $.ajax(
            {
                url: "/OnlineMall/Cart_do?goodsName=" + goodsname,
                dataType: "html",
                type: "post",
                contentType: "text",
                data: goodsname,
                success: function (data) {
                    alert(data);
                }

            });
    }
</script>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">

        <table border="1" id="mytable">
            <thead>
                <tr>
                    <th>商品</th>
                    <th>名称</th>
                    <th>库存</th>
                    <th>价格</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="goods" items="${requestScope.ListGoods}">
                    <tr>
                        <td><img src="${pageContext.request.contextPath }/images/${goods.photo}" id="goodpic"></td>
                        <td><a
                                href="${pageContext.request.contextPath }/GoodsShow_do?goodsName=${goods.gname}">${goods.gname}</a>
                        </td>
                        <td>${goods.number}</td>
                        <td>${goods.price}</td>
                        <%--                 <td><a href="${pageContext.request.contextPath }/Cart_do?goodsName=${goods.gname}">加入购物车</a></td> --%>
                        <td><a href="#" onclick="addcart('${goods.gname}')">加入购物车</a></td>
                    </tr>
                </c:forEach>
            </tbody>
            <td colspan="5"><a href="${pageContext.request.contextPath }/jsp/cart.jsp">查看购物车</a></td>
        </table>

    </div>

</body>