<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head><meta charset="UTF-8">

<title>Add Visitor - PGHub</title>

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/CSS/style.css"></head>

<body>

<div class="app-layout">

```
<!-- ================= SIDEBAR ================= -->

<aside class="sidebar">


    <!-- LOGO -->

    <div class="logo-section">

        <div class="logo-icon">
            PG
        </div>

        <div>

            <h2>PGHub</h2>

            <span>Student Portal</span>

        </div>

    </div>


    <!-- NAVIGATION -->

    <nav class="sidebar-menu">


        <a href="${pageContext.request.contextPath}/student/dashboard">

            <span>🏠</span>

            Dashboard

        </a>


        <a href="${pageContext.request.contextPath}/student/profile">

            <span>👤</span>

            My Profile

        </a>


        <a href="${pageContext.request.contextPath}/allocation/my">

            <span>🛏️</span>

            My Allocation

        </a>


        <a href="${pageContext.request.contextPath}/payment/my">

            <span>💰</span>

            My Payments

        </a>


        <a href="${pageContext.request.contextPath}/complaint/my">

            <span>📝</span>

            My Complaints

        </a>


        <a class="active"
           href="${pageContext.request.contextPath}/visitor/my">

            <span>👥</span>

            My Visitors

        </a>

    </nav>


    <!-- LOGOUT -->

    <div class="sidebar-footer">

        <a href="${pageContext.request.contextPath}/student/logout">

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
                Add Visitor
            </h1>

            <p>
                Record a visitor for your accommodation
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


    <!-- ================= CONTENT ================= -->

    <section class="content-area">


        <!-- PAGE TOOLBAR -->

        <div class="page-toolbar">

            <div>

                <h2>
                    New Visitor
                </h2>

                <p>
                    Enter the visitor details and visit timing.
                </p>

            </div>


            <div class="toolbar-actions">

                <a href="${pageContext.request.contextPath}/visitor/my"
                   class="btn btn-secondary">

                    ← My Visitors

                </a>

            </div>

        </div>


        <!-- ================= ERROR MESSAGE ================= -->

        <c:if test="${not empty error}">

            <div class="alert alert-danger">

                <strong>
                    Error:
                </strong>

                ${error}

            </div>

        </c:if>


        <!-- ================= SUCCESS MESSAGE ================= -->

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
                        Visitor Information
                    </h3>

                    <p>
                        Fill in the visitor details.
                    </p>

                </div>


                <div class="card-header-icon">
                    👥
                </div>

            </div>


            <!-- ================= FORM ================= -->

            <form action="${pageContext.request.contextPath}/visitor/student/save"
                  method="post">


                <div class="form-grid">


                    <!-- ================= VISITOR NAME ================= -->

                    <div class="form-group">

                        <label for="visitorName">

                            Visitor Name

                            <span>*</span>

                        </label>


                        <input type="text"
                               id="visitorName"
                               name="visitorName"
                               value="${visitor.visitorName}"
                               maxlength="100"
                               placeholder="Enter visitor name"
                               required>

                    </div>


                    <!-- ================= RELATION ================= -->

                    <div class="form-group">

                        <label for="relation">

                            Relation

                            <span>*</span>

                        </label>


                        <select name="relation"
                                id="relation"
                                required>

                            <option value="">
                                -- Select Relation --
                            </option>


                            <c:choose>

                                <c:when test="${visitor.relation == 'Parent'}">

                                    <option value="Parent" selected>
                                        Parent
                                    </option>

                                </c:when>

                                <c:otherwise>

                                    <option value="Parent">
                                        Parent
                                    </option>

                                </c:otherwise>

                            </c:choose>


                            <c:choose>

                                <c:when test="${visitor.relation == 'Sibling'}">

                                    <option value="Sibling" selected>
                                        Sibling
                                    </option>

                                </c:when>

                                <c:otherwise>

                                    <option value="Sibling">
                                        Sibling
                                    </option>

                                </c:otherwise>

                            </c:choose>


                            <c:choose>

                                <c:when test="${visitor.relation == 'Friend'}">

                                    <option value="Friend" selected>
                                        Friend
                                    </option>

                                </c:when>

                                <c:otherwise>

                                    <option value="Friend">
                                        Friend
                                    </option>

                                </c:otherwise>

                            </c:choose>


                            <c:choose>

                                <c:when test="${visitor.relation == 'Relative'}">

                                    <option value="Relative" selected>
                                        Relative
                                    </option>

                                </c:when>

                                <c:otherwise>

                                    <option value="Relative">
                                        Relative
                                    </option>

                                </c:otherwise>

                            </c:choose>


                            <c:choose>

                                <c:when test="${visitor.relation == 'Other'}">

                                    <option value="Other" selected>
                                        Other
                                    </option>

                                </c:when>

                                <c:otherwise>

                                    <option value="Other">
                                        Other
                                    </option>

                                </c:otherwise>

                            </c:choose>

                        </select>

                    </div>


                    <!-- ================= ENTRY TIME ================= -->

                    <div class="form-group">

                        <label for="entryTime">

                            Entry Time

                            <span>*</span>

                        </label>


                        <input type="datetime-local"
                               id="entryTime"
                               name="entryTime"
                               value="${visitor.entryTime}"
                               required>


                        <small>

                            Enter the visitor's arrival date and time.

                        </small>

                    </div>


                    <!-- ================= EXIT TIME ================= -->

                    <div class="form-group">

                        <label for="exitTime">

                            Exit Time

                        </label>


                        <input type="datetime-local"
                               id="exitTime"
                               name="exitTime">


                        <small>

                            Leave blank if the visitor is still inside.

                        </small>

                    </div>


                </div>


                <!-- ================= INFORMATION BOX ================= -->

                <div class="alert alert-info">

                    <strong>
                        Note:
                    </strong>

                    Your visitor information is recorded under
                    your student account. Exit time must be later
                    than entry time.

                </div>


                <!-- ================= FORM ACTIONS ================= -->

                <div class="form-actions">


                    <a href="${pageContext.request.contextPath}/visitor/my"
                       class="btn btn-secondary">

                        Cancel

                    </a>


                    <button type="submit"
                            class="btn btn-primary">

                        👥 Save Visitor

                    </button>

                </div>


            </form>

        </div>


        <!-- ================= INFORMATION CARDS ================= -->

        <div class="dashboard-grid">


            <!-- VISITOR GUIDELINES -->

            <div class="card">

                <div class="card-header">

                    <div>

                        <h3>
                            Visitor Guidelines
                        </h3>

                        <p>
                            Keep visitor records accurate
                        </p>

                    </div>


                    <div class="card-icon">
                        💡
                    </div>

                </div>


                <ul class="info-list">

                    <li>
                        Enter the visitor's correct name.
                    </li>

                    <li>
                        Select the appropriate relationship.
                    </li>

                    <li>
                        Enter the actual entry time.
                    </li>

                    <li>
                        Add an exit time after the visitor leaves.
                    </li>

                </ul>

            </div>


            <!-- VISIT STATUS -->

            <div class="card">

                <div class="card-header">

                    <div>

                        <h3>
                            Visit Status
                        </h3>

                        <p>
                            Visitor record information
                        </p>

                    </div>


                    <div class="card-icon">
                        📊
                    </div>

                </div>


                <div class="status-guide">


                    <div>

                        <span class="status-badge status-open">

                            Currently Inside

                        </span>

                        <p>
                            Exit time has not been recorded.
                        </p>

                    </div>


                    <div>

                        <span class="status-badge status-resolved">

                            Completed

                        </span>

                        <p>
                            Exit time has been recorded.
                        </p>

                    </div>


                </div>

            </div>


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
