<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>PGHub - Student PG Management System</title>


    <style>

        /* =========================================
           GLOBAL
        ========================================= */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }


        body {

            font-family:
                Arial,
                Helvetica,
                sans-serif;

            background: #ffffff;

            color: #172554;

        }


        /* =========================================
           MAIN HOME PAGE
        ========================================= */

        .home-page {

            min-height: 100vh;

            display: flex;

            gap: 25px;

            padding: 18px;

            background: #ffffff;

        }


        /* =========================================
           LEFT BRANDING SECTION
        ========================================= */

        .branding-section {

            width: calc(43% - 9px);

            min-height: calc(100vh - 36px);

            position: relative;

            overflow: hidden;

            border-radius: 18px;

            background-image:

                linear-gradient(
                    rgba(3, 24, 65, 0.48),
                    rgba(3, 24, 65, 0.68)
                ),

                url('${pageContext.request.contextPath}/images/pghub_building.png');

            background-size: cover;

            background-position: center;

            background-repeat: no-repeat;

            color: #ffffff;

            box-shadow:
                0 8px 30px
                rgba(15, 23, 42, 0.16);

            transition:
                transform 0.35s ease,
                box-shadow 0.35s ease;

            cursor: default;

        }


        /* =========================================
           BLUE / PURPLE OVERLAY
        ========================================= */

        .branding-section::after {

            content: "";

            position: absolute;

            inset: 0;

            border-radius: 18px;

            background:

                linear-gradient(
                    145deg,
                    rgba(20, 35, 100, 0.35),
                    rgba(76, 29, 149, 0.20),
                    rgba(2, 18, 50, 0.40)
                );

            z-index: 1;

            pointer-events: none;

            transition:
                background 0.35s ease,
                opacity 0.35s ease;

        }


        /* =========================================
           LEFT IMAGE HOVER EFFECT
        ========================================= */

        .branding-section:hover {

            transform:
                translateY(-5px);

            
        }


        .branding-section:hover::after {

            background:

                linear-gradient(
                    145deg,
                    rgba(37, 99, 235, 0.42),
                    rgba(124, 58, 237, 0.32),
                    rgba(2, 18, 50, 0.42)
                );

        }


        /* =========================================
           BRANDING CONTENT
        ========================================= */

        .branding-content {

            position: relative;

            z-index: 2;

            min-height: calc(100vh - 36px);

            padding: 45px 55px;

            display: flex;

            flex-direction: column;

        }


        /* =========================================
           LOGO
        ========================================= */

        .brand-logo {

            display: flex;

            align-items: center;

            gap: 15px;

            margin-bottom: 95px;

        }


        .brand-logo img {

            width: 68px;

            height: 68px;

            object-fit: contain;

            display: block;

        }


        .brand-name h1 {

            font-size: 32px;

            font-weight: 800;

            color: #ffffff;

            letter-spacing: 0.3px;

            text-shadow:
                0 2px 8px
                rgba(0, 0, 0, 0.35);

        }


        .brand-name p {

            margin-top: 3px;

            font-size: 14px;

            font-weight: 600;

            color: rgba(255, 255, 255, 0.90);

            letter-spacing: 0.5px;

        }


        /* =========================================
           BRANDING TEXT
        ========================================= */

        .branding-text {

            max-width: 470px;

        }


        .branding-line {

            width: 65px;

            height: 4px;

            border-radius: 10px;

            background:

                linear-gradient(
                    90deg,
                    #60a5fa,
                    #a78bfa
                );

            margin-bottom: 35px;

        }


        .branding-text h2 {

            font-size: 43px;

            line-height: 1.15;

            font-weight: 800;

            color: #ffffff;

            margin-bottom: 50px;

            text-shadow:
                0 3px 12px
                rgba(0, 0, 0, 0.40);

        }


        .branding-text h2 span {

            display: block;

        }


        .branding-text p {

            font-size: 17px;

            line-height: 1.65;

            color: rgba(255, 255, 255, 0.92);

            max-width: 390px;

            text-shadow:
                0 2px 8px
                rgba(0, 0, 0, 0.35);

        }


        /* =========================================
           LEFT BOTTOM
        ========================================= */

        .branding-bottom {

            margin-top: auto;

            padding-top: 40px;

        }


        .branding-bottom p {

            font-size: 12px;

            color: rgba(255, 255, 255, 0.75);

            letter-spacing: 0.3px;

        }


        /* =========================================
           RIGHT HOME CONTENT
        ========================================= */

        .home-content {

            width: calc(57% - 9px);

            min-height: calc(100vh - 36px);

            border-radius: 18px;

            background:

                radial-gradient(
                    circle at 100% 0%,
                    rgba(99, 102, 241, 0.10),
                    transparent 35%
                ),

                radial-gradient(
                    circle at 0% 100%,
                    rgba(37, 99, 235, 0.07),
                    transparent 35%
                ),

                #ffffff;

            padding: 55px 65px;

            display: flex;

            flex-direction: column;

            box-shadow:
                0 5px 25px
                rgba(15, 23, 42, 0.05);

        }


        /* =========================================
           RIGHT HEADER
        ========================================= */

        .right-header {

            display: flex;

            justify-content: flex-end;

            align-items: center;

            margin-bottom: 45px;

        }


        .right-header-text {

            font-size: 13px;

            color: #64748b;

        }


        .right-header-text strong {

            color: #4338ca;

        }


        /* =========================================
           WELCOME SECTION
        ========================================= */

        .welcome-section {

            max-width: 760px;

        }


        .welcome-section h2 {

            font-size: 38px;

            line-height: 1.2;

            color: #172554;

            margin-bottom: 12px;

            font-weight: 800;

        }


        .welcome-section h2 span {

            background:

                linear-gradient(
                    90deg,
                    #2563eb,
                    #7c3aed
                );

            -webkit-background-clip: text;

            -webkit-text-fill-color: transparent;

            background-clip: text;

        }


        .welcome-section > p {

            font-size: 16px;

            line-height: 1.7;

            color: #64748b;

            max-width: 650px;

        }


        /* =========================================
           BUTTONS
        ========================================= */

        .buttons {

            display: flex;

            gap: 14px;

            margin-top: 28px;

            flex-wrap: wrap;

        }


        .btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 170px;

            padding: 13px 22px;

            border-radius: 9px;

            text-decoration: none;

            font-size: 14px;

            font-weight: 700;

            transition:
                all 0.25s ease;

        }


        .btn-primary {

            color: #ffffff;

            background:

                linear-gradient(
                    135deg,
                    #2563eb,
                    #7c3aed
                );

            box-shadow:

                0 7px 20px
                rgba(79, 70, 229, 0.22);

        }


        .btn-primary:hover {

            transform:
                translateY(-2px);

            box-shadow:

                0 10px 25px
                rgba(79, 70, 229, 0.32);

        }


        .btn-secondary {

            color: #4338ca;

            background: #ffffff;

            border: 1px solid #c7d2fe;

        }


        .btn-secondary:hover {

            background: #eef2ff;

            border-color: #818cf8;

            transform:
                translateY(-2px);

        }


        /* =========================================
           FEATURES TITLE
        ========================================= */

        .features-title {

            margin-top: 48px;

            margin-bottom: 18px;

        }


        .features-title h3 {

            font-size: 20px;

            color: #172554;

            margin-bottom: 5px;

        }


        .features-title p {

            font-size: 12px;

            color: #64748b;

        }


        /* =========================================
           FEATURES
        ========================================= */

        .features {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 14px;

        }


        /* =========================================
           FEATURE CARD
        ========================================= */

        .feature {

            background:
                rgba(255, 255, 255, 0.92);

            border:
                1px solid #e0e7ff;

            border-radius: 12px;

            padding: 19px;

            min-height: 125px;

            box-shadow:
                0 5px 18px
                rgba(30, 41, 59, 0.06);

            transition:
                all 0.25s ease;

        }


        .feature:hover {

            transform:
                translateY(-4px);

            border-color: #a5b4fc;

            box-shadow:
                0 10px 25px
                rgba(79, 70, 229, 0.12);

        }


        /* =========================================
           FEATURE ICON
        ========================================= */

        .feature-icon {

            width: 36px;

            height: 36px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 9px;

            background:

                linear-gradient(
                    135deg,
                    #dbeafe,
                    #ede9fe
                );

            font-size: 18px;

            margin-bottom: 10px;

        }


        .feature h3 {

            font-size: 14px;

            color: #1e293b;

            margin-bottom: 6px;

        }


        .feature p {

            font-size: 11px;

            line-height: 1.5;

            color: #64748b;

        }


        /* =========================================
           FOOTER
        ========================================= */

        .home-footer {

            margin-top: auto;

            padding-top: 35px;

            text-align: center;

        }


        .home-footer p {

            font-size: 11px;

            color: #94a3b8;

        }


        /* =========================================
           RESPONSIVE - 1100px
        ========================================= */

        @media (max-width: 1100px) {

            .branding-section {

                width: calc(42% - 9px);

            }


            .home-content {

                width: calc(58% - 9px);

                padding: 45px 40px;

            }


            .branding-content {

                padding: 40px;

            }


            .branding-text h2 {

                font-size: 36px;

            }


            .welcome-section h2 {

                font-size: 32px;

            }


            .features {

                grid-template-columns:
                    repeat(2, 1fr);

            }

        }


        /* =========================================
           RESPONSIVE - 800px
        ========================================= */

        @media (max-width: 800px) {

            .home-page {

                flex-direction: column;

                gap: 18px;

            }


            .branding-section {

                width: 100%;

                min-height: 500px;

            }


            .branding-content {

                min-height: 500px;

                padding: 35px;

            }


            .brand-logo {

                margin-bottom: 55px;

            }


            .home-content {

                width: 100%;

                min-height: auto;

                padding: 40px 30px;

            }


            .right-header {

                justify-content: flex-start;

            }

        }


        /* =========================================
           RESPONSIVE - 500px
        ========================================= */

        @media (max-width: 500px) {

            .home-page {

                padding: 10px;

                gap: 12px;

            }


            .branding-section {

                min-height: 500px;

                border-radius: 14px;

            }


            .branding-content {

                min-height: 500px;

                padding: 28px;

            }


            .brand-logo img {

                width: 55px;

                height: 55px;

            }


            .brand-name h1 {

                font-size: 26px;

            }


            .branding-text h2 {

                font-size: 31px;

            }


            .branding-text p {

                font-size: 14px;

            }


            .home-content {

                padding: 30px 20px;

                border-radius: 14px;

            }


            .welcome-section h2 {

                font-size: 28px;

            }


            .features {

                grid-template-columns: 1fr;

            }


            .buttons {

                flex-direction: column;

            }


            .btn {

                width: 100%;

            }

        }


        /* =========================================
           VERY SMALL SCREEN
        ========================================= */

        @media (max-width: 400px) {

            .branding-content {

                padding: 25px 20px;

            }


            .branding-text h2 {

                font-size: 29px;

            }


            .home-content {

                padding: 25px 15px;

            }

        }

    </style>

