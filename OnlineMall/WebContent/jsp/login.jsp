<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户登录</title>
    <meta name="description" content="购物登录">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
            left:0;
            right:0;
            top:500px;
            bottom:0;
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
            margin-left:6px;
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
        ${info }
    <!-- 容器 -->
    <div id="container">
        <!-- 头部 -->
        <div class="header">
            <p>亲，请登录！</p>
        </div>
        <!-- 表单 -->
        <div class="form-body">
            <form action="<%=request.getContextPath() %>/login_do" method="post">
                <div class="form-group">
                    <label for="">用户名：</label>
                    <input type="text" class="form-input" name="username">
                </div>
                <div class="form-group">
                    <label for="">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" class="form-input" name="password">
                </div>
                <div class="btn">
                    <input type="reset" value="重置" class="form-btn form-btn-warnming">
                    <input type="submit" value="登录" class="form-btn form-btn-primary">
                </div>
            </form>
        </div>
    </div>
</body>

</html>