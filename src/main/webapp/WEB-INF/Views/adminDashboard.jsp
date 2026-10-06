<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard - PGHub</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/style.css">


    <style>

        /* =====================================================
           PGHUB SIDEBAR
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


        /* =====================================================
           LOGO
           ===================================================== */

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

            position: relative;
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

            position: static !important;

            transform: none !important;
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


        /* =====================================================
           SIDEBAR MENU
           ===================================================== */

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


        /* =====================================================
           SIDEBAR FOOTER
           ===================================================== */

        .sidebar-footer {
            padding: 15px 12px;

            border-top: 1px solid rgba(255,255,255,0.1);
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


        /* =====================================================
           MAIN CONTENT
           ===================================================== */

        .main-content {
            margin-left: 250px;

            width: calc(100% - 250px);

            min-height: 100vh;
        }


        /* =====================================================
           STATISTICS CARD HOVER EFFECT
           Same style as Home Page
           ===================================================== */

        .stat-card {
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }


        /* =====================================================
           STATUS SECTION
           ===================================================== */

        .status-section {
            margin-top: 25px;

            margin-bottom: 25px;
        }

        .status-section-title {
            margin-bottom: 18px;
        }

        .status-section-title h2 {
            margin: 0;

            color: #1e293b;

            font-size: 22px;
        }

        .status-section-title p {
            margin: 5px 0 0;

            color: #64748b;

            font-size: 14px;
        }

        .status-grid {
            display: grid;

            grid-template-columns: repeat(4, 1fr);

            gap: 20px;
        }


        /* =====================================================
           STATUS CARD
           ===================================================== */

        .status-card {
            background: #ffffff;

            border: 1px solid #e5e7eb;

            border-radius: 16px;

            padding: 22px;

            box-shadow:
                0 5px 20px rgba(0,0,0,0.06);

            /* Hover transition added */
            transition: all 0.3s ease;
        }


        /* =====================================================
           STATUS CARD HOVER EFFECT
           Same style as Home Page
           ===================================================== */

        .status-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }


        .status-card-header {
            display: flex;

            align-items: center;

            gap: 12px;

            margin-bottom: 18px;
        }

        .status-icon {
            width: 45px;

            height: 45px;

            border-radius: 12px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #eff6ff;

            font-size: 21px;

            flex-shrink: 0;
        }

        .status-card-header h3 {
            margin: 0;

            color: #1e293b;

            font-size: 17px;
        }

        .status-card-header p {
            margin: 3px 0 0;

            color: #64748b;

            font-size: 12px;
        }

        .status-items {
            display: flex;

            flex-direction: column;

            gap: 10px;
        }

        .status-item {
            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 10px 12px;

            background: #f8fafc;

            border-radius: 10px;
        }

        .status-label {
            color: #475569;

            font-size: 13px;
        }

        .status-number {
            font-size: 17px;

            font-weight: 700;

            color: #1e293b;
        }

        .status-badge {
            display: inline-block;

            padding: 5px 10px;

            border-radius: 20px;

            font-size: 11px;

            font-weight: 600;
        }

        .status-available {
            background: #dcfce7;

            color: #166534;
        }

        .status-full {
            background: #fee2e2;

            color: #991b1b;
        }

        .status-paid {
            background: #dcfce7;

            color: #166534;
        }

        .status-pending {
            background: #fef3c7;

            color: #92400e;
        }

        .status-open {
            background: #fee2e2;

            color: #991b1b;
        }

        .status-progress {
            background: #fef3c7;

            color: #92400e;
        }

        .status-resolved {
            background: #dcfce7;

            color: #166534;
        }

        .active-visitor {
            text-align: center;

            padding: 15px;
        }

        .active-visitor-number {
            font-size: 32px;

            font-weight: 700;

            color: #1e3a8a;
        }

        .active-visitor-text {
            margin-top: 5px;

            color: #64748b;

            font-size: 13px;
        }


        /* =====================================================
           QUICK ACTIONS
           ===================================================== */

        .quick-actions {
            display: grid;

            grid-template-columns: repeat(5, 1fr);

            gap: 12px;
        }

        .quick-action {
            padding: 15px;

            background: #f8fafc;

            border: 1px solid #e5e7eb;

            border-radius: 8px;

            text-decoration: none;

            color: #334155;

            text-align: center;

            font-size: 12px;

            transition: all 0.2s ease;
        }

        .quick-action:hover {
            background: #eff6ff;

            border-color: #bfdbfe;

            color: #2563eb;

            transform: translateY(-2px);
        }

        .quick-action > span {
            display: block;

            font-size: 24px;

            margin-bottom: 8px;
        }

        .quick-action strong {
            display: block;

            font-size: 13px;

            margin-bottom: 4px;
        }

        .quick-action small {
            display: block;

            color: #64748b;

            font-size: 10px;

            line-height: 1.4;
        }


        /* =====================================================
           MANAGEMENT MODULE HOVER EFFECT
           ===================================================== */

        .dashboard-grid .card {
            transition: all 0.3s ease;
        }

        .dashboard-grid .card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 12px 30px rgba(79, 70, 229, 0.20);
        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 1200px) {

            .status-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .quick-actions {
                grid-template-columns: repeat(3, 1fr);
            }
        }


        @media (max-width: 900px) {

            .sidebar {
                width: 210px;
            }

            .main-content {
                margin-left: 210px;

                width: calc(100% - 210px);
            }

            .quick-actions {
                grid-template-columns: repeat(2, 1fr);
            }
        }


        @media (max-width: 700px) {

            .app-layout {
                display: block;
            }

            .sidebar {
                position: relative;

                width: 100%;

                min-height: auto;
            }

            .main-content {
                margin-left: 0;

                width: 100%;
            }

            .status-grid {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns: 1fr 1fr;
            }
        }


        @media (max-width: 450px) {

            .quick-actions {
                grid-template-columns: 1fr;
            }

            .logo-section {
                padding-left: 15px;

                padding-right: 15px;
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

                    <span>Admin Portal</span>

                </div>

            </div>

        </div>


        <!-- =================================================
             SIDEBAR MENU
             ================================================= -->

        <nav class="sidebar-menu">


            <!-- DASHBOARD -->

            <a class="active"
               href="${pageContext.request.contextPath}/admin/dashboard">

                <span class="menu-icon">🏠</span>

                <span class="menu-text">
                    Dashboard
                </span>

            </a>


            <!-- STUDENTS -->

            <a href="${pageContext.request.contextPath}/student/list">

                <span class="menu-icon">👨‍🎓</span>

                <span class="menu-text">
                    Students
                </span>

            </a>


            <!-- PROPERTIES -->

            <a href="${pageContext.request.contextPath}/property/list">

                <span class="menu-icon">🏢</span>

                <span class="menu-text">
                    Properties
                </span>

            </a>


            <!-- ROOMS -->

            <a href="${pageContext.request.contextPath}/room/list">

                <span class="menu-icon">🛏️</span>

                <span class="menu-text">
                    Rooms
                </span>

            </a>


            <!-- ALLOCATIONS -->

            <a href="${pageContext.request.contextPath}/allocation/list">

                <span class="menu-icon">📋</span>

                <span class="menu-text">
                    Allocations
                </span>

            </a>


            <!-- PAYMENTS -->

            <a href="${pageContext.request.contextPath}/payment/list">

                <span class="menu-icon">💰</span>

                <span class="menu-text">
                    Payments
                </span>

            </a>


            <!-- COMPLAINTS -->

            <a href="${pageContext.request.contextPath}/complaint/list">

                <span class="menu-icon">📝</span>

                <span class="menu-text">
                    Complaints
                </span>

            </a>


            <!-- VISITORS -->

            <a href="${pageContext.request.contextPath}/visitor/list">

                <span class="menu-icon">👥</span>

                <span class="menu-text">
                    Visitors
                </span>

            </a>


        </nav>


        <!-- =================================================
             LOGOUT
             ================================================= -->

        <div class="sidebar-footer">

            <a href="${pageContext.request.contextPath}/admin/logout">

                <span class="menu-icon">🚪</span>

                <span class="menu-text">
                    Logout
                </span>

            </a>

        </div>


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
                    Admin Dashboard
                </h1>

                <p>
                    Manage your Student PG Management System
                </p>

            </div>


            <div class="header-user">

                <div class="user-avatar">
                    A
                </div>

                <div>

                    <strong>
                        ${sessionScope.adminUsername}
                    </strong>

                    <small>
                        Administrator
                    </small>

                </div>

            </div>

        </header>


        <!-- =================================================
             CONTENT
             ================================================= -->

        <section class="content-area">


            <!-- =================================================
                 WELCOME CARD
                 ================================================= -->

            <div class="card">

                <div class="card-header">

                    <div>

                        <h2>
                            Welcome, Admin! 👋
                        </h2>

                        <p>
                            Manage students, properties, rooms,
                            allocations, payments, complaints
                            and visitors from one place.
                        </p>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 MAIN STATISTICS
                 ================================================= -->

            <div class="stats-grid">


                <!-- STUDENTS -->

                <a
                    href="${pageContext.request.contextPath}/student/list"
                    class="stat-card">

                    <div class="stat-icon">
                        👨‍🎓
                    </div>

                    <div>

                        <span>
                            Total Students
                        </span>

                        <strong>
                            ${totalStudents}
                        </strong>

                    </div>

                </a>


                <!-- PROPERTIES -->

                <a
                    href="${pageContext.request.contextPath}/property/list"
                    class="stat-card">

                    <div class="stat-icon">
                        🏢
                    </div>

                    <div>

                        <span>
                            Total Properties
                        </span>

                        <strong>
                            ${totalProperties}
                        </strong>

                    </div>

                </a>


                <!-- ROOMS -->

                <a
                    href="${pageContext.request.contextPath}/room/list"
                    class="stat-card">

                    <div class="stat-icon">
                        🛏️
                    </div>

                    <div>

                        <span>
                            Total Rooms
                        </span>

                        <strong>
                            ${totalRooms}
                        </strong>

                    </div>

                </a>


                <!-- ALLOCATIONS -->

                <a
                    href="${pageContext.request.contextPath}/allocation/list"
                    class="stat-card">

                    <div class="stat-icon">
                        📋
                    </div>

                    <div>

                        <span>
                            Total Allocations
                        </span>

                        <strong>
                            ${totalAllocations}
                        </strong>

                    </div>

                </a>


                <!-- PENDING PAYMENTS -->

                <a
                    href="${pageContext.request.contextPath}/payment/list"
                    class="stat-card">

                    <div class="stat-icon">
                        💰
                    </div>

                    <div>

                        <span>
                            Pending Payments
                        </span>

                        <strong>
                            ${pendingPayments}
                        </strong>

                    </div>

                </a>


                <!-- OPEN COMPLAINTS -->

                <a
                    href="${pageContext.request.contextPath}/complaint/list"
                    class="stat-card">

                    <div class="stat-icon">
                        📝
                    </div>

                    <div>

                        <span>
                            Open Complaints
                        </span>

                        <strong>
                            ${openComplaints}
                        </strong>

                    </div>

                </a>


                <!-- ACTIVE VISITORS -->

                <a
                    href="${pageContext.request.contextPath}/visitor/list"
                    class="stat-card">

                    <div class="stat-icon">
                        👥
                    </div>

                    <div>

                        <span>
                            Active Visitors
                        </span>

                        <strong>
                            ${activeVisitors}
                        </strong>

                    </div>

                </a>


            </div>


            <!-- =================================================
                 DETAILED STATUS
                 ================================================= -->

            <section class="status-section">


                <div class="status-section-title">

                    <h2>
                        Current Status Overview
                    </h2>

                    <p>
                        Detailed information about rooms,
                        payments, complaints and visitors.
                    </p>

                </div>


                <div class="status-grid">


                    <!-- =================================================
                         ROOM STATUS
                         ================================================= -->

                    <div class="status-card">

                        <div class="status-card-header">

                            <div class="status-icon">
                                🏠
                            </div>

                            <div>

                                <h3>
                                    Room Status
                                </h3>

                                <p>
                                    Current room availability
                                </p>

                            </div>

                        </div>


                        <div class="status-items">


                            <div class="status-item">

                                <span class="status-label">
                                    Available Rooms
                                </span>

                                <span class="status-badge status-available">
                                    ${availableRooms}
                                </span>

                            </div>


                            <div class="status-item">

                                <span class="status-label">
                                    Full Rooms
                                </span>

                                <span class="status-badge status-full">
                                    ${fullRooms}
                                </span>

                            </div>


                        </div>

                    </div>


                    <!-- =================================================
                         PAYMENT STATUS
                         ================================================= -->

                    <div class="status-card">

                        <div class="status-card-header">

                            <div class="status-icon">
                                💰
                            </div>

                            <div>

                                <h3>
                                    Payment Status
                                </h3>

                                <p>
                                    Rent payment records
                                </p>

                            </div>

                        </div>


                        <div class="status-items">


                            <div class="status-item">

                                <span class="status-label">
                                    Paid
                                </span>

                                <span class="status-badge status-paid">
                                    ${paidPayments}
                                </span>

                            </div>


                            <div class="status-item">

                                <span class="status-label">
                                    Pending
                                </span>

                                <span class="status-badge status-pending">
                                    ${pendingPaymentRecords}
                                </span>

                            </div>


                        </div>

                    </div>


                    <!-- =================================================
                         COMPLAINT STATUS
                         ================================================= -->

                    <div class="status-card">

                        <div class="status-card-header">

                            <div class="status-icon">
                                📝
                            </div>

                            <div>

                                <h3>
                                    Complaint Status
                                </h3>

                                <p>
                                    Current complaint records
                                </p>

                            </div>

                        </div>


                        <div class="status-items">


                            <div class="status-item">

                                <span class="status-label">
                                    Open
                                </span>

                                <span class="status-badge status-open">
                                    ${openComplaintRecords}
                                </span>

                            </div>


                            <div class="status-item">

                                <span class="status-label">
                                    In Progress
                                </span>

                                <span class="status-badge status-progress">
                                    ${inProgressComplaints}
                                </span>

                            </div>


                            <div class="status-item">

                                <span class="status-label">
                                    Resolved
                                </span>

                                <span class="status-badge status-resolved">
                                    ${resolvedComplaints}
                                </span>

                            </div>


                        </div>

                    </div>


                    <!-- =================================================
                         VISITOR STATUS
                         ================================================= -->

                    <div class="status-card">

                        <div class="status-card-header">

                            <div class="status-icon">
                                👥
                            </div>

                            <div>

                                <h3>
                                    Visitor Status
                                </h3>

                                <p>
                                    Current visitor entries
                                </p>

                            </div>

                        </div>


                        <div class="active-visitor">

                            <div class="active-visitor-number">
                                ${activeVisitors}
                            </div>

                            <div class="active-visitor-text">
                                Visitor(s) currently inside
                            </div>

                        </div>


                        <div style="margin-top:15px;">

                            <a
                                href="${pageContext.request.contextPath}/visitor/list"
                                class="btn btn-secondary">

                                Manage Visitors →

                            </a>

                        </div>


                    </div>


                </div>

            </section>


            <!-- =================================================
                 QUICK ACTIONS
                 ================================================= -->

            <div class="card">

                <div class="card-header">

                    <div>

                        <h3>
                            Quick Actions
                        </h3>

                        <p>
                            Quickly access common management tasks
                        </p>

                    </div>

                </div>


                <div class="quick-actions">


                    <!-- ADD STUDENT -->

                    <a
                        href="${pageContext.request.contextPath}/student/add"
                        class="quick-action">

                        <span>
                            👨‍🎓
                        </span>

                        <div>

                            <strong>
                                Add Student
                            </strong>

                            <small>
                                Register a new student
                            </small>

                        </div>

                    </a>


                    <!-- ADD PROPERTY -->

                    <a
                        href="${pageContext.request.contextPath}/property/add"
                        class="quick-action">

                        <span>
                            🏢
                        </span>

                        <div>

                            <strong>
                                Add Property
                            </strong>

                            <small>
                                Register a PG property
                            </small>

                        </div>

                    </a>


                    <!-- ADD ROOM -->

                    <a
                        href="${pageContext.request.contextPath}/room/add"
                        class="quick-action">

                        <span>
                            🛏️
                        </span>

                        <div>

                            <strong>
                                Add Room
                            </strong>

                            <small>
                                Create a new room
                            </small>

                        </div>

                    </a>


                    <!-- ADD ALLOCATION -->

                    <a
                        href="${pageContext.request.contextPath}/allocation/add"
                        class="quick-action">

                        <span>
                            📋
                        </span>

                        <div>

                            <strong>
                                Add Allocation
                            </strong>

                            <small>
                                Allocate a room to a student
                            </small>

                        </div>

                    </a>


                    <!-- ADD PAYMENT -->

                    <a
                        href="${pageContext.request.contextPath}/payment/add"
                        class="quick-action">

                        <span>
                            💰
                        </span>

                        <div>

                            <strong>
                                Add Payment
                            </strong>

                            <small>
                                Record a rent payment
                            </small>

                        </div>

                    </a>


                    <!-- ADD VISITOR -->

                    <a
                        href="${pageContext.request.contextPath}/visitor/add"
                        class="quick-action">

                        <span>
                            👥
                        </span>

                        <div>

                            <strong>
                                Add Visitor
                            </strong>

                            <small>
                                Register a visitor entry
                            </small>

                        </div>

                    </a>


                </div>

            </div>


            <!-- =================================================
                 MANAGEMENT MODULES
                 ================================================= -->

            <div class="dashboard-grid">


                <!-- STUDENTS -->

                <div class="card">

                    <div class="card-header">

                        <div>

                            <h3>
                                👨‍🎓 Student Management
                            </h3>

                            <p>
                                Manage registered students
                                and their profiles.
                            </p>

                        </div>

                    </div>


                    <a
                        href="${pageContext.request.contextPath}/student/list"
                        class="btn btn-secondary">

                        Manage Students →

                    </a>

                </div>


                <!-- PROPERTY -->

                <div class="card">

                    <div class="card-header">

                        <div>

                            <h3>
                                🏢 Property Management
                            </h3>

                            <p>
                                Manage PG properties and owners.
                            </p>

                        </div>

                    </div>


                    <a
                        href="${pageContext.request.contextPath}/property/list"
                        class="btn btn-secondary">

                        Manage Properties →

                    </a>

                </div>


                <!-- ROOMS -->

                <div class="card">

                    <div class="card-header">

                        <div>

                            <h3>
                                🛏️ Room Management
                            </h3>

                            <p>
                                Manage rooms, capacity and rent.
                            </p>

                        </div>

                    </div>


                    <a
                        href="${pageContext.request.contextPath}/room/list"
                        class="btn btn-secondary">

                        Manage Rooms →

                    </a>

                </div>


                <!-- ALLOCATIONS -->

                <div class="card">

                    <div class="card-header">

                        <div>

                            <h3>
                                📋 Allocation Management
                            </h3>

                            <p>
                                Manage student room allocations.
                            </p>

                        </div>

                    </div>


                    <a
                        href="${pageContext.request.contextPath}/allocation/list"
                        class="btn btn-secondary">

                        Manage Allocations →

                    </a>

                </div>


                <!-- PAYMENTS -->

                <div class="card">

                    <div class="card-header">

                        <div>

                            <h3>
                                💰 Payment Management
                            </h3>

                            <p>
                                Manage rent payment records.
                            </p>

                        </div>

                    </div>


                    <a
                        href="${pageContext.request.contextPath}/payment/list"
                        class="btn btn-secondary">

                        Manage Payments →

                    </a>

                </div>


                <!-- COMPLAINTS -->

                <div class="card">

                    <div class="card-header">

                        <div>

                            <h3>
                                📝 Complaint Management
                            </h3>

                            <p>
                                Manage and resolve student complaints.
                            </p>

                        </div>

                    </div>


                    <a
                        href="${pageContext.request.contextPath}/complaint/list"
                        class="btn btn-secondary">

                        Manage Complaints →

                    </a>

                </div>


                <!-- VISITORS -->

                <div class="card">

                    <div class="card-header">

                        <div>

                            <h3>
                                👥 Visitor Management
                            </h3>

                            <p>
                                Manage visitor entry and exit records.
                            </p>

                        </div>

                    </div>


                    <a
                        href="${pageContext.request.contextPath}/visitor/list"
                        class="btn btn-secondary">

                        Manage Visitors →

                    </a>

                </div>


            </div>


        </section>


        <!-- =================================================
             FOOTER
             ================================================= -->

        <footer class="footer">

            <p>
                © 2026 Student PG Management System
            </p>

        </footer>


    </main>


</div>


</body>

</html>