</head>


<body>


<div class="home-page">


    <!-- ==================================================
         LEFT BRANDING SECTION
    =================================================== -->

    <section class="branding-section">


        <div class="branding-content">


            <!-- PGHUB LOGO -->

            <div class="brand-logo">

                <img
                    src="${pageContext.request.contextPath}/images/pghub_logo_icon.png"
                    alt="PGHub Logo">


                <div class="brand-name">

                    <h1>PGHub</h1>

                    <p>Student Accommodation</p>

                </div>

            </div>


            <!-- BRANDING TEXT -->

            <div class="branding-text">

                <div class="branding-line"></div>


                <h2>

                    <span>Better Stays.</span>

                    <span>Brighter Futures.</span>

                </h2>


                <p>

                    Find your perfect PG with comfort,
                    security and peace of mind.

                </p>

            </div>


            <!-- LEFT BOTTOM -->

            <div class="branding-bottom">

                <p>

                    Smart Student Accommodation Management

                </p>

            </div>


        </div>


    </section>



    <!-- ==================================================
         RIGHT SIDE
    =================================================== -->

    <main class="home-content">


        <!-- HEADER -->

        <div class="right-header">

            <div class="right-header-text">

                Student PG & Room Management System

            </div>

        </div>


        <!-- WELCOME -->

        <section class="welcome-section">


            <h2>

                Welcome to

                <span>PGHub</span>

            </h2>


            <p>

                Manage students, PG properties, rooms,
                allocations, payments, complaints and
                visitors from one simple system.

            </p>


            <!-- LOGIN BUTTONS -->

            <div class="buttons">


                <a
                    class="btn btn-primary"
                    href="${pageContext.request.contextPath}/admin/login">

                    Admin Login

                </a>


                <a
                    class="btn btn-secondary"
                    href="${pageContext.request.contextPath}/student/login">

                    Student Login

                </a>


            </div>


        </section>



        <!-- FEATURES TITLE -->

        <div class="features-title">

            <h3>
                Everything You Need
            </h3>


            <p>
                Manage your PG accommodation from one place.
            </p>

        </div>



        <!-- FEATURES -->

        <div class="features">


            <!-- STUDENT -->

            <div class="feature">

                <div class="feature-icon">
                    👤
                </div>

                <h3>
                    Student Management
                </h3>

                <p>
                    Manage student registration,
                    profiles and records.
                </p>

            </div>


            <!-- PROPERTY -->

            <div class="feature">

                <div class="feature-icon">
                    🏢
                </div>

                <h3>
                    Property Management
                </h3>

                <p>
                    Manage PG properties and
                    owner information.
                </p>

            </div>


            <!-- ROOM -->

            <div class="feature">

                <div class="feature-icon">
                    🏠
                </div>

                <h3>
                    Room Management
                </h3>

                <p>
                    Manage rooms, capacity,
                    sharing type and rent.
                </p>

            </div>


            <!-- ALLOCATION -->

            <div class="feature">

                <div class="feature-icon">
                    🔑
                </div>

                <h3>
                    Room Allocation
                </h3>

                <p>
                    Allocate rooms to students
                    and track occupancy.
                </p>

            </div>


            <!-- PAYMENTS -->

            <div class="feature">

                <div class="feature-icon">
                    💳
                </div>

                <h3>
                    Rent Payments
                </h3>

                <p>
                    Track rent payments,
                    pending and completed dues.
                </p>

            </div>


            <!-- COMPLAINTS -->

            <div class="feature">

                <div class="feature-icon">
                    📋
                </div>

                <h3>
                    Complaints
                </h3>

                <p>
                    Submit and track student
                    complaints and their status.
                </p>

            </div>


            <!-- VISITORS -->

            <div class="feature">

                <div class="feature-icon">
                    👥
                </div>

                <h3>
                    Visitor Management
                </h3>

                <p>
                    Maintain visitor entry
                    and exit records.
                </p>

            </div>


            <!-- SECURITY -->

            <div class="feature">

                <div class="feature-icon">
                    🔒
                </div>

                <h3>
                    Secure Access
                </h3>

                <p>
                    Separate admin and student
                    access for better security.
                </p>

            </div>


            <!-- DASHBOARD -->

            <div class="feature">

                <div class="feature-icon">
                    📊
                </div>

                <h3>
                    Smart Dashboard
                </h3>

                <p>
                    View important PG information
                    through organized dashboards.
                </p>

            </div>


        </div>



        <!-- FOOTER -->

        <div class="home-footer">

            <p>

                © 2026 PGHub —
                Student Accommodation Management System

            </p>

        </div>


    </main>


</div>


</body>

</html>