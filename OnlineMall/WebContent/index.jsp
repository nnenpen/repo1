<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>309网上商城</title>

    <link rel="stylesheet" type="text/css" href="css/index.css" />
</head>
${info }
<style>
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style: none;
    }

    html,
    body {
        width: 100%;
        height: 100%;
        background-color: #f4f4f4;
        color: #3c3c3c;
        overflow-x: hidden;
    }

    .wrapper {
        width: 100%;
        height: 100%;

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

    .menu {
        width: 600px;
        height: 100px;
        margin: 0 auto;
    }

    .menu ul li {
        float: left;
        margin-right: 7px;
        margin-top: 20px;
    }

    a {
        color: #6c6c6c;
        font-size: 18px;
        line-height: 35px;
        padding: 0 6px;
    }

    a:hover {
        color: #f40;
    }

    div img {
        width: 600px;
        height: 300px;
        /* border: 1px solid black; */
    }

    table,
    tr,
    td {
        border: none;
    }

    table img {
        width: 200px;
        height: 180px;
    }

    td {
        text-align: center;
        padding: 20px;
    }
</style>


<body onload="init()">
    <jsp:include page="jsp/header.jsp"></jsp:include>

    <!-- 大容器 -->
    <div class="wripper">
        <!-- 搜索区 -->
        <div class="search-input">
            <form action="${pageContext.request.contextPath }/Goods_do" method="post">
                <input type="text" class="search" name="search" id="search" placeholder="书籍">
                <input type="submit" name="search" id="search" class="btn" value="搜索">
            </form>
        </div>
        <!-- 左菜单栏 -->
        <div class="menu">
            <ul>
                <li><a href="${pageContext.request.contextPath }/Goods_do?type=书籍">书籍</a></li>
                <li><a href="${pageContext.request.contextPath }/Goods_do?type=运动户外">运动户外</a></li>
                <li><a href="${pageContext.request.contextPath }/Goods_do?type=文具">文具</a></li>
                <li><a href="${pageContext.request.contextPath }/Goods_do?type=手表配饰">手表配饰</a></li>
                <li><a href="${pageContext.request.contextPath }/Goods_do?type=个人洗护">个人洗护</a></li>
                <li><a href="${pageContext.request.contextPath }/Goods_do?type=营养保健">营养保健</a></li>
                <li><a href="${pageContext.request.contextPath }/Goods_do?type=家用电器">家用电器</a></li>
            </ul>

        </div>

        <div align="center">
            <img src="${pageContext.request.contextPath }/images/1.jpg" alt="首页轮播" id="myimg" />
        </div>

        <div align="center">
            <table>
                <p style="color:red;font-size: 18px;word-spacing: 6 px;">热销产品</p>
                <tr>
                    <td>
                        <a href="${pageContext.request.contextPath }/GoodsShow_do?goodsName=CAD"> 
                        <img src="${pageContext.request.contextPath }/images/CAD1.jpg" alt="CAD">
                        <br>
                        <p style="text-decoration:line-through;color:red;">原价：¥48</p>
                        <p style="color:blue;">现价：¥32</p>
                        </a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath }/GoodsShow_do?goodsName=Kanken Classic 经典款双肩背包"> 
                        <img src="${pageContext.request.contextPath }/images/书包1.jpg" alt="书包1">
                        <br>
                        <p style="text-decoration:line-through;color:red;">原价：¥370</p>
                        <p style="color:blue;">现价：¥359</p>
                        </a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath }/GoodsShow_do?goodsName=机械女表">
                        <img src="${pageContext.request.contextPath }/images/手表2.jpg" alt="手表">
                        <br>
                         <p style="text-decoration:line-through;color:red;">原价：¥2488</p>
                        <p style="color:blue;">现价：¥2388</p>
                        </a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath }/GoodsShow_do?goodsName=经典黑白休闲板鞋">
                        <img src="${pageContext.request.contextPath }/images/鞋子2.jpg" alt="鞋子">
                        <br>
                         <p style="text-decoration:line-through;color:red;">原价：¥499</p>
                        <p style="color:blue;">现价：¥399</p>
                        </a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath }/GoodsShow_do?goodsName=计算器">
                        <img src="${pageContext.request.contextPath }/images/计算器1.jpg" alt="计算器">
                        <br>
                         <p style="text-decoration:line-through;color:red;">原价：¥40</p>
                        <p style="color:blue;">现价：¥23</p>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        function init() {
            window.setInterval(nextImg, 2000);
        }

        var pathArr = new Array(
            "<%=request.getContextPath() %>/images/1.jpg",
            "<%=request.getContextPath() %>/images/2.jpg",
            "<%=request.getContextPath() %>/images/3.jpg");
        var index = 0;

        function nextImg() {
            myimg = document.getElementById("myimg");
            index++;
            if (index >= pathArr.length) {
                index = 0;
            }
            myimg.src = pathArr[index];
        }
    </script>

</body>

</html>