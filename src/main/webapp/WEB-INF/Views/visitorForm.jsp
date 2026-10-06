<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
uri="jakarta.tags.core"%>

<%@ taglib prefix="fmt"
uri="jakarta.tags.fmt"%>

<!-- Format date-time values before using them in HTML inputs -->

<c:if test="${not empty visitor.entryTime}">
<fmt:formatDate
value="${visitor.entryTime}"
pattern="yyyy-MM-dd'T'HH:mm"
var="formattedEntryTime"/>
</c:if>

<c:if test="${not empty visitor.exitTime}">
<fmt:formatDate
value="${visitor.exitTime}"
pattern="yyyy-MM-dd'T'HH:mm"
var="formattedExitTime"/>
</c:if>

<!DOCTYPE html>

<html>

<head><meta charset="UTF-8">

<title>
    <c:choose>
        <c:when test="${not empty visitor and visitor.id > 0}">
            Edit Visitor
        </c:when>

        <c:otherwise>
            Add Visitor
        </c:otherwise>
    </c:choose>
    - Student PG
</title>

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/CSS/style.css"></head>

<body>

<div class="app-layout">

```
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


        <a href="${pageContext.request.contextPath}/complaint/list">
            <span>📝</span>
            Complaints
        </a>


        <a class="active"
           href="${pageContext.request.contextPath}/visitor/list">

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


    <!-- ================= TOP HEADER ================= -->

    <header class="top-header">

        <div>

            <h1>

                <c:choose>

                    <c:when test="${not empty visitor and visitor.id > 0}">
                        Edit Visitor
                    </c:when>

                    <c:otherwise>
                        Add Visitor
                    </c:otherwise>

                </c:choose>

            </h1>

            <p>
                Manage PG visitor information
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


        <!-- ================= PAGE TOOLBAR ================= -->

        <div class="page-toolbar">

            <div>

                <h2>

                    <c:choose>

                        <c:when test="${not empty visitor and visitor.id > 0}">
                            Update Visitor
                        </c:when>

                        <c:otherwise>
                            New Visitor
                        </c:otherwise>

                    </c:choose>

                </h2>

                <p>
                    Enter visitor details and visit timing.
                </p>

            </div>


            <div class="toolbar-actions">

                <a href="${pageContext.request.contextPath}/visitor/list"
                   class="btn btn-secondary">

                    ← Visitor List

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
                        Fill in all required fields marked with *
                    </p>

                </div>


                <div class="card-header-icon">
                    👥
                </div>

            </div>


            <!-- ================= FORM ================= -->

            <form method="post"
                  action="${pageContext.request.contextPath}${visitor.id > 0 ? '/visitor/update' : '/visitor/save'}">


                <!-- ================= HIDDEN ID ================= -->

                <c:if test="${not empty visitor and visitor.id > 0}">

                    <input type="hidden"
                           name="id"
                           value="${visitor.id}">

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


                            <c:forEach var="student"
                                       items="${students}">

                                <c:choose>

                                    <c:when test="${visitor.studentId == student.id}">

                                        <option value="${student.id}"
                                                selected>

                                            ${student.name} - ${student.email}

                                        </option>

                                    </c:when>


                                    <c:otherwise>

                                        <option value="${student.id}">

                                            ${student.name} - ${student.email}

                                        </option>

                                    </c:otherwise>

                                </c:choose>

                            </c:forEach>

                        </select>

                    </div>


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
                               placeholder="Enter visitor name"
                               maxlength="100"
                               required>

                    </div>


                    <!-- ================= RELATION ================= -->

                    <div class="form-group">

                        <label for="relation">

                            Relation

                            <span>*</span>

                        </label>


                        <select id="relation"
                                name="relation"
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
                               value="${formattedEntryTime}"
                               required>

                    </div>


                    <!-- ================= EXIT TIME ================= -->

                    <div class="form-group">

                        <label for="exitTime">
                            Exit Time
                        </label>


                        <input type="datetime-local"
                               id="exitTime"
                               name="exitTime"
                               value="${formattedExitTime}">


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

                    Exit time must be later than the entry time.
                    It can be left blank for an active visit.

                </div>


                <!-- ================= FORM ACTIONS ================= -->

                <div class="form-actions">


                    <a href="${pageContext.request.contextPath}/visitor/list"
                       class="btn btn-secondary">

                        Cancel

                    </a>


                    <button type="submit"
                            class="btn btn-primary">

                        <c:choose>

                            <c:when test="${not empty visitor and visitor.id > 0}">

                                Update Visitor

                            </c:when>

                            <c:otherwise>

                                Save Visitor

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
