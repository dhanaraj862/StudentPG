<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>
        <c:choose>
            <c:when test="${not empty complaint and complaint.id > 0}">
                Edit Complaint
            </c:when>
            <c:otherwise>
                Add Complaint
            </c:otherwise>
        </c:choose>
        - Student PG
    </title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/CSS/style.css">

</head>

<body>

<div class="app-layout">

    <!-- ================= SIDEBAR ================= -->

    <aside class="sidebar">

        <div class="logo-section">

            <div class="logo-icon">
                PG
            </div>

            <div>
                <h2>PGHub</h2>
                <span>Management System</span>
            </div>

        </div>


        <nav class="sidebar-menu">

            <a href="${pageContext.request.contextPath}/admin/dashboard">
                <span>🏠</span>
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/student/list">
                <span>👨‍🎓</span>
                Students
            </a>

            <a href="${pageContext.request.contextPath}/property/list">
                <span>🏢</span>
                Properties
            </a>

            <a href="${pageContext.request.contextPath}/room/list">
                <span>🚪</span>
                Rooms
            </a>

            <a href="${pageContext.request.contextPath}/allocation/list">
                <span>🛏️</span>
                Allocations
            </a>

            <a href="${pageContext.request.contextPath}/payment/list">
                <span>💰</span>
                Payments
            </a>

            <a class="active"
               href="${pageContext.request.contextPath}/complaint/list">
                <span>📝</span>
                Complaints
            </a>

            <a href="${pageContext.request.contextPath}/visitor/list">
                <span>👥</span>
                Visitors
            </a>

        </nav>


        <div class="sidebar-footer">

            <a href="${pageContext.request.contextPath}/admin/logout">
                <span>🚪</span>
                Logout
            </a>

        </div>

    </aside>


    <!-- ================= MAIN CONTENT ================= -->

    <main class="main-content">

        <!-- TOP HEADER -->

        <header class="top-header">

            <div>

                <h1>

                    <c:choose>

                        <c:when test="${not empty complaint and complaint.id > 0}">
                            Edit Complaint
                        </c:when>

                        <c:otherwise>
                            Add Complaint
                        </c:otherwise>

                    </c:choose>

                </h1>

                <p>
                    Manage student complaints
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


        <!-- ================= CONTENT ================= -->

        <section class="content-area">

            <!-- PAGE TOOLBAR -->

            <div class="page-toolbar">

                <div>

                    <h2>

                        <c:choose>

                            <c:when test="${not empty complaint and complaint.id > 0}">
                                Update Complaint
                            </c:when>

                            <c:otherwise>
                                New Complaint
                            </c:otherwise>

                        </c:choose>

                    </h2>

                    <p>
                        Enter the complaint details and assign it to a student.
                    </p>

                </div>


                <div class="toolbar-actions">

                    <a href="${pageContext.request.contextPath}/complaint/list"
                       class="btn btn-secondary">

                        ← Complaint List

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


            <!-- ================= FORM CARD ================= -->

            <div class="form-card">

                <div class="form-card-header">

                    <div>

                        <h3>
                            Complaint Information
                        </h3>

                        <p>
                            Fill in all required fields marked with *
                        </p>

                    </div>

                    <div class="card-header-icon">
                        📝
                    </div>

                </div>


                <!-- ================= FORM ================= -->

                <form method="post"
                      action="${pageContext.request.contextPath}${complaint.id > 0 ? '/complaint/update' : '/complaint/save'}">


                    <!-- Hidden ID -->

                    <c:if test="${not empty complaint and complaint.id > 0}">

                        <input type="hidden"
                               name="id"
                               value="${complaint.id}">

                    </c:if>


                    <div class="form-grid">


                        <!-- ================= STUDENT ================= -->

                        <div class="form-group">

                            <label for="studentId">

                                Student

                                <span>*</span>

                            </label>


                            <select id="studentId"
                                    name="studentId"
                                    required>

                                <option value="">
                                    -- Select Student --
                                </option>


                                <c:forEach
                                    var="student"
                                    items="${students}">

                                    <option
                                        value="${student.id}"

                                        <c:if test="${complaint.studentId == student.id}">
                                            selected
                                        </c:if>>

                                        ${student.name}
                                        - ${student.email}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>


                        <!-- ================= CATEGORY ================= -->

                        <div class="form-group">

                            <label for="category">

                                Complaint Category

                                <span>*</span>

                            </label>


                            <select id="category"
                                    name="category"
                                    required>

                                <option value="">
                                    -- Select Category --
                                </option>


                                <option value="Maintenance"

                                    <c:if test="${complaint.category == 'Maintenance'}">
                                        selected
                                    </c:if>>

                                    Maintenance

                                </option>


                                <option value="Electrical"

                                    <c:if test="${complaint.category == 'Electrical'}">
                                        selected
                                    </c:if>>

                                    Electrical

                                </option>


                                <option value="Plumbing"

                                    <c:if test="${complaint.category == 'Plumbing'}">
                                        selected
                                    </c:if>>

                                    Plumbing

                                </option>


                                <option value="Cleanliness"

                                    <c:if test="${complaint.category == 'Cleanliness'}">
                                        selected
                                    </c:if>>

                                    Cleanliness

                                </option>


                                <option value="Food"

                                    <c:if test="${complaint.category == 'Food'}">
                                        selected
                                    </c:if>>

                                    Food

                                </option>


                                <option value="Other"

                                    <c:if test="${complaint.category == 'Other'}">
                                        selected
                                    </c:if>>

                                    Other

                                </option>

                            </select>

                        </div>


                        <!-- ================= DESCRIPTION ================= -->

                        <div class="form-group form-group-full">

                            <label for="description">

                                Complaint Description

                                <span>*</span>

                            </label>


                            <textarea id="description"
                                      name="description"
                                      rows="5"
                                      maxlength="255"
                                      placeholder="Describe the complaint in detail"
                                      required>${complaint.description}</textarea>


                            <small>
                                Maximum 255 characters.
                            </small>

                        </div>


                        <!-- ================= STATUS ================= -->

                        <div class="form-group">

                            <label for="status">

                                Complaint Status

                                <span>*</span>

                            </label>


                            <select id="status"
                                    name="status"
                                    required>


                                <option value="Open"

                                    <c:if test="${complaint.status == 'Open' or empty complaint.status}">
                                        selected
                                    </c:if>>

                                    Open

                                </option>


                                <option value="In_Progress"

                                    <c:if test="${complaint.status == 'In_Progress'}">
                                        selected
                                    </c:if>>

                                    In Progress

                                </option>


                                <option value="Resolved"

                                    <c:if test="${complaint.status == 'Resolved'}">
                                        selected
                                    </c:if>>

                                    Resolved

                                </option>

                            </select>

                        </div>

                    </div>


                    <!-- ================= INFORMATION BOX ================= -->

                    <div class="alert alert-info">

                        <strong>
                            Note:
                        </strong>

                        New complaints are normally created with
                        <strong>Open</strong> status and can be updated
                        by the administrator.

                    </div>


                    <!-- ================= FORM ACTIONS ================= -->

                    <div class="form-actions">

                        <a href="${pageContext.request.contextPath}/complaint/list"
                           class="btn btn-secondary">

                            Cancel

                        </a>


                        <button type="submit"
                                class="btn btn-primary">

                            <c:choose>

                                <c:when test="${not empty complaint and complaint.id > 0}">

                                    Update Complaint

                                </c:when>

                                <c:otherwise>

                                    Save Complaint

                                </c:otherwise>

                            </c:choose>

                        </button>

                    </div>


                </form>

            </div>

        </section>


        <!-- ================= FOOTER ================= -->

        <footer class="footer">

            <p>
                © 2026 Student PG Management System
            </p>

        </footer>

    </main>

</div>

</body>

</html>