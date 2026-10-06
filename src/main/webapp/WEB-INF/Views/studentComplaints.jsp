<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>My Complaints - PGHub</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/CSS/style.css">


    <style>

        /* ========================================
           STUDENT SIDEBAR
        ======================================== */

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


        /* ========================================
           CARD HOVER EFFECT
        ======================================== */

        .card {
            transition: all 0.3s ease;
        }


        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 30px rgba(79, 70, 229, 0.20);
        }


        /* ========================================
           STAT CARD HOVER EFFECT
        ======================================== */

        .stat-card {
            transition: all 0.3s ease;
        }


        .stat-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 30px rgba(79, 70, 229, 0.20);
        }


        /* ========================================
           COMPLAINT GUIDE CARD HOVER EFFECT
        ======================================== */

        .info-card {
            transition: all 0.3s ease;
        }


        .info-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 30px rgba(79, 70, 229, 0.20);
        }


        /* ========================================
           RESPONSIVE
        ======================================== */

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
        }

    </style>

</head>


<body>


<div class="app-layout">


    <!-- ========================================
         SIDEBAR
    ======================================== -->

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


            <a
                href="${pageContext.request.contextPath}/student/dashboard">

                <span class="menu-icon">
                    🏠
                </span>

                <span class="menu-text">
                    Dashboard
                </span>

            </a>


            <a
                href="${pageContext.request.contextPath}/student/profile">

                <span class="menu-icon">
                    👤
                </span>

                <span class="menu-text">
                    My Profile
                </span>

            </a>


            <a
                href="${pageContext.request.contextPath}/allocation/my">

                <span class="menu-icon">
                    🛏️
                </span>

                <span class="menu-text">
                    My Allocation
                </span>

            </a>


            <a
                href="${pageContext.request.contextPath}/payment/my">

                <span class="menu-icon">
                    💰
                </span>

                <span class="menu-text">
                    My Payments
                </span>

            </a>


            <!-- ACTIVE: MY COMPLAINTS -->

            <a
                href="${pageContext.request.contextPath}/complaint/my"
                class="active">

                <span class="menu-icon">
                    📝
                </span>

                <span class="menu-text">
                    My Complaints
                </span>

            </a>


            <a
                href="${pageContext.request.contextPath}/visitor/my">

                <span class="menu-icon">
                    👥
                </span>

                <span class="menu-text">
                    My Visitors
                </span>

            </a>


        </nav>


        <div class="sidebar-footer">


            <a
                href="${pageContext.request.contextPath}/student/logout">

                <span class="menu-icon">
                    🚪
                </span>

                <span class="menu-text">
                    Logout
                </span>

            </a>


        </div>


    </aside>


    <!-- ========================================
         MAIN CONTENT
    ======================================== -->

    <main class="main-content">


        <header class="top-header">


            <div>

                <h1>
                    My Complaints
                </h1>

                <p>
                    Submit and track your PG complaints
                </p>

            </div>


            <div class="header-user">


                <div class="user-avatar">
                    S
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


        <section class="content-area">


            <!-- ========================================
                 PAGE TOOLBAR
            ======================================== -->

            <div class="page-toolbar">


                <div>

                    <h2>
                        Complaint History
                    </h2>

                    <p>
                        View your submitted complaints and
                        their current status.
                    </p>

                </div>


                <div class="toolbar-actions">


                    <a
                        href="${pageContext.request.contextPath}/complaint/student/add"
                        class="btn btn-primary">

                        + Submit Complaint

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/student/dashboard"
                        class="btn btn-secondary">

                        ← Dashboard

                    </a>


                </div>


            </div>


            <!-- ========================================
                 STATISTICS
            ======================================== -->

            <div class="stats-grid">


                <div class="stat-card">


                    <div class="stat-icon">
                        📝
                    </div>


                    <div>

                        <span>
                            Total Complaints
                        </span>

                        <strong>
                            ${complaints.size()}
                        </strong>

                    </div>


                </div>


                <div class="stat-card">


                    <div class="stat-icon">
                        🔄
                    </div>


                    <div>

                        <span>
                            Complaint Status
                        </span>

                        <strong>
                            Track Below
                        </strong>

                    </div>


                </div>


                <div class="stat-card">


                    <div class="stat-icon">
                        ✅
                    </div>


                    <div>

                        <span>
                            Resolution
                        </span>

                        <strong>
                            View Below
                        </strong>

                    </div>


                </div>


            </div>


            <!-- ========================================
                 COMPLAINT HISTORY
            ======================================== -->

            <div class="card">


                <div class="card-header">


                    <div>

                        <h3>
                            📝 My Complaints
                        </h3>

                        <p>
                            Complete history of your submitted complaints
                        </p>

                    </div>


                </div>


                <c:choose>


                    <c:when test="${not empty complaints}">


                        <div class="table-responsive">


                            <table class="data-table">


                                <thead>

                                    <tr>

                                        <th>
                                            #
                                        </th>

                                        <th>
                                            Complaint ID
                                        </th>

                                        <th>
                                            Category
                                        </th>

                                        <th>
                                            Description
                                        </th>

                                        <th>
                                            Status
                                        </th>

                                        <th>
                                            Created At
                                        </th>

                                    </tr>

                                </thead>


                                <tbody>


                                    <c:forEach
                                        var="complaint"
                                        items="${complaints}"
                                        varStatus="status">


                                        <tr>


                                            <td>
                                                ${status.count}
                                            </td>


                                            <td>

                                                <strong>
                                                    #${complaint.id}
                                                </strong>

                                            </td>


                                            <td>

                                                <strong>
                                                    ${complaint.category}
                                                </strong>

                                            </td>


                                            <td>

                                                <div style="max-width: 450px;">

                                                    ${complaint.description}

                                                </div>

                                            </td>


                                            <td>


                                                <c:choose>


                                                    <c:when
                                                        test="${complaint.status == 'Open'}">

                                                        <span
                                                            class="status-badge status-danger">

                                                            ● Open

                                                        </span>

                                                    </c:when>


                                                    <c:when
                                                        test="${complaint.status == 'In_Progress'}">

                                                        <span
                                                            class="status-badge status-warning">

                                                            ● In Progress

                                                        </span>

                                                    </c:when>


                                                    <c:when
                                                        test="${complaint.status == 'Resolved'}">

                                                        <span
                                                            class="status-badge status-success">

                                                            ● Resolved

                                                        </span>

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span
                                                            class="status-badge">

                                                            ${complaint.status}

                                                        </span>

                                                    </c:otherwise>


                                                </c:choose>


                                            </td>


                                            <td>
                                                ${complaint.createdAt}
                                            </td>


                                        </tr>


                                    </c:forEach>


                                </tbody>


                            </table>


                        </div>


                    </c:when>


                    <c:otherwise>


                        <div class="empty-state">


                            <div class="empty-state-icon">
                                📝
                            </div>


                            <h3>
                                No Complaints Found
                            </h3>


                            <p>
                                You have not submitted any complaints yet.
                            </p>


                            <a
                                href="${pageContext.request.contextPath}/complaint/student/add"
                                class="btn btn-primary">

                                + Submit Your First Complaint

                            </a>


                        </div>


                    </c:otherwise>


                </c:choose>


            </div>


            <!-- ========================================
                 COMPLAINT STATUS GUIDE
            ======================================== -->

            <div class="card">


                <div class="card-header">


                    <div>

                        <h3>
                            ℹ️ Complaint Status Guide
                        </h3>

                        <p>
                            Understand the status of your complaint
                        </p>

                    </div>


                </div>


                <div class="dashboard-grid">


                    <!-- OPEN -->

                    <div class="info-card">


                        <div class="info-icon">
                            🔓
                        </div>


                        <div>

                            <h4>
                                Open
                            </h4>

                            <p>
                                Your complaint has been submitted
                                and is waiting for action.
                            </p>

                        </div>


                    </div>


                    <!-- IN PROGRESS -->

                    <div class="info-card">


                        <div class="info-icon">
                            🔄
                        </div>


                        <div>

                            <h4>
                                In Progress
                            </h4>

                            <p>
                                The administrator is currently
                                working on your complaint.
                            </p>

                        </div>


                    </div>


                    <!-- RESOLVED -->

                    <div class="info-card">


                        <div class="info-icon">
                            ✅
                        </div>


                        <div>

                            <h4>
                                Resolved
                            </h4>

                            <p>
                                The issue has been resolved by
                                the PG administrator.
                            </p>

                        </div>


                    </div>


                </div>


            </div>


            <!-- ========================================
                 INFORMATION CARD
            ======================================== -->

            <div class="card">


                <div class="alert alert-info">


                    <strong>
                        Note:
                    </strong>

                    You can submit a complaint using the
                    <strong>Submit Complaint</strong> button.

                    Complaint status is updated by the
                    PG administrator.


                </div>


            </div>


        </section>


        <!-- FOOTER -->

        <footer class="footer">


            <p>
                © 2026 Student PG Management System
            </p>


        </footer>


    </main>


</div>


</body>

</html>