<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>My Profile - PGHub</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/style.css">

    <style>

        /* =====================================================
           PGHUB STUDENT SIDEBAR
           ===================================================== */

        .sidebar {
            width: 250px;
            min-height: 100vh;
            background: linear-gradient(
                180deg,
                #0f3d73 0%,
                #082b52 100%
            );
            color: white;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            overflow-y: auto;
            z-index: 1000;
        }

        .logo-section {
            height: 112px;
            padding: 15px 18px;
            border-bottom: 1px solid rgba(255,255,255,0.15);
            display: flex;
            align-items: center;
            overflow: hidden;
        }

        .logo-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            width: 100%;
            min-width: 0;
        }

        .logo-icon {
            width: 58px !important;
            height: 58px !important;
            min-width: 58px !important;
            min-height: 58px !important;
            max-width: 58px !important;
            max-height: 58px !important;
            flex: 0 0 58px !important;

            display: flex;
            align-items: center;
            justify-content: center;

            overflow: hidden;
            background: transparent;
            border: none;
            box-shadow: none;
            border-radius: 0;

            padding: 0 !important;
            margin: 0 !important;
        }

        .logo-icon img {
            width: 58px !important;
            height: 58px !important;
            min-width: 58px !important;
            min-height: 58px !important;
            max-width: 58px !important;
            max-height: 58px !important;

            object-fit: contain;
            object-position: center;

            display: block !important;

            margin: 0 !important;
            padding: 0 !important;
        }

        .logo-text {
            min-width: 0;
            overflow: hidden;
        }

        .logo-text h2 {
            margin: 0 0 3px 0;
            font-size: 20px;
            font-weight: 700;
            color: white;
            white-space: nowrap;
        }

        .logo-text span {
            display: block;
            font-size: 13px;
            color: #cbd5e1;
            white-space: nowrap;
        }

        .sidebar-menu {
            padding: 20px 12px;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            gap: 14px;

            padding: 12px 14px;
            margin: 4px 0;

            color: #e2e8f0;
            text-decoration: none;

            border-radius: 8px;
            font-size: 14px;

            transition: all 0.2s ease;
        }

        .sidebar-menu a:hover {
            background: rgba(255,255,255,0.12);
            color: white;
            transform: translateX(3px);
        }

        .sidebar-menu a.active {
            background: rgba(255,255,255,0.16);
            color: white;
        }

        .menu-icon {
            width: 24px;
            min-width: 24px;

            text-align: center;
            font-size: 17px;
            line-height: 1;
        }

        .menu-text {
            white-space: nowrap;
        }

        .sidebar-divider {
            height: 1px;
            background: rgba(255,255,255,0.10);
            margin: 14px 0;
        }

        .sidebar-footer {
            padding: 15px 12px;
            border-top: 1px solid rgba(255,255,255,0.10);
        }

        .sidebar-footer a {
            display: flex;
            align-items: center;
            gap: 14px;

            padding: 12px 14px;

            color: #e2e8f0;
            text-decoration: none;

            border-radius: 8px;
            font-size: 14px;

            transition: all 0.2s ease;
        }

        .sidebar-footer a:hover {
            background: rgba(255,255,255,0.12);
            color: white;
            transform: translateX(3px);
        }

        .main-content {
            margin-left: 250px;
        }


        /* =====================================================
           PROFILE PAGE
           ===================================================== */

        .profile-page {
            max-width: 1100px;
        }


        /* =====================================================
           PROFILE TOP CARD
           ===================================================== */

        .profile-top-card {
            background: linear-gradient(
                135deg,
                #1e3a8a,
                #2563eb
            );

            color: white;

            border-radius: 18px;

            padding: 28px;

            margin-bottom: 25px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.10);
        }

        .profile-top-content {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .profile-avatar-large {
            width: 78px;
            height: 78px;

            border-radius: 50%;

            background: rgba(255,255,255,0.18);

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 32px;
            font-weight: 700;

            flex-shrink: 0;
        }

        .profile-top-card h2 {
            margin: 0 0 6px;
            font-size: 27px;
        }

        .profile-top-card p {
            margin: 4px 0;
            opacity: 0.92;
        }

        .profile-email {
            font-size: 14px;
        }

        .profile-status {
            margin-top: 18px;
        }


        /* =====================================================
           PROFILE GRID
           ===================================================== */

        .profile-grid {
            display: grid;

            grid-template-columns: repeat(2, 1fr);

            gap: 20px;

            margin-bottom: 25px;
        }

        .profile-card {
            background: white;

            border-radius: 16px;

            padding: 24px;

            border: 1px solid #e5e7eb;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.05);

            transition: all 0.3s ease;
        }

        .profile-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }

        .profile-card h3 {
            margin: 0 0 5px;

            color: #1e293b;

            font-size: 19px;
        }

        .profile-card-subtitle {
            color: #64748b;

            font-size: 13px;

            margin: 0 0 18px;
        }


        /* =====================================================
           INFORMATION LIST
           ===================================================== */

        .info-list {
            width: 100%;
        }

        .info-item {
            display: flex;

            justify-content: space-between;

            align-items: flex-start;

            gap: 20px;

            padding: 13px 0;

            border-bottom:
                1px solid #f1f5f9;
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .info-item span {
            color: #64748b;

            font-size: 14px;
        }

        .info-item strong {
            color: #1e293b;

            font-size: 14px;

            text-align: right;

            word-break: break-word;
        }


        /* =====================================================
           PERSONAL DETAILS
           ===================================================== */

        .personal-details-card {
            margin-bottom: 25px;
        }

        .card-heading {
            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 15px;

            margin-bottom: 18px;
        }

        .card-heading h3 {
            margin: 0;

            color: #1e293b;

            font-size: 20px;
        }

        .card-heading p {
            margin: 5px 0 0;

            color: #64748b;

            font-size: 13px;
        }


        /* =====================================================
           QUICK LINKS
           ===================================================== */

        .quick-links-grid {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 18px;

            margin-bottom: 25px;
        }

        .quick-link-card {
            background: white;

            border: 1px solid #e5e7eb;

            border-radius: 16px;

            padding: 22px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.05);

            transition: all 0.3s ease;
        }

        .quick-link-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }

        .quick-link-icon {
            font-size: 28px;

            margin-bottom: 12px;
        }

        .quick-link-card h3 {
            margin: 0 0 7px;

            color: #1e293b;

            font-size: 17px;
        }

        .quick-link-card p {
            margin: 0 0 16px;

            color: #64748b;

            font-size: 13px;

            line-height: 1.5;
        }


        /* =====================================================
           PROFILE NOTICE
           ===================================================== */

        .profile-notice {
            background: #eff6ff;

            border: 1px solid #dbeafe;

            border-radius: 14px;

            padding: 18px 20px;

            margin-bottom: 25px;
        }

        .profile-notice h3 {
            margin: 0 0 7px;

            color: #1e3a8a;

            font-size: 16px;
        }

        .profile-notice p {
            margin: 0;

            color: #475569;

            line-height: 1.6;

            font-size: 14px;
        }


        /* =====================================================
           STATUS
           ===================================================== */

        .status-badge {
            display: inline-flex;

            align-items: center;

            justify-content: center;

            padding: 6px 13px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: 600;
        }

        .status-success {
            background: #dcfce7;

            color: #15803d;

            border: 1px solid #bbf7d0;
        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 1100px) {

            .quick-links-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }
        }

        @media (max-width: 900px) {

            .sidebar {
                width: 210px;
            }

            .main-content {
                margin-left: 210px;
            }
        }

        @media (max-width: 700px) {

            .sidebar {
                position: relative;

                width: 100%;

                height: auto;

                min-height: auto;
            }

            .main-content {
                margin-left: 0;
            }

            .profile-grid,
            .quick-links-grid {
                grid-template-columns: 1fr;
            }

            .profile-top-content {
                align-items: flex-start;
            }

            .profile-avatar-large {
                width: 62px;

                height: 62px;

                font-size: 25px;
            }

            .profile-top-card h2 {
                font-size: 22px;
            }

            .info-item {
                flex-direction: column;

                gap: 5px;
            }

            .info-item strong {
                text-align: left;
            }

            .card-heading {
                flex-direction: column;

                align-items: flex-start;
            }
        }

    </style>

