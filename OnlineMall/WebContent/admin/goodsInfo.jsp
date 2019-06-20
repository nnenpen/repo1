<%@page import="com.dao.UserDao"%>
<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>商品信息修改</title>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js"></script>
<style>
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            background-color: #eee;
            position: relative;
        }

        #container {
            width: 400px;
            height: 450px;
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            top: 500px;
            bottom: 0;
            border-radius: 8px;
            background-color: #fff;
        }

        .header {
            width: 100%;
            height: 50px;
            background-color: #3e87da;
            font-size: 24px;
            color: #fff;
            line-height: 50px;
            text-align: center;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .form-body {
            margin-top: 48px;
        }

        .form-group {
            margin-top: 18px;
        }

        label {
            width: 82px;
            margin-top: 18px;
            margin-left: 6px;
        }

        .form-input {
            height: 33px;
            width: 260px;
            padding-left: 8px;
            background-color: #f0ffff;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            margin-top: 30px;
        }

        .form-btn {
            height: 38px;
            width: 150px;
            color: #fff;
            border-radius: 5px;
            border: 1px solid #eee;
            box-shadow: 0px 2px 3px #ccc;
        }

        .form-btn-primary {
            margin-left:120px;
            background-color: rgb(223, 139, 30);
        }

    </style>
</head>
<script>
    $(document).ready(function() {
		$("#myform").validate({ 
			rules : { 
				number : { 
					required : true
				},
				type : {
					required : true,
				},
				price : { 
					required : true
				},
				described : {
					required : true,
					minlength : 6
				},
			},
			messages : { 
				number : {
					required : "请输入数量", 
				},
				type : {
					required : "请输入类型",
				},
				email : {
					required : "请输入价格",
				},
				address : {
					required : "请输入描述",
					minlength : "描述不能短于6"
				},
			}
		});
	});
</script>

<body>
<div id="container">
		<!-- 头部 -->
        <div class="header">
            <p>商品修改</p>
        </div>
        
        <div class="form-body">
        <form id="myform" action="${pageContext.request.contextPath }/UserEdit_do" method="post">
            <div class="form-group">
                <label for="gname">商品名 : </label>
                <input id="gname" class="form-input" name="gname" type="text" value="${goods.gname }"
                    readonly="readonly" />
                <p style="color:red;font-family:"宋体";">唯一凭证不可修改</p>
            </div>
            <div class="form-group">
                <label for="number">数&nbsp;量 : </label>
                <input id="number" class="form-input" name="number" type="text" value="${goods.number }" />
            </div>
            <div class="form-group">
                <label for="type">类&nbsp;型: </label>
                <input id="type" class="form-input" name="type" type="text" value="${goods.type }" />
            </div>
            <div class="form-group">
                <label for="price">价&nbsp;格: </label>
                <input id="price" class="form-input" name="price" type="text" value="${goods.price }" />
            </div>
            <div class="form-group">
                <label for="described">描&nbsp;述: </label>
                <input id="described" class="form-input" name="described" type="text" value="${goods.described }" />
            </div>
            <div class="btn">
                <input type="submit" value="修改" class="form-btn form-btn-primary">
            </div>
        </form>
        
        </div>
</div>
    
    
</body>

</html>