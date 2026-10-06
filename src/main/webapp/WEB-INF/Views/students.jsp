<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Student Management - PGHub</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;

            font-family: Arial, sans-serif;

            background: #f4f7fb;

            color: #1f2937;
        }


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

        .main {
            margin-left: 250px;

            min-height: 100vh;
        }


        /* =====================================================
           TOP HEADER
           ===================================================== */

        .topbar {
            height: 70px;

            background: white;

            border-bottom: 1px solid #e5e7eb;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 30px;
        }

        .topbar h3 {
            margin: 0;

            font-size: 21px;

            color: #172554;
        }

        .admin-info {
            display: flex;

            align-items: center;

            gap: 10px;

            font-size: 14px;

            color: #4b5563;
        }

        .admin-icon {
            width: 38px;

            height: 38px;

            border-radius: 50%;

            background: #2563eb;

            color: white;

            display: flex;

            align-items: center;

            justify-content: center;
        }


        /* =====================================================
           CONTENT
           ===================================================== */

        .content {
            padding: 30px;
        }

        .page-heading {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 25px;

            gap: 15px;
        }

        .page-heading h2 {
            margin: 0;

            color: #172554;

            font-size: 25px;
        }

        .page-heading p {
            margin: 6px 0 0;

            color: #6b7280;

            font-size: 14px;
        }


        /* =====================================================
           BUTTONS
           ===================================================== */

        .btn {
            display: inline-flex;

            align-items: center;

            gap: 7px;

            padding: 10px 15px;

            border-radius: 7px;

            text-decoration: none;

            border: none;

            cursor: pointer;

            font-size: 14px;

            font-weight: 500;

            transition: 0.2s;
        }

        .btn:hover {
            transform: translateY(-1px);
        }

        .btn-primary {
            background: #2563eb;

            color: white;
        }

        .btn-primary:hover {
            background: #1d4ed8;
        }

        .btn-secondary {
            background: #475569;

            color: white;
        }

        .btn-secondary:hover {
            background: #334155;
        }

        .btn-edit {
            background: #eff6ff;

            color: #2563eb;
        }

        .btn-edit:hover {
            background: #dbeafe;
        }

        .btn-delete {
            background: #fef2f2;

            color: #dc2626;
        }

        .btn-delete:hover {
            background: #fee2e2;
        }


        /* =====================================================
           ALERT
           ===================================================== */

        .alert {
            padding: 13px 16px;

            border-radius: 8px;

            margin-bottom: 20px;

            font-size: 14px;
        }

        .alert-danger {
            background: #fef2f2;

            color: #991b1b;

            border: 1px solid #fecaca;
        }


        /* =====================================================
           TABLE CARD
           ===================================================== */

        .table-card {
            background: white;

            border-radius: 12px;

            box-shadow:
                0 3px 12px rgba(15, 23, 42, 0.07);

            overflow: hidden;
        }

        .table-header {
            padding: 18px 22px;

            border-bottom: 1px solid #e5e7eb;

            display: flex;

            justify-content: space-between;

            align-items: center;
        }

        .table-header h3 {
            margin: 0;

            font-size: 17px;

            color: #172554;
        }

        .student-count {
            font-size: 13px;

            color: #64748b;
        }

        .table-wrapper {
            width: 100%;

            overflow-x: auto;
        }

        table {
            width: 100%;

            min-width: 1050px;

            border-collapse: collapse;
        }

        th {
            background: #f8fafc;

            color: #475569;

            font-size: 12px;

            text-transform: uppercase;

            letter-spacing: 0.4px;

            padding: 14px 12px;

            border-bottom: 1px solid #e5e7eb;

            text-align: left;

            white-space: nowrap;
        }

        td {
            padding: 14px 12px;

            border-bottom: 1px solid #eef2f7;

            font-size: 14px;

            color: #374151;

            vertical-align: middle;
        }

        tbody tr:hover {
            background: #f8fafc;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .student-id {
            font-weight: bold;

            color: #2563eb;
        }

        .student-name {
            font-weight: 600;

            color: #172554;
        }

        .email {
            color: #475569;
        }

        .mobile {
            white-space: nowrap;
        }

        .address {
            max-width: 220px;

            line-height: 1.4;
        }

        .id-proof {
            color: #64748b;
        }


        /* =====================================================
           ACTIONS
           ===================================================== */

        .action-buttons {
            display: flex;

            gap: 7px;

            white-space: nowrap;
        }


        /* =====================================================
           EMPTY STATE
           ===================================================== */

        .empty {
            padding: 70px 20px;

            text-align: center;

            color: #64748b;
        }

        .empty i {
            font-size: 45px;

            color: #cbd5e1;

            margin-bottom: 15px;
        }

        .empty h3 {
            margin: 5px 0 8px;

            color: #475569;
        }

        .empty p {
            margin: 0 0 20px;

            font-size: 14px;
        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 900px) {

            .sidebar {
                width: 210px;
            }

            .main {
                margin-left: 210px;
            }

            .content {
                padding: 20px;
            }

            .topbar {
                padding: 0 20px;
            }
        }


        @media (max-width: 700px) {

            .sidebar {
                position: relative;

                width: 100%;

                height: auto;

                min-height: auto;
            }

            .main {
                margin-left: 0;
            }

            .topbar {
                height: auto;

                padding: 15px;

                gap: 10px;
            }

            .admin-info {
                display: none;
            }

            .content {
                padding: 15px;
            }

            .page-heading {
                align-items: flex-start;

                flex-direction: column;
            }
        }


        @media (max-width: 450px) {

            .logo-section {
                padding-left: 15px;

                padding-right: 15px;
            }
        }

    </style>