</head>


<body>

<div class="app-layout">


    <!-- ================= SIDEBAR ================= -->

    <aside class="sidebar">


        <!-- PGHUB LOGO -->

        <div class="logo-section">

            <div class="logo-brand">

                <div class="logo-icon">

                    <img
                        src="${pageContext.request.contextPath}/images/pghub_logo_icon.png"
                        alt="PGHub Logo">

                </div>

                <div class="logo-text">

                    <h2>PGHub</h2>

                    <span>Student Portal</span>

                </div>

            </div>

        </div>


        <!-- SIDEBAR MENU -->

        <nav class="sidebar-menu">


            <!-- DASHBOARD -->

            <a href="${pageContext.request.contextPath}/student/dashboard">

                <span class="menu-icon">
                    🏠
                </span>

                <span class="menu-text">
                    Dashboard
                </span>

            </a>


            <!-- MY PROFILE -->

            <a class="active"
               href="${pageContext.request.contextPath}/student/profile">

                <span class="menu-icon">
                    👤
                </span>

                <span class="menu-text">
                    My Profile
                </span>

            </a>


            <!-- MY ALLOCATION -->

            <a href="${pageContext.request.contextPath}/allocation/my">

                <span class="menu-icon">
                    🛏️
                </span>

                <span class="menu-text">
                    My Allocation
                </span>

            </a>


            <!-- MY PAYMENTS -->

            <a href="${pageContext.request.contextPath}/payment/my">

                <span class="menu-icon">
                    💰
                </span>

                <span class="menu-text">
                    My Payments
                </span>

            </a>


            <!-- MY COMPLAINTS -->

            <a href="${pageContext.request.contextPath}/complaint/my">

                <span class="menu-icon">
                    📝
                </span>

                <span class="menu-text">
                    My Complaints
                </span>

            </a>


            <!-- MY VISITORS -->

            <a href="${pageContext.request.contextPath}/visitor/my">

                <span class="menu-icon">
                    👥
                </span>

                <span class="menu-text">
                    My Visitors
                </span>

            </a>


        </nav>


        <!-- SIDEBAR FOOTER -->

        <div class="sidebar-footer">

            <a href="${pageContext.request.contextPath}/student/logout">

                <span class="menu-icon">
                    🚪
                </span>

                <span class="menu-text">
                    Logout
                </span>

            </a>

        </div>


    </aside>


    <!-- ================= MAIN CONTENT ================= -->

    <main class="main-content">


        <!-- ================= TOP HEADER ================= -->

        <header class="top-header">

            <div>

                <h1>
                    My Profile
                </h1>

                <p>
                    View and manage your personal information
                </p>

            </div>


            <div class="header-user">

                <div class="user-avatar">
                    👤
                </div>

                <div>

                    <strong>
                        ${sessionScope.studentName}
                    </strong>

                    <small>
                        Student
                    </small>

                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="content-area profile-page">


            <!-- ================= PROFILE HEADER ================= -->

            <div class="profile-top-card">

                <div class="profile-top-content">

                    <div class="profile-avatar-large">

                        <c:choose>

                            <c:when test="${not empty student.name}">

                                ${student.name.substring(0,1).toUpperCase()}

                            </c:when>

                            <c:otherwise>

                                S

                            </c:otherwise>

                        </c:choose>

                    </div>


                    <div>

                        <h2>
                            ${student.name}
                        </h2>

                        <p>
                            Student
                        </p>

                        <p class="profile-email">

                            📧 ${student.email}

                        </p>

                    </div>

                </div>


                <div class="profile-status">

                    <span class="status-badge status-success">

                        ● Active Account

                    </span>

                </div>

            </div>


            <!-- ================= ACCOUNT INFORMATION ================= -->

            <div class="profile-grid">


                <div class="profile-card">

                    <h3>
                        Account Information
                    </h3>

                    <p class="profile-card-subtitle">

                        Basic account details

                    </p>


                    <div class="info-list">


                        <div class="info-item">

                            <span>
                                Student ID
                            </span>

                            <strong>

                                #${student.id}

                            </strong>

                        </div>


                        <div class="info-item">

                            <span>
                                Account Type
                            </span>

                            <strong>
                                Student
                            </strong>

                        </div>


                        <div class="info-item">

                            <span>
                                Email
                            </span>

                            <strong>

                                ${student.email}

                            </strong>

                        </div>


                    </div>

                </div>


                <div class="profile-card">

                    <h3>
                        Profile Status
                    </h3>

                    <p class="profile-card-subtitle">

                        Current account information

                    </p>


                    <div class="info-list">


                        <div class="info-item">

                            <span>
                                Status
                            </span>

                            <strong>
                                Active
                            </strong>

                        </div>


                        <div class="info-item">

                            <span>
                                Student Name
                            </span>

                            <strong>

                                ${student.name}

                            </strong>

                        </div>


                        <div class="info-item">

                            <span>
                                Registered Email
                            </span>

                            <strong>

                                ${student.email}

                            </strong>

                        </div>


                    </div>

                </div>


            </div>


            <!-- ================= PERSONAL DETAILS ================= -->

            <div class="profile-card personal-details-card">


                <div class="card-heading">

                    <div>

                        <h3>
                            Personal Details
                        </h3>

                        <p>
                            Your registered personal information
                        </p>

                    </div>


                    <a href="${pageContext.request.contextPath}/student/edit?id=${student.id}"
                       class="btn btn-primary">

                        ✏️ Edit Profile

                    </a>

                </div>


                <div class="info-list">


                    <div class="info-item">

                        <span>
                            Full Name
                        </span>

                        <strong>

                            ${student.name}

                        </strong>

                    </div>


                    <div class="info-item">

                        <span>
                            Email Address
                        </span>

                        <strong>

                            ${student.email}

                        </strong>

                    </div>


                    <div class="info-item">

                        <span>
                            Mobile Number
                        </span>

                        <strong>

                            ${student.mobile}

                        </strong>

                    </div>


                    <div class="info-item">

                        <span>
                            Guardian Mobile
                        </span>

                        <strong>

                            <c:choose>

                                <c:when test="${not empty student.guardianMobile}">

                                    ${student.guardianMobile}

                                </c:when>

                                <c:otherwise>

                                    Not Provided

                                </c:otherwise>

                            </c:choose>

                        </strong>

                    </div>


                    <div class="info-item">

                        <span>
                            Address
                        </span>

                        <strong>

                            <c:choose>

                                <c:when test="${not empty student.address}">

                                    ${student.address}

                                </c:when>

                                <c:otherwise>

                                    Not Provided

                                </c:otherwise>

                            </c:choose>

                        </strong>

                    </div>


                    <div class="info-item">

                        <span>
                            ID Proof
                        </span>

                        <strong>

                            <c:choose>

                                <c:when test="${not empty student.idProof}">

                                    ${student.idProof}

                                </c:when>

                                <c:otherwise>

                                    Not Provided

                                </c:otherwise>

                            </c:choose>

                        </strong>

                    </div>


                </div>


            </div>


            <!-- ================= QUICK LINKS ================= -->

            <div class="quick-links-grid">


                <div class="quick-link-card">

                    <div class="quick-link-icon">
                        🛏️
                    </div>

                    <h3>
                        My Room
                    </h3>

                    <p>
                        View your current room allocation.
                    </p>

                    <a href="${pageContext.request.contextPath}/allocation/my"
                       class="btn btn-secondary">

                        View Allocation →

                    </a>

                </div>


                <div class="quick-link-card">

                    <div class="quick-link-icon">
                        💰
                    </div>

                    <h3>
                        My Payments
                    </h3>

                    <p>
                        View your rent payment history.
                    </p>

                    <a href="${pageContext.request.contextPath}/payment/my"
                       class="btn btn-secondary">

                        View Payments →

                    </a>

                </div>


                <div class="quick-link-card">

                    <div class="quick-link-icon">
                        📝
                    </div>

                    <h3>
                        My Complaints
                    </h3>

                    <p>
                        Track your submitted complaints.
                    </p>

                    <a href="${pageContext.request.contextPath}/complaint/my"
                       class="btn btn-secondary">

                        View Complaints →

                    </a>

                </div>


                <div class="quick-link-card">

                    <div class="quick-link-icon">
                        👥
                    </div>

                    <h3>
                        My Visitors
                    </h3>

                    <p>
                        Manage your visitor records.
                    </p>

                    <a href="${pageContext.request.contextPath}/visitor/my"
                       class="btn btn-secondary">

                        View Visitors →

                    </a>

                </div>


            </div>


            <!-- ================= INFORMATION NOTICE ================= -->

            <div class="profile-notice">

                <h3>
                    💡 Profile Information
                </h3>

                <p>

                    Keep your personal information updated.

                    Your registered details are used for room
                    allocation, payments, complaints and visitor
                    management.

                </p>

            </div>


        </section>


        <!-- ================= FOOTER ================= -->

        <footer class="footer">

            <p>

                © 2026 PGHub -
                Student PG & Room Management System

            </p>

        </footer>


    </main>

</div>


</body>

</html>