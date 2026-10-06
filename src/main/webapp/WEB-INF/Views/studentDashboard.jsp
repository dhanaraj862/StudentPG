<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Student Dashboard - PGHub</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/style.css">


    <style>

        /* =====================================================
           PGHUB STUDENT SIDEBAR
           Same design as Admin Sidebar
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

        .logout-link {
            color: #e2e8f0 !important;
        }

        .logout-link:hover {
            background: rgba(255,255,255,0.12) !important;
            color: white !important;
        }


        /* =====================================================
           MAIN CONTENT ALIGNMENT
           ===================================================== */

        .main-content {
            margin-left: 250px;
        }


        /* =====================================================
           WELCOME CARD
           ===================================================== */

        .welcome-card {
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

        .welcome-card h2 {
            margin: 0 0 8px;
            font-size: 28px;
        }

        .welcome-card p {
            margin: 5px 0;
            opacity: 0.92;
        }

        .welcome-email {
            font-size: 14px;
        }


        /* =====================================================
           STUDENT STATISTICS
           ===================================================== */

        .student-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .student-stat-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 22px;

            box-shadow:
                0 5px 20px rgba(0,0,0,0.07);

            border: 1px solid #e5e7eb;

            transition: all 0.3s ease;
        }

        .student-stat-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }

        .student-stat-icon {
            width: 48px;
            height: 48px;

            border-radius: 12px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 22px;

            background: #eff6ff;

            margin-bottom: 14px;
        }

        .student-stat-card h3 {
            margin: 0;
            font-size: 28px;
            color: #1e293b;
        }

        .student-stat-card p {
            margin: 5px 0 0;
            color: #64748b;
            font-size: 14px;
        }


        /* =====================================================
           SECTIONS
           ===================================================== */

        .dashboard-section {
            margin-bottom: 30px;
        }

        .section-title {
            margin-bottom: 18px;
        }

        .section-title h2 {
            margin: 0;
            color: #1e293b;
            font-size: 22px;
        }

        .section-title p {
            margin: 5px 0 0;
            color: #64748b;
            font-size: 14px;
        }


        /* =====================================================
           QUICK ACTIONS
           ===================================================== */

        .quick-action-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
        }

        .quick-action-card {
            background: white;

            border: 1px solid #e5e7eb;
            border-radius: 16px;

            padding: 22px;

            text-decoration: none;

            transition: all 0.3s ease;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.05);
        }

        .quick-action-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }

        .quick-icon {
            font-size: 28px;
            margin-bottom: 12px;
        }

        .quick-action-card h3 {
            margin: 0 0 6px;
            color: #1e293b;
            font-size: 17px;
        }

        .quick-action-card p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
        }


        /* =====================================================
           INFORMATION GRID
           ===================================================== */

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .info-card {
            background: white;
            border-radius: 16px;

            padding: 24px;

            border: 1px solid #e5e7eb;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.05);

            transition: all 0.3s ease;
        }

        .info-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }

        .info-card h3 {
            margin-top: 0;
            color: #1e293b;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            gap: 15px;

            padding: 11px 0;

            border-bottom:
                1px solid #f1f5f9;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            color: #64748b;
        }

        .info-value {
            color: #1e293b;
            font-weight: 600;
            text-align: right;
        }


        /* =====================================================
           STATUS CARDS
           ===================================================== */

        .status-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);

            gap: 20px;

            margin-bottom: 30px;
        }

        .status-card {
            background: white;

            border-radius: 16px;

            padding: 22px;

            border: 1px solid #e5e7eb;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.05);

            transition: all 0.3s ease;
        }

        .status-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }

        .status-card-header {
            display: flex;
            align-items: center;

            gap: 12px;

            margin-bottom: 16px;
        }

        .status-card-icon {
            width: 45px;
            height: 45px;

            border-radius: 12px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 21px;

            background: #eff6ff;
        }

        .status-card h3 {
            margin: 0;
            color: #1e293b;
            font-size: 17px;
        }

        .status-card p {
            margin: 4px 0 0;
            color: #64748b;
            font-size: 13px;
        }

        .status-number {
            font-size: 28px;

            font-weight: 700;

            color: #1e293b;

            margin-bottom: 8px;
        }


        /* =====================================================
           ROOM CARD
           ===================================================== */

        .room-card {
            background: white;

            border-radius: 18px;

            padding: 25px;

            border: 1px solid #e5e7eb;

            box-shadow:
                0 5px 20px rgba(0,0,0,0.06);

            margin-bottom: 30px;

            transition: all 0.3s ease;
        }

        .room-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }

        .room-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;

            margin-bottom: 20px;
        }

        .room-card-header h2 {
            margin: 0;
            color: #1e293b;
            font-size: 21px;
        }

        .room-details {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
        }

        .room-detail {
            background: #f8fafc;

            border-radius: 12px;

            padding: 16px;

            border: 1px solid #eef2f7;
        }

        .room-detail span {
            display: block;

            color: #64748b;

            font-size: 13px;

            margin-bottom: 6px;
        }

        .room-detail strong {
            color: #1e293b;
            font-size: 16px;
        }

        .no-room {
            padding: 25px;

            text-align: center;

            background: #f8fafc;

            border-radius: 12px;

            color: #64748b;
        }


        /* =====================================================
           STATUS BADGE
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

        .status-active {
            background: #dcfce7;
            color: #15803d;
            border: 1px solid #bbf7d0;
        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 1100px) {

            .student-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .status-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .quick-action-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .room-details {
                grid-template-columns: repeat(2, 1fr);
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

            .student-stats,
            .status-grid,
            .quick-action-grid,
            .info-grid,
            .room-details {
                grid-template-columns: 1fr;
            }

            .welcome-card h2 {
                font-size: 22px;
            }

            .info-row {
                flex-direction: column;
                gap: 4px;
            }

            .info-value {
                text-align: left;
            }

            .room-card-header {
                flex-direction: column;

                align-items: flex-start;

                gap: 10px;
            }
        }

    </style>

</head>


<body>

<div class="app-layout">


    <!-- =====================================================
         SIDEBAR
         ===================================================== -->

    <aside class="sidebar">

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


        <nav class="sidebar-menu">


            <!-- DASHBOARD -->

            <a href="${pageContext.request.contextPath}/student/dashboard"
               class="active">

                <span class="menu-icon">🏠</span>

                <span class="menu-text">
                    Dashboard
                </span>

            </a>


            <!-- PROFILE -->

            <a href="${pageContext.request.contextPath}/student/profile">

                <span class="menu-icon">👤</span>

                <span class="menu-text">
                    My Profile
                </span>

            </a>


            <!-- ALLOCATION -->

            <a href="${pageContext.request.contextPath}/allocation/my">

                <span class="menu-icon">🛏️</span>

                <span class="menu-text">
                    My Allocation
                </span>

            </a>


            <!-- PAYMENTS -->

            <a href="${pageContext.request.contextPath}/payment/my">

                <span class="menu-icon">💰</span>

                <span class="menu-text">
                    My Payments
                </span>

            </a>


            <!-- COMPLAINTS -->

            <a href="${pageContext.request.contextPath}/complaint/my">

                <span class="menu-icon">📝</span>

                <span class="menu-text">
                    My Complaints
                </span>

            </a>


            <!-- VISITORS -->

            <a href="${pageContext.request.contextPath}/visitor/my">

                <span class="menu-icon">👥</span>

                <span class="menu-text">
                    My Visitors
                </span>

            </a>


            <div class="sidebar-divider"></div>


            <!-- LOGOUT -->

            <a href="${pageContext.request.contextPath}/student/logout"
               class="logout-link">

                <span class="menu-icon">🚪</span>

                <span class="menu-text">
                    Logout
                </span>

            </a>


        </nav>

    </aside>


    <!-- =====================================================
         MAIN CONTENT
         ===================================================== -->

    <main class="main-content">


        <!-- =================================================
             TOP HEADER
             ================================================= -->

        <header class="top-header">

            <div>

                <h1>
                    Student Dashboard
                </h1>

                <p>
                    Manage your PG accommodation
                    and stay information
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


        <!-- =================================================
             CONTENT
             ================================================= -->

        <div class="content-area">


            <!-- =================================================
                 WELCOME
                 ================================================= -->

            <div class="welcome-card">

                <h2>
                    Welcome,
                    ${student.name}! 👋
                </h2>

                <p>
                    Welcome to your PGHub Student Portal.
                    Here you can manage your accommodation,
                    room allocation, payments, complaints
                    and visitors.
                </p>

                <p class="welcome-email">
                    📧 ${student.email}
                </p>

            </div>


            <!-- =================================================
                 STATISTICS
                 ================================================= -->

            <div class="student-stats">


                <div class="student-stat-card">

                    <div class="student-stat-icon">
                        🏠
                    </div>

                    <h3>
                        ${totalAllocations}
                    </h3>

                    <p>
                        Total Allocations
                    </p>

                </div>


                <div class="student-stat-card">

                    <div class="student-stat-icon">
                        💰
                    </div>

                    <h3>
                        ${totalPayments}
                    </h3>

                    <p>
                        Payment Records
                    </p>

                </div>


                <div class="student-stat-card">

                    <div class="student-stat-icon">
                        📋
                    </div>

                    <h3>
                        ${totalComplaints}
                    </h3>

                    <p>
                        My Complaints
                    </p>

                </div>


                <div class="student-stat-card">

                    <div class="student-stat-icon">
                        👥
                    </div>

                    <h3>
                        ${totalVisitors}
                    </h3>

                    <p>
                        Total Visitors
                    </p>

                </div>


            </div>


            <!-- =================================================
                 CURRENT STATUS
                 ================================================= -->

            <section class="dashboard-section">

                <div class="section-title">

                    <h2>
                        Current Status
                    </h2>

                    <p>
                        Overview of your current PG activities.
                    </p>

                </div>


                <div class="status-grid">


                    <!-- ROOM STATUS -->

                    <div class="status-card">

                        <div class="status-card-header">

                            <div class="status-card-icon">
                                🏠
                            </div>

                            <div>

                                <h3>
                                    Room
                                </h3>

                                <p>
                                    Current allocation
                                </p>

                            </div>

                        </div>


                        <div class="status-number">

                            <c:choose>

                                <c:when test="${not empty currentRoom}">

                                    ${currentRoom.roomNumber}

                                </c:when>

                                <c:otherwise>

                                    Not Allocated

                                </c:otherwise>

                            </c:choose>

                        </div>


                        <p>

                            <c:choose>

                                <c:when test="${not empty currentRoom}">

                                    ${currentRoom.sharingType}

                                </c:when>

                                <c:otherwise>

                                    No active room

                                </c:otherwise>

                            </c:choose>

                        </p>

                    </div>


                    <!-- PAYMENT STATUS -->

                    <div class="status-card">

                        <div class="status-card-header">

                            <div class="status-card-icon">
                                💰
                            </div>

                            <div>

                                <h3>
                                    Payments
                                </h3>

                                <p>
                                    Pending payments
                                </p>

                            </div>

                        </div>


                        <div class="status-number">
                            ${pendingPayments}
                        </div>


                        <p>
                            Pending payment records
                        </p>

                    </div>


                    <!-- COMPLAINT STATUS -->

                    <div class="status-card">

                        <div class="status-card-header">

                            <div class="status-card-icon">
                                📋
                            </div>

                            <div>

                                <h3>
                                    Complaints
                                </h3>

                                <p>
                                    Active complaints
                                </p>

                            </div>

                        </div>


                        <div class="status-number">
                            ${openComplaints}
                        </div>


                        <p>
                            Open / In Progress
                        </p>

                    </div>


                    <!-- VISITOR STATUS -->

                    <div class="status-card">

                        <div class="status-card-header">

                            <div class="status-card-icon">
                                👥
                            </div>

                            <div>

                                <h3>
                                    Visitors
                                </h3>

                                <p>
                                    Currently active
                                </p>

                            </div>

                        </div>


                        <div class="status-number">
                            ${activeVisitors}
                        </div>


                        <p>
                            Visitor(s) currently inside
                        </p>

                    </div>


                </div>

            </section>


            <!-- =================================================
                 CURRENT ROOM
                 ================================================= -->

            <section class="dashboard-section">


                <div class="section-title">

                    <h2>
                        🏠 Current Room
                    </h2>

                    <p>
                        Details of your active room allocation.
                    </p>

                </div>


                <div class="room-card">


                    <c:choose>


                        <c:when test="${not empty currentRoom}">


                            <div class="room-card-header">

                                <h2>
                                    Room ${currentRoom.roomNumber}
                                </h2>

                                <span class="status-badge status-active">
                                    ${currentRoom.status}
                                </span>

                            </div>


                            <div class="room-details">


                                <div class="room-detail">

                                    <span>
                                        Room Number
                                    </span>

                                    <strong>
                                        ${currentRoom.roomNumber}
                                    </strong>

                                </div>


                                <div class="room-detail">

                                    <span>
                                        Sharing Type
                                    </span>

                                    <strong>
                                        ${currentRoom.sharingType}
                                    </strong>

                                </div>


                                <div class="room-detail">

                                    <span>
                                        Capacity
                                    </span>

                                    <strong>
                                        ${currentRoom.capacity}
                                    </strong>

                                </div>


                                <div class="room-detail">

                                    <span>
                                        Monthly Rent
                                    </span>

                                    <strong>
                                        ₹${currentRoom.rentAmount}
                                    </strong>

                                </div>


                            </div>


                            <div style="margin-top:20px;">

                                <a href="${pageContext.request.contextPath}/allocation/my"
                                   class="btn btn-primary">

                                    View Allocation Details

                                </a>

                            </div>


                        </c:when>


                        <c:otherwise>


                            <div class="no-room">

                                <div style="font-size:40px; margin-bottom:10px;">
                                    🏠
                                </div>

                                <h3>
                                    No Active Room Allocation
                                </h3>

                                <p>
                                    You currently do not have an active
                                    room allocation.
                                </p>

                            </div>


                        </c:otherwise>


                    </c:choose>


                </div>

            </section>


            <!-- =================================================
                 QUICK ACTIONS
                 ================================================= -->

            <section class="dashboard-section">


                <div class="section-title">

                    <h2>
                        Quick Actions
                    </h2>

                    <p>
                        Quickly access your important
                        student services.
                    </p>

                </div>


                <div class="quick-action-grid">


                    <a href="${pageContext.request.contextPath}/student/profile"
                       class="quick-action-card">

                        <div class="quick-icon">
                            👤
                        </div>

                        <h3>
                            My Profile
                        </h3>

                        <p>
                            View and update your personal
                            information.
                        </p>

                    </a>


                    <a href="${pageContext.request.contextPath}/allocation/my"
                       class="quick-action-card">

                        <div class="quick-icon">
                            🏠
                        </div>

                        <h3>
                            My Room
                        </h3>

                        <p>
                            View your current room allocation
                            details.
                        </p>

                    </a>


                    <a href="${pageContext.request.contextPath}/payment/my"
                       class="quick-action-card">

                        <div class="quick-icon">
                            💰
                        </div>

                        <h3>
                            My Payments
                        </h3>

                        <p>
                            View your rent payment history.
                        </p>

                    </a>


                    <a href="${pageContext.request.contextPath}/complaint/student/add"
                       class="quick-action-card">

                        <div class="quick-icon">
                            📋
                        </div>

                        <h3>
                            Submit Complaint
                        </h3>

                        <p>
                            Report maintenance or other issues.
                        </p>

                    </a>


                </div>

            </section>


            <!-- =================================================
                 STUDENT INFORMATION
                 ================================================= -->

            <section class="dashboard-section">


                <div class="section-title">

                    <h2>
                        My Information
                    </h2>

                    <p>
                        Your registered student information.
                    </p>

                </div>


                <div class="info-grid">


                    <!-- PERSONAL INFORMATION -->

                    <div class="info-card">

                        <h3>
                            Personal Information
                        </h3>


                        <div class="info-row">

                            <span class="info-label">
                                Student ID
                            </span>

                            <span class="info-value">
                                ${student.id}
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                Name
                            </span>

                            <span class="info-value">
                                ${student.name}
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                Mobile
                            </span>

                            <span class="info-value">
                                ${student.mobile}
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                Guardian Mobile
                            </span>

                            <span class="info-value">
                                ${student.guardianMobile}
                            </span>

                        </div>


                    </div>


                    <!-- CONTACT INFORMATION -->

                    <div class="info-card">

                        <h3>
                            Contact Information
                        </h3>


                        <div class="info-row">

                            <span class="info-label">
                                Email
                            </span>

                            <span class="info-value">
                                ${student.email}
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                Address
                            </span>

                            <span class="info-value">
                                ${student.address}
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                ID Proof
                            </span>

                            <span class="info-value">
                                ${student.idProof}
                            </span>

                        </div>


                        <div style="margin-top:18px;">

                            <a href="${pageContext.request.contextPath}/student/profile"
                               class="btn btn-primary">

                                Edit Profile

                            </a>

                        </div>


                    </div>


                </div>

            </section>


            <!-- =================================================
                 INFORMATION NOTICE
                 ================================================= -->

            <div class="card"
                 style="margin-bottom:25px;">

                <h3>
                    💡 Student Portal Information
                </h3>

                <p style="color:#64748b; line-height:1.7;">

                    Use the sidebar or quick actions to manage
                    your accommodation information. Your room
                    allocation, payment records, complaints and
                    visitor information are linked to your
                    student account.

                </p>

            </div>


            <!-- =================================================
                 FOOTER
                 ================================================= -->

            <footer class="footer">

                <p>
                    © 2026 PGHub -
                    Student PG & Room Management System
                </p>

            </footer>


        </div>

    </main>

</div>


</body>

</html>