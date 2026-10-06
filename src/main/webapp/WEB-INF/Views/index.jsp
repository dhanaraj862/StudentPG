<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

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

            background: #f5f7fb;

            color: #1e293b;

        }


        /* =========================================
           MAIN HOME LAYOUT
        ========================================= */

        .home-wrapper {

            min-height: 100vh;

            display: flex;

            background: #ffffff;

        }


        /* =========================================
           LEFT BRANDING SECTION
           BUILDING IMAGE AS BACKGROUND
        ========================================= */

        .branding-section {

            width: 42%;

            min-height: 100vh;

            position: relative;

            overflow: hidden;

            padding: 55px 55px;

            color: #ffffff;

            display: flex;

            flex-direction: column;

            background-image:

                linear-gradient(
                    180deg,
                    rgba(5, 25, 65, 0.78) 0%,
                    rgba(20, 32, 88, 0.62) 45%,
                    rgba(8, 15, 42, 0.90) 100%
                ),

                url("${pageContext.request.contextPath}/images/pg-building.jpg");

            background-size: cover;

            background-position: center;

            background-repeat: no-repeat;

        }


        /* =========================================
           PURPLE / BLUE LIGHT EFFECT
        ========================================= */

        .branding-section::before {

            content: "";

            position: absolute;

            width: 350px;

            height: 350px;

            top: -150px;

            right: -150px;

            border-radius: 50%;

            background:
                rgba(124, 58, 237, 0.22);

            filter: blur(10px);

            z-index: 0;

        }


        .branding-section::after {

            content: "";

            position: absolute;

            width: 300px;

            height: 300px;

            bottom: -150px;

            left: -120px;

            border-radius: 50%;

            background:
                rgba(37, 99, 235, 0.25);

            filter: blur(15px);

            z-index: 0;

        }


        /* =========================================
           LOGO / BRAND
        ========================================= */

        .brand-logo {

            position: relative;

            z-index: 2;

            display: flex;

            align-items: center;

            gap: 15px;

        }


        .brand-logo img {

            width: 68px;

            height: 68px;

            object-fit: contain;

            display: block;

        }


        .brand-name h1 {

            font-size: 31px;

            font-weight: 800;

            color: #ffffff;

            margin-bottom: 4px;

            text-shadow:
                0 2px 8px rgba(0, 0, 0, 0.45);

        }


        .brand-name p {

            font-size: 13px;

            font-weight: 600;

            color: #ffffff;

            letter-spacing: 0.5px;

            text-shadow:
                0 2px 6px rgba(0, 0, 0, 0.50);

        }


        /* =========================================
           BRANDING CONTENT
        ========================================= */

        .brand-content {

            position: relative;

            z-index: 2;

            margin-top: 85px;

            max-width: 470px;

        }


        .brand-content h2 {

            font-size: 43px;

            line-height: 1.15;

            font-weight: 800;

            color: #ffffff;

            margin-bottom: 22px;

            text-shadow:
                0 3px 12px rgba(0, 0, 0, 0.55);

        }


        .brand-content h2 span {

            display: block;

            color: #ffffff;

        }


        .brand-content p {

            max-width: 390px;

            font-size: 16px;

            line-height: 1.7;

            font-weight: 600;

            color: #ffffff;

            text-shadow:
                0 2px 8px rgba(0, 0, 0, 0.65);

        }


        /* =========================================
           EXTRA BRANDING
        ========================================= */

        .brand-tagline {

            position: relative;

            z-index: 2;

            margin-top: 30px;

            padding-left: 15px;

            border-left: 4px solid #60a5fa;

            max-width: 390px;

            color: #ffffff;

            font-size: 13px;

            font-weight: 600;

            line-height: 1.6;

            text-shadow:
                0 2px 6px rgba(0, 0, 0, 0.55);

        }


        /* =========================================
           RIGHT CONTENT SECTION
        ========================================= */

        .content-section {

            width: 58%;

            min-height: 100vh;

            padding: 55px 60px;

            background: #ffffff;

            overflow-y: auto;

        }


        /* =========================================
           RIGHT HEADER
        ========================================= */

        .content-header {

            text-align: center;

            margin-bottom: 38px;

        }


        .content-header h2 {

            font-size: 34px;

            font-weight: 700;

            color: #172554;

            margin-bottom: 12px;

        }


        .content-header h2 span {

            background:
                linear-gradient(
                    90deg,
                    #2563eb,
                    #4f46e5,
                    #7c3aed
                );

            -webkit-background-clip: text;

            -webkit-text-fill-color: transparent;

        }


        .content-header p {

            max-width: 650px;

            margin: auto;

            color: #64748b;

            font-size: 15px;

            line-height: 1.6;

        }


        /* =========================================
           BUTTONS
        ========================================= */

        .buttons {

            display: flex;

            justify-content: center;

            align-items: center;

            gap: 15px;

            margin-bottom: 40px;

            flex-wrap: wrap;

        }


        .btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            padding: 13px 24px;

            border-radius: 9px;

            text-decoration: none;

            font-size: 14px;

            font-weight: 600;

            transition:
                all 0.25s ease;

        }


        .btn-primary {

            color: #ffffff;

            background:
                linear-gradient(
                    135deg,
                    #2563eb,
                    #4f46e5,
                    #7c3aed
                );

            box-shadow:
                0 7px 20px
                rgba(79, 70, 229, 0.25);

        }


        .btn-primary:hover {

            transform:
                translateY(-2px);

            box-shadow:
                0 10px 25px
                rgba(79, 70, 229, 0.35);

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
           FEATURES
        ========================================= */

        .features {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 18px;

        }


        .feature {

            background: #ffffff;

            padding: 22px;

            border-radius: 13px;

            border: 1px solid #e2e8f0;

            box-shadow:
                0 5px 18px
                rgba(15, 23, 42, 0.06);

            transition:
                all 0.25s ease;

        }


        .feature:hover {

            transform:
                translateY(-4px);

            border-color: #c4b5fd;

            box-shadow:
                0 10px 25px
                rgba(79, 70, 229, 0.12);

        }


        /* =========================================
           FEATURE ICON
        ========================================= */

        .feature-icon {

            width: 42px;

            height: 42px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 10px;

            margin-bottom: 14px;

            font-size: 20px;

            background:
                linear-gradient(
                    135deg,
                    #dbeafe,
                    #ede9fe
                );

        }


        .feature h3 {

            font-size: 16px;

            color: #1e293b;

            margin-bottom: 8px;

        }


        .feature p {

            font-size: 13px;

            line-height: 1.6;

            color: #64748b;

        }


        /* =========================================
           RESPONSIVE - 1000px
        ========================================= */

        @media (max-width: 1000px) {

            .home-wrapper {

                flex-direction: column;

            }


            .branding-section {

                width: 100%;

                min-height: 620px;

                padding: 45px 45px;

            }


            .content-section {

                width: 100%;

                min-height: auto;

                padding: 45px;

            }


            .brand-content {

                margin-top: 60px;

            }

        }


        /* =========================================
           RESPONSIVE - 650px
        ========================================= */

        @media (max-width: 650px) {

            .branding-section {

                min-height: 600px;

                padding: 35px 25px;

            }


            .brand-logo img {

                width: 58px;

                height: 58px;

            }


            .brand-name h1 {

                font-size: 26px;

            }


            .brand-name p {

                font-size: 12px;

            }


            .brand-content {

                margin-top: 55px;

            }


            .brand-content h2 {

                font-size: 34px;

            }


            .brand-content p {

                font-size: 14px;

            }


            .content-section {

                padding: 35px 20px;

            }


            .content-header h2 {

                font-size: 28px;

            }


            .content-header p {

                font-size: 14px;

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

            .branding-section {

                padding: 30px 20px;

            }


            .brand-content h2 {

                font-size: 30px;

            }


            .content-section {

                padding: 30px 15px;

            }

        }

    </style>

</head>


<body>


    <!-- =========================================
         MAIN HOME PAGE
    ========================================= -->

    <div class="home-wrapper">


        <!-- =====================================
             LEFT BRANDING SECTION
        ====================================== -->

        <section class="branding-section">


            <!-- PGHub Logo -->

            <div class="brand-logo">

                <img
                    src="${pageContext.request.contextPath}/images/pghub_logo_icon.png"
                    alt="PGHub Logo">


                <div class="brand-name">

                    <h1>PGHub</h1>

                    <p>Student Accommodation</p>

                </div>

            </div>


            <!-- Branding Text -->

            <div class="brand-content">

                <h2>

                    Better Stays

                    <span>
                        Brighter Futures
                    </span>

                </h2>


                <p>

                    Find your perfect PG with comfort,
                    security and peace of mind.

                </p>

            </div>


            <!-- Additional Branding -->

            <div class="brand-tagline">

                Safe Living • Comfortable Rooms •
                Better Student Experience

            </div>


        </section>



        <!-- =====================================
             RIGHT SIDE
             ORIGINAL HOME PAGE CONTENT
        ====================================== -->

        <section class="content-section">


            <!-- Welcome -->

            <div class="content-header">

                <h2>

                    Welcome to
                    <span>PGHub</span>

                </h2>


                <p>

                    Manage students, PG properties, rooms,
                    allocations, payments, complaints and
                    visitors from one system.

                </p>

            </div>



            <!-- Original Buttons -->

            <div class="buttons">


                <a
                    class="btn btn-primary"
                    href="${pageContext.request.contextPath}/admin/dashboard">

                    Admin Dashboard

                </a>


                <a
                    class="btn btn-secondary"
                    href="${pageContext.request.contextPath}/student/list">

                    Student Management

                </a>


            </div>



            <!-- =====================================
                 FEATURES
            ====================================== -->

            <div class="features">


                <!-- Student Management -->

                <div class="feature">

                    <div class="feature-icon">
                        👨‍🎓
                    </div>

                    <h3>
                        Student Management
                    </h3>

                    <p>

                        Add, view, update and delete
                        student records.

                    </p>

                </div>



                <!-- Property & Room -->

                <div class="feature">

                    <div class="feature-icon">
                        🏢
                    </div>

                    <h3>
                        Property & Room
                    </h3>

                    <p>

                        Manage PG properties and
                        room information.

                    </p>

                </div>



                <!-- Room Allocation -->

                <div class="feature">

                    <div class="feature-icon">
                        🛏️
                    </div>

                    <h3>
                        Room Allocation
                    </h3>

                    <p>

                        Manage student room
                        allocation records.

                    </p>

                </div>



                <!-- Rent Payments -->

                <div class="feature">

                    <div class="feature-icon">
                        💰
                    </div>

                    <h3>
                        Rent Payments
                    </h3>

                    <p>

                        Manage rent payment and
                        pending payment records.

                    </p>

                </div>



                <!-- Complaints -->

                <div class="feature">

                    <div class="feature-icon">
                        📋
                    </div>

                    <h3>
                        Complaints
                    </h3>

                    <p>

                        Manage and track
                        student complaints.

                    </p>

                </div>



                <!-- Visitors -->

                <div class="feature">

                    <div class="feature-icon">
                        👥
                    </div>

                    <h3>
                        Visitors
                    </h3>

                    <p>

                        Maintain visitor entry
                        and exit records.

                    </p>

                </div>


            </div>


        </section>


    </div>


</body>

</html>