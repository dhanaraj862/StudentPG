<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<%@ taglib prefix="fmt"
    uri="jakarta.tags.fmt"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>My Visitors - PGHub</title>

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
           INFORMATION CARD HOVER EFFECT
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
         STUDENT SIDEBAR
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


            <a
                href="${pageContext.request.contextPath}/complaint/my">

                <span class="menu-icon">
                    📝
                </span>

                <span class="menu-text">
                    My Complaints
                </span>

            </a>


            <!-- ACTIVE: MY VISITORS -->

            <a
                href="${pageContext.request.contextPath}/visitor/my"
                class="active">

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
                    My Visitors
                </h1>

                <p>
                    Manage and view your visitor records
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
                        Visitor History
                    </h2>

                    <p>
                        View and manage visitors associated
                        with your account.
                    </p>

                </div>


                <div class="toolbar-actions">


                    <a
                        href="${pageContext.request.contextPath}/visitor/student/add"
                        class="btn btn-primary">

                        + Add Visitor

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/student/dashboard"
                        class="btn btn-secondary">

                        ← Dashboard

                    </a>


                </div>


            </div>


            <!-- ========================================
                 ERROR MESSAGE
            ======================================== -->

            <c:if test="${not empty error}">

                <div class="alert alert-danger">

                    <strong>
                        Error:
                    </strong>

                    ${error}

                </div>

            </c:if>


            <!-- ========================================
                 SUCCESS MESSAGE
            ======================================== -->

            <c:if test="${not empty message}">

                <div class="alert alert-success">

                    ${message}

                </div>

            </c:if>


            <!-- ========================================
                 STATISTICS
            ======================================== -->

            <div class="stats-grid">


                <div class="stat-card">


                    <div class="stat-icon">
                        👥
                    </div>


                    <div>

                        <span>
                            Total Visitors
                        </span>

                        <strong>
                            ${visitors.size()}
                        </strong>

                    </div>


                </div>


                <div class="stat-card">


                    <div class="stat-icon">
                        📋
                    </div>


                    <div>

                        <span>
                            Visitor Records
                        </span>

                        <strong>
                            ${visitors.size()}
                        </strong>

                    </div>


                </div>


                <div class="stat-card">


                    <div class="stat-icon">
                        🚪
                    </div>


                    <div>

                        <span>
                            Currently Inside
                        </span>


                        <strong>


                            <c:set
                                var="activeVisitors"
                                value="0"/>


                            <c:forEach
                                var="visitor"
                                items="${visitors}">


                                <c:if
                                    test="${empty visitor.exitTime}">

                                    <c:set
                                        var="activeVisitors"
                                        value="${activeVisitors + 1}"/>

                                </c:if>


                            </c:forEach>


                            ${activeVisitors}


                        </strong>

                    </div>


                </div>


            </div>


            <!-- ========================================
                 VISITOR HISTORY
            ======================================== -->

            <div class="card">


                <div class="card-header">


                    <div>

                        <h3>
                            👥 My Visitor Records
                        </h3>

                        <p>
                            Complete history of visitors associated
                            with your account
                        </p>

                    </div>


                </div>


                <c:choose>


                    <c:when test="${not empty visitors}">


                        <div class="table-responsive">


                            <table class="data-table">


                                <thead>

                                    <tr>

                                        <th>
                                            #
                                        </th>

                                        <th>
                                            Visitor ID
                                        </th>

                                        <th>
                                            Visitor Name
                                        </th>

                                        <th>
                                            Relation
                                        </th>

                                        <th>
                                            Entry Time
                                        </th>

                                        <th>
                                            Exit Time
                                        </th>

                                        <th>
                                            Status
                                        </th>

                                    </tr>

                                </thead>


                                <tbody>


                                    <c:forEach
                                        var="visitor"
                                        items="${visitors}"
                                        varStatus="status">


                                        <tr>


                                            <td>
                                                ${status.count}
                                            </td>


                                            <td>

                                                <strong>
                                                    #${visitor.id}
                                                </strong>

                                            </td>


                                            <td>

                                                <strong>
                                                    ${visitor.visitorName}
                                                </strong>

                                            </td>


                                            <td>
                                                ${visitor.relation}
                                            </td>


                                            <td>

                                                <fmt:formatDate
                                                    value="${visitor.entryTime}"
                                                    pattern="dd-MM-yyyy hh:mm a"/>

                                            </td>


                                            <td>


                                                <c:choose>


                                                    <c:when
                                                        test="${not empty visitor.exitTime}">

                                                        <fmt:formatDate
                                                            value="${visitor.exitTime}"
                                                            pattern="dd-MM-yyyy hh:mm a"/>

                                                    </c:when>


                                                    <c:otherwise>

                                                        —

                                                    </c:otherwise>


                                                </c:choose>


                                            </td>


                                            <td>


                                                <c:choose>


                                                    <c:when
                                                        test="${not empty visitor.exitTime}">

                                                        <span
                                                            class="status-badge status-success">

                                                            ● Completed

                                                        </span>

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span
                                                            class="status-badge status-warning">

                                                            ● Currently Inside

                                                        </span>

                                                    </c:otherwise>


                                                </c:choose>


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
                                👥
                            </div>


                            <h3>
                                No Visitor Records
                            </h3>


                            <p>
                                You have not added any visitor
                                records yet.
                            </p>


                            <a
                                href="${pageContext.request.contextPath}/visitor/student/add"
                                class="btn btn-primary">

                                + Add Your First Visitor

                            </a>


                        </div>


                    </c:otherwise>


                </c:choose>


            </div>


            <!-- ========================================
                 VISITOR INFORMATION
            ======================================== -->

            <div class="card">


                <div class="card-header">


                    <div>

                        <h3>
                            ℹ️ Visitor Information
                        </h3>

                        <p>
                            Important information about visitor records
                        </p>

                    </div>


                </div>


                <div class="dashboard-grid">


                    <!-- VISITOR DETAILS -->

                    <div class="info-card">


                        <div class="info-icon">
                            👤
                        </div>


                        <div>

                            <h4>
                                Visitor Details
                            </h4>

                            <p>
                                Keep visitor name and relationship
                                information accurate.
                            </p>

                        </div>


                    </div>


                    <!-- ENTRY TIME -->

                    <div class="info-card">


                        <div class="info-icon">
                            🚪
                        </div>


                        <div>

                            <h4>
                                Entry Time
                            </h4>

                            <p>
                                The visitor entry time is recorded
                                when the visitor arrives.
                            </p>

                        </div>


                    </div>


                    <!-- EXIT TIME -->

                    <div class="info-card">


                        <div class="info-icon">
                            🕒
                        </div>


                        <div>

                            <h4>
                                Exit Time
                            </h4>

                            <p>
                                Exit time can be recorded when
                                the visitor leaves the PG.
                            </p>

                        </div>


                    </div>


                </div>


            </div>


            <!-- ========================================
                 INFORMATION NOTE
            ======================================== -->

            <div class="card">


                <div class="alert alert-info">


                    <strong>
                        Note:
                    </strong>

                    Visitor records are associated with your
                    student account. Make sure the visitor
                    information is accurate when adding a record.


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