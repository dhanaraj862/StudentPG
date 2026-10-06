<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Submit Complaint - PGHub</title>

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
                <span>Student Portal</span>
            </div>

        </div>


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

            <a class="active"
               href="${pageContext.request.contextPath}/complaint/my">
                <span>📝</span>
                My Complaints
            </a>

            <a href="${pageContext.request.contextPath}/visitor/my">
                <span>👥</span>
                My Visitors
            </a>

        </nav>


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
                    Submit Complaint
                </h1>

                <p>
                    Report an issue related to your accommodation
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
                        New Complaint
                    </h2>

                    <p>
                        Submit your accommodation-related issue
                        to the administrator.
                    </p>

                </div>


                <div class="toolbar-actions">

                    <a href="${pageContext.request.contextPath}/complaint/my"
                       class="btn btn-secondary">

                        ← My Complaints

                    </a>

                </div>

            </div>


            <!-- ERROR MESSAGE -->

            <c:if test="${not empty error}">

                <div class="alert alert-danger">

                    <strong>Error:</strong>
                    ${error}

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
                            Fill in the details of your complaint.
                        </p>

                    </div>

                    <div class="card-header-icon">
                        📝
                    </div>

                </div>


                <form action="${pageContext.request.contextPath}/complaint/student/save"
                      method="post">


                    <div class="form-grid">

                        <!-- CATEGORY -->

                        <div class="form-group">

                            <label for="category">

                                Complaint Category
                                <span>*</span>

                            </label>


                            <select name="category"
                                    id="category"
                                    required>

                                <option value="">
                                    -- Select Category --
                                </option>

                                <option value="Maintenance">
                                    Maintenance
                                </option>

                                <option value="Electricity">
                                    Electricity
                                </option>

                                <option value="Water">
                                    Water
                                </option>

                                <option value="Cleanliness">
                                    Cleanliness
                                </option>

                                <option value="Other">
                                    Other
                                </option>

                            </select>

                        </div>


                        <!-- STATUS -->

                        <div class="form-group">

                            <label>
                                Complaint Status
                            </label>

                            <div class="status-display">

                                <span class="status-badge status-open">
                                    Open
                                </span>

                            </div>

                            <small>
                                New complaints are automatically submitted
                                with Open status.
                            </small>

                        </div>


                        <!-- DESCRIPTION -->

                        <div class="form-group form-group-full">

                            <label for="description">

                                Complaint Description
                                <span>*</span>

                            </label>


                            <textarea name="description"
                                      id="description"
                                      rows="6"
                                      maxlength="255"
                                      placeholder="Describe your complaint in detail..."
                                      required></textarea>


                            <small>
                                Maximum 255 characters.
                            </small>

                        </div>

                    </div>


                    <!-- INFORMATION BOX -->

                    <div class="alert alert-info">

                        <strong>Note:</strong>

                        Please provide clear and accurate information
                        about the issue. Your complaint will be reviewed
                        by the administrator.

                    </div>


                    <!-- FORM ACTIONS -->

                    <div class="form-actions">

                        <a href="${pageContext.request.contextPath}/complaint/my"
                           class="btn btn-secondary">

                            Cancel

                        </a>


                        <button type="submit"
                                class="btn btn-primary">

                            📝 Submit Complaint

                        </button>

                    </div>

                </form>

            </div>


            <!-- ================= HELP CARDS ================= -->

            <div class="dashboard-grid">

                <div class="card">

                    <div class="card-header">

                        <div>

                            <h3>
                                Before Submitting
                            </h3>

                            <p>
                                Provide useful information
                            </p>

                        </div>

                        <div class="card-icon">
                            💡
                        </div>

                    </div>

                    <ul class="info-list">

                        <li>
                            Select the correct complaint category.
                        </li>

                        <li>
                            Clearly describe the problem.
                        </li>

                        <li>
                            Mention the room or location if applicable.
                        </li>

                    </ul>

                </div>


                <div class="card">

                    <div class="card-header">

                        <div>

                            <h3>
                                Complaint Status
                            </h3>

                            <p>
                                What happens next?
                            </p>

                        </div>

                        <div class="card-icon">
                            📊
                        </div>

                    </div>

                    <div class="status-guide">

                        <div>
                            <span class="status-badge status-open">
                                Open
                            </span>

                            <p>
                                Complaint has been submitted.
                            </p>
                        </div>

                        <div>
                            <span class="status-badge status-progress">
                                In Progress
                            </span>

                            <p>
                                Administrator is working on the issue.
                            </p>
                        </div>

                        <div>
                            <span class="status-badge status-resolved">
                                Resolved
                            </span>

                            <p>
                                The issue has been resolved.
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