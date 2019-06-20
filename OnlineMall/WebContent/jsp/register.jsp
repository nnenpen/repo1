<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户注册</title>
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
            width: 500px;
            height: 300px;
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
            background-color: #9966cc;
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
            margin-left: 28px;
            background-color: #337AB7;
        }

        .form-btn-warnming {
            margin-left: 15px;
            background-color: #F0AD4E;
        }
    </style>
</head>

<body>
    <!-- 容器 -->
    <div id="container">
        <!-- 头部 -->
        <div class="header">
            <p>亲，请注册！</p>
        </div>
        <!-- 表单 -->
        <div class="form-body">
            <form id="myform" action="${pageContext.request.contextPath }/register_do" method="post">
                <div class="form-group">
                    <label>用户注册:</label>
                    <input type="text" class="form-input" name="username" id="username">
                </div>
                <div class="form-group">
                    <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" class="form-input" name="password" id="password">
                </div>
                <div class="form-group">
                    <label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
                    <input type="text" class="form-input" name="email" id="email">
                </div>
                <div class="form-group">
                        <label>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</label>
                        <input type="text" class="form-input" name="address" id="address">
                </div>
                <div class="btn">
                    <input type="reset" value="重置" class="form-btn form-btn-warnming">
                    <input type="submit" value="注册" class="form-btn form-btn-primary">
                </div>
            </form>
        </div>
    </div>


    <script>
            $(document).ready(function() {
            $("#myform").validate({ 
                rules : { 
                    username : { 
                        required : true,
                        minlength : 3,
                        remote:{
                            type: "POST",
                            url: "${pageContext.request.contextPath }/verifyusername",
                            dataType:'json',
                            data:{
                                username:function(){return $("#username").val();}
                            } 
                        }
                    },
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
                        minlength : "用户名长度不能短于3" ,
                        remote:"该用户名已存在！"
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
</body>
</html>
