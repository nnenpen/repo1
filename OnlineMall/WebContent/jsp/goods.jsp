<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>商品${goods.gname}详情</title>

</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>

<style>
    #goodpic {
        width: 300px;
        height: 300px;
    }

    aside {
        display: block;
        width: 40%;
        float: left;
    }

    article {
        background-color: #eee;
        display: block;
        margin: 10px;
        padding: 10px;
    }

    a {
        text-decoration: none;
        font-size: 18px;
        border-radius: 4px;
    }

    a:hover {

        background-color: #f47d31;
    }
</style>

<script>

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
    <jsp:include page="/jsp/header.jsp"></jsp:include>

    <aside>
        <img src="${pageContext.request.contextPath }/images/${goods.photo}" id="goodpic">
    </aside>
    <section>
        <article>
            <p>商品名称：${goods.gname}</p>
            <p>商品价格：${goods.price}</p>
            <p>剩余数量：${goods.number}</p>
            <p>描述：${goods.described}</p>
            <p><a href="#" onclick="addcart('${goods.gname}')">加入购物车</a></p>
            <a>购买</a>
        </article>
    </section>

</body>

</html>