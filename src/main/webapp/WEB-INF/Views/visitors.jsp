<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Visitor Management - PGHub</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/CSS/style.css">

    <style>

        /* ================= SIDEBAR ================= */

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


        /* ================= VISITOR STATUS ================= */

        .status-pending {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 6px 13px;
            border-radius: 20px;
            background: #fef3c7;
            color: #92400e;
            font-size: 12px;
            font-weight: 600;
            border: 1px solid #fde68a;
        }

        .status-active {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 6px 13px;
            border-radius: 20px;
            background: #dcfce7;
            color: #15803d;
            font-size: 12px;
            font-weight: 600;
            border: 1px solid #bbf7d0;
        }


        /* ================= RESPONSIVE ================= */

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


    <!-- ================= SIDEBAR ================= -->

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

                    <span>Admin Portal</span>

                </div>

            </div>

        </div>


        <nav class="sidebar-menu">

            <a href="${pageContext.request.contextPath}/admin/dashboard">

                <span class="menu-icon">🏠</span>

                <span class="menu-text">
                    Dashboard
                </span>

            </a>


            <a href="${pageContext.request.contextPath}/student/list">

                <span class="menu-icon">👨‍🎓</span>

                <span class="menu-text">
                    Students
                </span>

            </a>


            <a href="${pageContext.request.contextPath}/property/list">

                <span class="menu-icon">🏢</span>

                <span class="menu-text">
                    Properties
                </span>

            </a>


            <a href="${pageContext.request.contextPath}/room/list">

                <span class="menu-icon">🛏️</span>

                <span class="menu-text">
                    Rooms
                </span>

            </a>


            <a href="${pageContext.request.contextPath}/allocation/list">

                <span class="menu-icon">📋</span>

                <span class="menu-text">
                    Allocations
                </span>

            </a>


            <a href="${pageContext.request.contextPath}/payment/list">

                <span class="menu-icon">💰</span>

                <span class="menu-text">
                    Payments
                </span>

            </a>


            <a href="${pageContext.request.contextPath}/complaint/list">

                <span class="menu-icon">📝</span>

                <span class="menu-text">
                    Complaints
                </span>

            </a>


            <a
                href="${pageContext.request.contextPath}/visitor/list"
                class="active">

                <span class="menu-icon">👥</span>

                <span class="menu-text">
                    Visitors
                </span>

            </a>

        </nav>


        <div class="sidebar-footer">

            <a href="${pageContext.request.contextPath}/admin/logout">

                <span class="menu-icon">🚪</span>

                <span class="menu-text">
                    Logout
                </span>

            </a>

        </div>

    </aside>



    <!-- ================= MAIN CONTENT ================= -->

    <main class="main-content">


        <!-- TOP HEADER -->

        <header class="top-header">

            <div>

                <h1>
                    Visitor Management
                </h1>

                <p>
                    Manage student visitor records
                </p>

            </div>


            <div class="header-user">

                <div class="user-avatar">
                    A
                </div>

                <div>

                    <strong>
                        Administrator
                    </strong>

                    <small>
                        Admin
                    </small>

                </div>

            </div>

        </header>



        <!-- CONTENT -->

        <section class="content-area">


            <!-- PAGE TOOLBAR -->

            <div class="page-toolbar">

                <div>

                    <h2>
                        Visitors
                    </h2>

                    <p>
                        Track visitor entry and exit records.
                    </p>

                </div>


                <div class="toolbar-actions">

                    <a
                        href="${pageContext.request.contextPath}/admin/dashboard"
                        class="btn btn-secondary">

                        ← Dashboard

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/visitor/add"
                        class="btn btn-primary">

                        + Add Visitor

                    </a>

                </div>

            </div>



            <!-- ERROR MESSAGE -->

            <c:if test="${not empty error}">

                <div class="alert alert-danger">

                    <strong>
                        Error:
                    </strong>

                    ${error}

                </div>

            </c:if>



            <!-- SUCCESS MESSAGE -->

            <c:if test="${not empty message}">

                <div class="alert alert-success">

                    ${message}

                </div>

            </c:if>



            <!-- VISITOR TABLE -->

            <div class="card">

                <div class="card-header">

                    <div>

                        <h3>
                            Visitor List
                        </h3>

                        <p>
                            All registered visitor records
                        </p>

                    </div>

                    <div class="card-header-icon">
                        👥
                    </div>

                </div>



                <div class="table-responsive">

                    <table class="data-table">

                        <thead>

                            <tr>

                                <th>
                                    ID
                                </th>

                                <th>
                                    Student
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
                                    Visit Status
                                </th>

                                <th>
                                    Actions
                                </th>

                            </tr>

                        </thead>



                        <tbody>

                            <c:choose>

                                <c:when test="${not empty visitors}">

                                    <c:forEach
                                        var="visitor"
                                        items="${visitors}">

                                        <tr>

                                            <td>

                                                <strong>
                                                    ${visitor.id}
                                                </strong>

                                            </td>


                                            <td>

                                                <c:choose>

                                                    <c:when
                                                        test="${not empty students}">

                                                        <c:forEach
                                                            var="student"
                                                            items="${students}">

                                                            <c:if
                                                                test="${student.id == visitor.studentId}">

                                                                <div class="table-primary-text">

                                                                    ${student.name}

                                                                </div>

                                                                <small>

                                                                    ${student.email}

                                                                </small>

                                                            </c:if>

                                                        </c:forEach>

                                                    </c:when>


                                                    <c:otherwise>

                                                        Student ID:
                                                        ${visitor.studentId}

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <td>

                                                <div class="table-primary-text">

                                                    ${visitor.visitorName}

                                                </div>

                                            </td>


                                            <td>

                                                ${visitor.relation}

                                            </td>


                                            <td>

                                                ${visitor.entryTime}

                                            </td>


                                            <td>

                                                <c:choose>

                                                    <c:when
                                                        test="${not empty visitor.exitTime}">

                                                        ${visitor.exitTime}

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span>
                                                            Still Inside
                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <td>

                                                <c:choose>

                                                    <c:when
                                                        test="${empty visitor.exitTime}">

                                                        <span class="status-pending">

                                                            Inside

                                                        </span>

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span class="status-active">

                                                            Completed

                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <td>

                                                <div class="action-buttons">

                                                    <a
                                                        href="${pageContext.request.contextPath}/visitor/edit?id=${visitor.id}"
                                                        class="action-btn action-edit">

                                                        Edit

                                                    </a>


                                                    <a
                                                        href="${pageContext.request.contextPath}/visitor/delete?id=${visitor.id}"
                                                        class="action-btn action-delete"
                                                        onclick="return confirm('Are you sure you want to delete this visitor record?');">

                                                        Delete

                                                    </a>

                                                </div>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </c:when>


                                <c:otherwise>

                                    <tr>

                                        <td colspan="8">

                                            <div class="empty-state">

                                                <div class="empty-state-icon">
                                                    👥
                                                </div>

                                                <h3>
                                                    No Visitors Found
                                                </h3>

                                                <p>

                                                    No visitor records have
                                                    been added yet.

                                                </p>


                                                <a
                                                    href="${pageContext.request.contextPath}/visitor/add"
                                                    class="btn btn-primary">

                                                    + Add First Visitor

                                                </a>

                                            </div>

                                        </td>

                                    </tr>

                                </c:otherwise>

                            </c:choose>

                        </tbody>

                    </table>

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