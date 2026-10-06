<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Login - PGHub</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/CSS/style.css">

    <style>

        .login-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f5f7fb;
            padding: 30px;
        }

        .login-card {
            width: 100%;
            max-width: 430px;
            background: #ffffff;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.08);
        }

        .login-brand {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-logo {
            width: 64px;
            height: 64px;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            background: #173b67;
            color: #ffffff;
            font-size: 22px;
            font-weight: 700;
        }

        .login-brand h1 {
            margin: 0;
            color: #173b67;
            font-size: 28px;
        }

        .login-brand p {
            margin-top: 7px;
            color: #777;
            font-size: 14px;
        }

        .login-title {
            margin-bottom: 25px;
        }

        .login-title h2 {
            margin: 0 0 7px;
            color: #222;
            font-size: 22px;
        }

        .login-title p {
            margin: 0;
            color: #777;
            font-size: 14px;
        }

        .login-form-group {
            margin-bottom: 20px;
        }

        .login-form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }

        .login-form-group label span {
            color: #dc3545;
        }

        .login-form-group input {
            width: 100%;
            box-sizing: border-box;
            padding: 13px 14px;
            border: 1px solid #d7dce3;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: 0.2s;
        }

        .login-form-group input:focus {
            border-color: #173b67;
            box-shadow: 0 0 0 3px rgba(23, 59, 103, 0.10);
        }

        .login-button {
            width: 100%;
            border: none;
            padding: 13px;
            border-radius: 8px;
            background: #173b67;
            color: #ffffff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .login-button:hover {
            background: #102d50;
        }

        .login-error {
            background: #fdecec;
            color: #b42318;
            border: 1px solid #f5c2c0;
            padding: 12px 14px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .login-info {
            margin-top: 20px;
            padding: 12px 14px;
            background: #eef6ff;
            border-radius: 8px;
            color: #315b82;
            font-size: 13px;
            line-height: 1.5;
        }

        .back-home {
            text-align: center;
            margin-top: 25px;
        }

        .back-home a {
            color: #173b67;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        .back-home a:hover {
            text-decoration: underline;
        }

        .login-footer {
            text-align: center;
            margin-top: 25px;
            color: #999;
            font-size: 12px;
        }

        @media (max-width: 500px) {

            .login-page {
                padding: 20px;
            }

            .login-card {
                padding: 30px 22px;
            }

        }

    </style>

</head>

<body>

<div class="login-page">

    <div class="login-card">

        <!-- ================= BRAND ================= -->

        <div class="login-brand">

            <div class="login-logo">
                PG
            </div>

            <h1>
                PGHub
            </h1>

            <p>
                Student PG Management System
            </p>

        </div>


        <!-- ================= TITLE ================= -->

        <div class="login-title">

            <h2>
                Admin Login
            </h2>

            <p>
                Sign in to access the management dashboard
            </p>

        </div>


        <!-- ================= ERROR MESSAGE ================= -->

        <%
            if (request.getAttribute("error") != null) {
        %>

            <div class="login-error">

                <strong>
                    Login Failed:
                </strong>

                ${error}

            </div>

        <%
            }
        %>


        <!-- ================= LOGIN FORM ================= -->

        <form action="${pageContext.request.contextPath}/admin/login"
              method="post">


            <!-- USERNAME -->

            <div class="login-form-group">

                <label for="username">

                    Username
                    <span>*</span>

                </label>

                <input type="text"
                       id="username"
                       name="username"
                       value="${admin.username}"
                       placeholder="Enter admin username"
                       autocomplete="username"
                       required>

            </div>


            <!-- PASSWORD -->

            <div class="login-form-group">

                <label for="password">

                    Password
                    <span>*</span>

                </label>

                <input type="password"
                       id="password"
                       name="password"
                       placeholder="Enter admin password"
                       autocomplete="current-password"
                       required>

            </div>


            <!-- LOGIN BUTTON -->

            <button type="submit"
                    class="login-button">

                🔐 Login to Admin Portal

            </button>

        </form>


        <!-- ================= INFORMATION ================= -->

        <div class="login-info">

            <strong>Administrator Access</strong>
            <br>

            Use your authorized administrator username
            and password to access the PGHub management system.

        </div>


        <!-- ================= BACK HOME ================= -->

        <div class="back-home">

            <a href="${pageContext.request.contextPath}/">

                ← Back to Home

            </a>

        </div>


        <!-- ================= FOOTER ================= -->

        <div class="login-footer">

            © 2026 Student PG Management System

        </div>

    </div>

</div>

</body>

</html>