<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>
    <c:choose>
        <c:when test="${student.id > 0}">
            Edit Student
        </c:when>
        <c:otherwise>
            Add Student
        </c:otherwise>
    </c:choose>
</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    background: #f5f7fb;
    color: #1e293b;
}

/* ================= SIDEBAR ================= */

.sidebar {
    width: 250px;
    min-height: 100vh;
    background: linear-gradient(180deg, #0f3d73 0%, #082b52 100%);
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

/* ================= SIDEBAR MENU ================= */

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

/* ================= SIDEBAR FOOTER ================= */

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

/* ================= MAIN CONTENT ================= */

.main-content {
    margin-left: 250px;
    min-height: 100vh;
}

/* ================= TOP HEADER ================= */

.top-header {
    height: 75px;
    background: white;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 30px;

    border-bottom: 1px solid #e2e8f0;
}

.top-header h1 {
    margin: 0;
    font-size: 24px;
    color: #0f3d73;
}

.header-user {
    display: flex;
    align-items: center;
    gap: 10px;

    color: #475569;
    font-size: 14px;
}

.user-icon {
    width: 38px;
    height: 38px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: #e8eef7;
    border-radius: 50%;

    font-size: 18px;
}

/* ================= CONTENT ================= */

.content-area {
    padding: 30px;
}

/* ================= PAGE TOOLBAR ================= */

.page-toolbar {
    display: flex;
    align-items: center;
    justify-content: space-between;

    margin-bottom: 25px;
}

.page-toolbar h2 {
    margin: 0;
    color: #1e293b;
    font-size: 22px;
}

.toolbar-actions {
    display: flex;
    gap: 10px;
}

/* ================= FORM CARD ================= */

.form-card {
    max-width: 900px;
    margin: 0 auto;

    background: white;

    border-radius: 12px;

    padding: 30px;

    box-shadow: 0 4px 20px rgba(15, 61, 115, 0.08);

    transition: all 0.3s ease;
}

.form-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 12px 30px rgba(79, 70, 229, 0.20);
}

/* ================= FORM ================= */

.form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 22px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group.full-width {
    grid-column: 1 / -1;
}

.form-group label {
    margin-bottom: 8px;

    font-size: 14px;
    font-weight: 600;

    color: #334155;
}

.form-group input,
.form-group textarea {
    width: 100%;

    padding: 12px 14px;

    border: 1px solid #cbd5e1;
    border-radius: 7px;

    font-size: 14px;
    font-family: Arial, Helvetica, sans-serif;

    outline: none;

    transition: all 0.2s ease;
}

.form-group input:focus,
.form-group textarea:focus {
    border-color: #2563eb;

    box-shadow:
        0 0 0 3px rgba(37, 99, 235, 0.10);
}

.form-group textarea {
    min-height: 100px;
    resize: vertical;
}

/* ================= BUTTONS ================= */

.form-actions {
    display: flex;
    justify-content: flex-end;

    gap: 12px;

    margin-top: 30px;

    padding-top: 20px;

    border-top: 1px solid #e2e8f0;
}

.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;

    padding: 11px 20px;

    border-radius: 7px;

    text-decoration: none;

    border: none;

    font-size: 14px;
    font-weight: 600;

    cursor: pointer;

    transition: all 0.2s ease;
}

.btn-primary {
    background: #0f3d73;
    color: white;
}

.btn-primary:hover {
    background: #082b52;
    transform: translateY(-2px);
}

.btn-secondary {
    background: #e2e8f0;
    color: #334155;
}

.btn-secondary:hover {
    background: #cbd5e1;
    transform: translateY(-2px);
}

/* ================= INFO ================= */

.form-info {
    margin-bottom: 25px;

    padding: 15px 18px;

    background: #eff6ff;

    border: 1px solid #bfdbfe;

    border-radius: 8px;

    color: #1e40af;

    font-size: 14px;
}

/* ================= FOOTER ================= */