</head>


<body>


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


        <!-- SIDEBAR MENU -->

        <nav class="sidebar-menu">


            <!-- DASHBOARD -->

            <a href="${pageContext.request.contextPath}/admin/dashboard">

                <span class="menu-icon">🏠</span>

                <span class="menu-text">
                    Dashboard
                </span>

            </a>


            <!-- STUDENTS - ACTIVE -->

            <a href="${pageContext.request.contextPath}/student/list"
               class="active">

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


        <!-- LOGOUT -->

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
         MAIN
         ===================================================== -->

    <div class="main">


        <!-- TOP BAR -->

        <div class="topbar">

            <h3>
                Student Management
            </h3>


            <div class="admin-info">

                <div class="admin-icon">

                    <i class="fa-solid fa-user-shield"></i>

                </div>

                <span>
                    Administrator
                </span>

            </div>

        </div>


        <!-- CONTENT -->

        <div class="content">


            <!-- PAGE HEADING -->

            <div class="page-heading">

                <div>

                    <h2>
                        Students
                    </h2>

                    <p>
                        Manage registered students and their information.
                    </p>

                </div>


                <div>

                    <a
                        href="${pageContext.request.contextPath}/admin/dashboard"
                        class="btn btn-secondary">

                        <i class="fa-solid fa-arrow-left"></i>

                        Dashboard

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/student/add"
                        class="btn btn-primary">

                        <i class="fa-solid fa-user-plus"></i>

                        Add Student

                    </a>

                </div>

            </div>


            <!-- ERROR MESSAGE -->

            <c:if test="${not empty error}">

                <div class="alert alert-danger">

                    <i class="fa-solid fa-circle-exclamation"></i>

                    &nbsp; ${error}

                </div>

            </c:if>


            <!-- STUDENT TABLE -->

            <div class="table-card">


                <div class="table-header">

                    <h3>

                        <i class="fa-solid fa-users"></i>

                        &nbsp;Registered Students

                    </h3>


                    <span class="student-count">

                        Total Students:

                        <strong>
                            ${students.size()}
                        </strong>

                    </span>

                </div>


                <c:choose>


                    <c:when test="${not empty students}">

                        <div class="table-wrapper">

                            <table>


                                <thead>

                                    <tr>

                                        <th>
                                            ID
                                        </th>

                                        <th>
                                            Name
                                        </th>

                                        <th>
                                            Email
                                        </th>

                                        <th>
                                            Mobile
                                        </th>

                                        <th>
                                            Guardian Mobile
                                        </th>

                                        <th>
                                            Address
                                        </th>

                                        <th>
                                            ID Proof
                                        </th>

                                        <th>
                                            Actions
                                        </th>

                                    </tr>

                                </thead>


                                <tbody>


                                    <c:forEach
                                        var="student"
                                        items="${students}">


                                        <tr>


                                            <td class="student-id">

                                                #${student.id}

                                            </td>


                                            <td class="student-name">

                                                ${student.name}

                                            </td>


                                            <td class="email">

                                                ${student.email}

                                            </td>


                                            <td class="mobile">

                                                ${student.mobile}

                                            </td>


                                            <td class="mobile">

                                                <c:choose>

                                                    <c:when test="${not empty student.guardianMobile}">

                                                        ${student.guardianMobile}

                                                    </c:when>

                                                    <c:otherwise>

                                                        —

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <td class="address">

                                                <c:choose>

                                                    <c:when test="${not empty student.address}">

                                                        ${student.address}

                                                    </c:when>

                                                    <c:otherwise>

                                                        —

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <td class="id-proof">

                                                <c:choose>

                                                    <c:when test="${not empty student.idProof}">

                                                        ${student.idProof}

                                                    </c:when>

                                                    <c:otherwise>

                                                        —

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <td>


                                                <div class="action-buttons">


                                                    <a
                                                        href="${pageContext.request.contextPath}/student/edit?id=${student.id}"
                                                        class="btn btn-edit">

                                                        <i class="fa-solid fa-pen-to-square"></i>

                                                        Edit

                                                    </a>


                                                    <a
                                                        href="${pageContext.request.contextPath}/student/delete?id=${student.id}"
                                                        class="btn btn-delete"

                                                        onclick="return confirm('Are you sure you want to delete this student?');">

                                                        <i class="fa-solid fa-trash"></i>

                                                        Delete

                                                    </a>


                                                </div>


                                            </td>


                                        </tr>


                                    </c:forEach>


                                </tbody>


                            </table>

                        </div>


                    </c:when>


                    <c:otherwise>


                        <div class="empty">

                            <i class="fa-solid fa-user-graduate"></i>

                            <h3>
                                No Students Found
                            </h3>

                            <p>
                                There are currently no students registered in the system.
                            </p>


                            <a
                                href="${pageContext.request.contextPath}/student/add"
                                class="btn btn-primary">

                                <i class="fa-solid fa-user-plus"></i>

                                Add First Student

                            </a>

                        </div>


                    </c:otherwise>


                </c:choose>


            </div>


        </div>


    </div>


</body>

</html>