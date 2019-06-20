<%@page import="com.dao.UserDao"%>
<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人主页</title>

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
            width: 380px;
            height: 400px;
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
				password : {
					required : true,
					minlength : 6
				},
				email : { 
					required : true,
					email : true
				},
				address : {
					required : true,
					minlength : 6
				},
			},
			messages : { 
				username : {
					required : "请输入用户名", 
					minlength : "用户名长度不能短于3" 
				},
				password : {
					required : "请输入密码",
					minlength : "密码长度不能短于6"
				},
				email : {
					required : "请输入邮箱",
					email: "邮箱格式不正确"
				},
				address : {
					required : "请输入地址",
					minlength : "地址长度不能短于6"
				},
			}
		});
	});
</script>

<body>
    <!-- 容器 -->
    <div id="container">
        <!-- 头部 -->
        <div class="header">
            <p>用户信息修改</p>
        </div>
        <!-- 表单 -->
        <div class="form-body">
            <form id="myform" action="${pageContext.request.contextPath }/UserEdit_do" method="post">
                <div class="form-group">
                    <label>用户注册:</label>
                    <input type="text" class="form-input" name="username" id="username" value="${user.uname }" readonly="readonly">
                    <br>
                    <p style="color:red;font-family:"宋体";">唯一凭证不可修改</p>
                </div>
                <div class="form-group">
                    <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" class="form-input" name="password" id="password" value="${user.passwd }">
                </div>
                <div class="form-group">
                    <label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
                    <input type="text" class="form-input" name="email" id="email" value="${user.email }">
                </div>
                <div class="form-group">
                        <label>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</label>
                        <input type="text" class="form-input" name="address" id="address" value="${user.address }">
                </div>
                <div class="btn">
                    <input type="submit" value="修改" class="form-btn form-btn-primary">
                </div>
            </form>
        </div>
    </div>
</body>

</html>