.footer {
    text-align: center;

    padding: 25px;

    color: #64748b;

    font-size: 13px;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 900px) {

    .sidebar {
        width: 210px;
    }

    .main-content {
        margin-left: 210px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .form-group.full-width {
        grid-column: auto;
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

    .top-header {
        padding: 0 20px;
    }

    .content-area {
        padding: 20px;
    }

    .form-card {
        padding: 20px;
    }

    .page-toolbar {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }
}

</style>

</head>

<body>

<div class="app-layout">

    <!-- ================= SIDEBAR ================= -->

    <c:choose>

        <c:when test="${not empty sessionScope.studentId}">

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

                    <a href="${pageContext.request.contextPath}/student/dashboard">

                        <span class="menu-icon">🏠</span>

                        <span class="menu-text">
                            Dashboard
                        </span>

                    </a>


                    <a href="${pageContext.request.contextPath}/student/profile"
                       class="active">

                        <span class="menu-icon">👤</span>

                        <span class="menu-text">
                            My Profile
                        </span>

                    </a>


                    <a href="${pageContext.request.contextPath}/allocation/my">

                        <span class="menu-icon">🛏️</span>

                        <span class="menu-text">
                            My Allocation
                        </span>

                    </a>


                    <a href="${pageContext.request.contextPath}/payment/my">

                        <span class="menu-icon">💰</span>

                        <span class="menu-text">
                            My Payments
                        </span>

                    </a>


                    <a href="${pageContext.request.contextPath}/complaint/my">

                        <span class="menu-icon">📝</span>

                        <span class="menu-text">
                            My Complaints
                        </span>

                    </a>


                    <a href="${pageContext.request.contextPath}/visitor/my">

                        <span class="menu-icon">👥</span>

                        <span class="menu-text">
                            My Visitors
                        </span>

                    </a>

                </nav>


                <div class="sidebar-footer">

                    <a href="${pageContext.request.contextPath}/student/logout">

                        <span class="menu-icon">🚪</span>

                        <span class="menu-text">
                            Logout
                        </span>

                    </a>

                </div>

            </aside>

        </c:when>


        <c:otherwise>

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


                    <a href="${pageContext.request.contextPath}/student/list"
                       class="active">

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

                        <span class="menu-icon">🚪</span>

                        <span class="menu-text">
                            Rooms
                        </span>

                    </a>


                    <a href="${pageContext.request.contextPath}/allocation/list">

                        <span class="menu-icon">🛏️</span>

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


                    <a href="${pageContext.request.contextPath}/visitor/list">

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

        </c:otherwise>

    </c:choose>


    <!-- ================= MAIN CONTENT ================= -->

    <main class="main-content">

        <header class="top-header">

            <h1>
                <c:choose>

                    <c:when test="${student.id > 0}">
                        Edit Profile
                    </c:when>

                    <c:otherwise>
                        Add Student
                    </c:otherwise>

                </c:choose>
            </h1>


            <div class="header-user">

                <div class="user-icon">
                    👤
                </div>

                <c:choose>

                    <c:when test="${not empty sessionScope.studentId}">

                        <span>
                            ${sessionScope.studentName}
                        </span>

                    </c:when>

                    <c:otherwise>

                        <span>
                            Administrator
                        </span>

                    </c:otherwise>

                </c:choose>

            </div>

        </header>


        <section class="content-area">


            <!-- ================= PAGE TOOLBAR ================= -->

            <div class="page-toolbar">

                <h2>

                    <c:choose>

                        <c:when test="${student.id > 0}">
                            Edit Student Information
                        </c:when>

                        <c:otherwise>
                            Add New Student
                        </c:otherwise>

                    </c:choose>

                </h2>


                <div class="toolbar-actions">

                    <c:choose>

                        <c:when test="${not empty sessionScope.studentId}">

                            <a
                                href="${pageContext.request.contextPath}/student/profile"
                                class="btn btn-secondary">

                                ← My Profile

                            </a>

                        </c:when>


                        <c:otherwise>

                            <a
                                href="${pageContext.request.contextPath}/student/list"
                                class="btn btn-secondary">

                                ← Student List

                            </a>

                        </c:otherwise>

                    </c:choose>

                </div>

            </div>


            <!-- ================= INFORMATION ================= -->

            <div class="form-info">

                <c:choose>

                    <c:when test="${not empty sessionScope.studentId}">

                        Update your personal information below.
                        Make sure that your mobile number and other
                        details are correct.

                    </c:when>

                    <c:otherwise>

                        Enter the student's information carefully.
                        All required information should be correct.

                    </c:otherwise>

                </c:choose>

            </div>


            <!-- ================= FORM ================= -->

            <div class="form-card">

                <form
                    method="post"
                    action="${pageContext.request.contextPath}${student.id > 0 ? '/student/update' : '/student/save'}">


                    <c:if test="${student.id > 0}">

                        <input
                            type="hidden"
                            name="id"
                            value="${student.id}">

                    </c:if>


                    <div class="form-grid">


                        <!-- NAME -->

                        <div class="form-group">

                            <label for="name">
                                Full Name
                            </label>

                            <input
                                type="text"
                                id="name"
                                name="name"
                                value="${student.name}"
                                placeholder="Enter full name"
                                required>

                        </div>


                        <!-- EMAIL -->

                        <div class="form-group">

                            <label for="email">
                                Email Address
                            </label>

                            <input
                                type="email"
                                id="email"
                                name="email"
                                value="${student.email}"
                                placeholder="Enter email address"
                                required>

                        </div>


                        <!-- MOBILE -->

                        <div class="form-group">

                            <label for="mobile">
                                Mobile Number
                            </label>

                            <input
                                type="text"
                                id="mobile"
                                name="mobile"
                                value="${student.mobile}"
                                placeholder="Enter mobile number"
                                required>

                        </div>


                        <!-- GUARDIAN MOBILE -->

                        <div class="form-group">

                            <label for="guardianMobile">
                                Guardian Mobile
                            </label>

                            <input
                                type="text"
                                id="guardianMobile"
                                name="guardianMobile"
                                value="${student.guardianMobile}"
                                placeholder="Enter guardian mobile number">

                        </div>


                        <!-- ADDRESS -->

                        <div class="form-group full-width">

                            <label for="address">
                                Address
                            </label>

                            <textarea
                                id="address"
                                name="address"
                                placeholder="Enter address">${student.address}</textarea>

                        </div>


                        <!-- ID PROOF -->

                        <div class="form-group full-width">

                            <label for="idProof">
                                ID Proof
                            </label>

                            <input
                                type="text"
                                id="idProof"
                                name="idProof"
                                value="${student.idProof}"
                                placeholder="Enter ID proof details">

                        </div>


                    </div>


                    <!-- ================= ACTION BUTTONS ================= -->

                    <div class="form-actions">


                        <c:choose>

                            <c:when test="${not empty sessionScope.studentId}">

                                <a
                                    href="${pageContext.request.contextPath}/student/profile"
                                    class="btn btn-secondary">

                                    Cancel

                                </a>

                            </c:when>


                            <c:otherwise>

                                <a
                                    href="${pageContext.request.contextPath}/student/list"
                                    class="btn btn-secondary">

                                    Cancel

                                </a>

                            </c:otherwise>

                        </c:choose>


                        <button
                            type="submit"
                            class="btn btn-primary">

                            <c:choose>

                                <c:when test="${student.id > 0}">
                                    Update Profile
                                </c:when>

                                <c:otherwise>
                                    Save Student
                                </c:otherwise>

                            </c:choose>

                        </button>


                    </div>


                </form>

            </div>


            <div class="footer">

                PGHub &copy; 2026. All Rights Reserved.

            </div>


        </section>

    </main>

</div>

</body>
</html>