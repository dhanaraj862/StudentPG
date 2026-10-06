<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Property Management - PGHub</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

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
           PROPERTY PAGE ADDITIONAL STYLES
           ===================================================== */

        .property-id {
            color: #2563eb;

            font-weight: 700;
        }

        .property-name {
            font-weight: 600;

            color: #172554;
        }

        .owner-name {
            font-weight: 500;

            color: #374151;
        }

        .contact-number {
            white-space: nowrap;

            color: #475569;
        }

        .address-cell {
            max-width: 280px;

            line-height: 1.5;

            color: #475569;
        }

        .property-count {
            font-size: 14px;

            color: #64748b;
        }

        .property-count strong {
            color: #172554;
        }

        .action-buttons {
            display: flex;

            gap: 8px;

            white-space: nowrap;
        }

        .action-btn {
            display: inline-flex;

            align-items: center;

            justify-content: center;

            padding: 8px 12px;

            border-radius: 6px;

            text-decoration: none;

            font-size: 13px;

            font-weight: 500;

            transition: 0.2s;
        }

        .action-edit {
            background: #eff6ff;

            color: #2563eb;
        }

        .action-edit:hover {
            background: #dbeafe;
        }

        .action-delete {
            background: #fef2f2;

            color: #dc2626;
        }

        .action-delete:hover {
            background: #fee2e2;
        }

        .alert {
            padding: 14px 17px;

            border-radius: 8px;

            margin-bottom: 20px;

            font-size: 14px;
        }

        .alert-danger {
            background: #fef2f2;

            border: 1px solid #fecaca;

            color: #991b1b;
        }

        .alert-success {
            background: #f0fdf4;

            border: 1px solid #bbf7d0;

            color: #166534;
        }

        .empty-state {
            padding: 65px 20px;

            text-align: center;
        }

        .empty-state-icon {
            font-size: 48px;

            margin-bottom: 12px;
        }

        .empty-state h3 {
            margin: 8px 0;

            color: #334155;
        }

        .empty-state p {
            margin: 0 0 20px;

            color: #64748b;

            font-size: 14px;
        }

        .table-primary-text {
            font-weight: 600;

            color: #172554;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .data-table {
            min-width: 900px;
        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 900px) {

            .sidebar {
                width: 210px;
            }

            .main-content {
                margin-left: 210px;
            }
        }


        @media (max-width: 768px) {

            .page-toolbar {
                flex-direction: column;

                align-items: flex-start;

                gap: 15px;
            }

            .toolbar-actions {
                width: 100%;

                display: flex;

                flex-wrap: wrap;

                gap: 8px;
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


            <!-- STUDENTS -->

            <a href="${pageContext.request.contextPath}/student/list">

                <span class="menu-icon">👨‍🎓</span>

                <span class="menu-text">
                    Students
                </span>

            </a>


            <!-- PROPERTIES - ACTIVE -->

            <a
                href="${pageContext.request.contextPath}/property/list"
                class="active">

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
         MAIN CONTENT
         ===================================================== -->

    <main class="main-content">


        <!-- TOP HEADER -->

        <header class="top-header">

            <div>

                <h1>
                    Property Management
                </h1>

                <p>
                    Manage all PG properties
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


        <!-- CONTENT AREA -->

        <section class="content-area">


            <!-- PAGE TOOLBAR -->

            <div class="page-toolbar">

                <div>

                    <h2>
                        Properties
                    </h2>

                    <p>
                        Add, update and manage PG properties.
                    </p>

                </div>


                <div class="toolbar-actions">

                    <a
                        href="${pageContext.request.contextPath}/admin/dashboard"
                        class="btn btn-secondary">

                        ← Dashboard

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/property/add"
                        class="btn btn-primary">

                        + Add Property

                    </a>

                </div>

            </div>


            <!-- ERROR MESSAGE -->

            <c:if test="${not empty error}">

                <div class="alert alert-danger">

                    <strong>
                        ⚠ Error:
                    </strong>

                    ${error}

                </div>

            </c:if>


            <!-- SUCCESS MESSAGE -->

            <c:if test="${not empty message}">

                <div class="alert alert-success">

                    <strong>
                        ✓ Success:
                    </strong>

                    ${message}

                </div>

            </c:if>


            <!-- PROPERTY CARD -->

            <div class="card">


                <!-- CARD HEADER -->

                <div class="card-header">

                    <div>

                        <h3>
                            Property List
                        </h3>

                        <p>
                            All registered PG properties
                        </p>

                    </div>


                    <div>

                        <span class="property-count">

                            Total Properties:

                            <strong>
                                ${properties.size()}
                            </strong>

                        </span>

                    </div>

                </div>


                <!-- PROPERTY TABLE -->

                <div class="table-responsive">

                    <table class="data-table">


                        <thead>

                            <tr>

                                <th>
                                    ID
                                </th>

                                <th>
                                    Property Name
                                </th>

                                <th>
                                    Address
                                </th>

                                <th>
                                    Owner Name
                                </th>

                                <th>
                                    Contact Number
                                </th>

                                <th>
                                    Actions
                                </th>

                            </tr>

                        </thead>


                        <tbody>


                            <c:choose>


                                <c:when test="${not empty properties}">


                                    <c:forEach
                                        var="property"
                                        items="${properties}">


                                        <tr>


                                            <!-- ID -->

                                            <td class="property-id">

                                                #${property.id}

                                            </td>


                                            <!-- PROPERTY NAME -->

                                            <td>

                                                <div class="property-name">

                                                    ${property.propertyName}

                                                </div>

                                            </td>


                                            <!-- ADDRESS -->

                                            <td>

                                                <div class="address-cell">

                                                    <c:choose>

                                                        <c:when
                                                            test="${not empty property.address}">

                                                            ${property.address}

                                                        </c:when>

                                                        <c:otherwise>

                                                            —

                                                        </c:otherwise>

                                                    </c:choose>

                                                </div>

                                            </td>


                                            <!-- OWNER -->

                                            <td class="owner-name">

                                                <c:choose>

                                                    <c:when
                                                        test="${not empty property.ownerName}">

                                                        ${property.ownerName}

                                                    </c:when>

                                                    <c:otherwise>

                                                        —

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- CONTACT -->

                                            <td class="contact-number">

                                                <c:choose>

                                                    <c:when
                                                        test="${not empty property.contactNumber}">

                                                        ${property.contactNumber}

                                                    </c:when>

                                                    <c:otherwise>

                                                        —

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- ACTIONS -->

                                            <td>

                                                <div class="action-buttons">


                                                    <!-- EDIT -->

                                                    <a
                                                        href="${pageContext.request.contextPath}/property/edit?id=${property.id}"
                                                        class="action-btn action-edit">

                                                        ✏ Edit

                                                    </a>


                                                    <!-- DELETE -->

                                                    <a
                                                        href="${pageContext.request.contextPath}/property/delete?id=${property.id}"
                                                        class="action-btn action-delete"

                                                        onclick="return confirm('Are you sure you want to delete this property?');">

                                                        🗑 Delete

                                                    </a>


                                                </div>

                                            </td>


                                        </tr>


                                    </c:forEach>


                                </c:when>


                                <c:otherwise>


                                    <tr>

                                        <td colspan="6">


                                            <div class="empty-state">


                                                <div class="empty-state-icon">
                                                    🏢
                                                </div>


                                                <h3>
                                                    No Properties Found
                                                </h3>


                                                <p>
                                                    No PG properties have been
                                                    added yet.
                                                </p>


                                                <a
                                                    href="${pageContext.request.contextPath}/property/add"
                                                    class="btn btn-primary">

                                                    + Add First Property

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