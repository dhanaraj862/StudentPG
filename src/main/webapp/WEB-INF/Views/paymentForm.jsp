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
            <c:when test="${not empty payment and payment.id > 0}">
                Edit Payment
            </c:when>
            <c:otherwise>
                Add Payment
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

            <a class="active"
               href="${pageContext.request.contextPath}/payment/list">
                <span>💰</span>
                Payments
            </a>

            <a href="${pageContext.request.contextPath}/complaint/list">
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

                        <c:when test="${not empty payment and payment.id > 0}">
                            Edit Payment
                        </c:when>

                        <c:otherwise>
                            Add Payment
                        </c:otherwise>

                    </c:choose>

                </h1>

                <p>
                    Manage student rent payments
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

                            <c:when test="${not empty payment and payment.id > 0}">
                                Update Payment
                            </c:when>

                            <c:otherwise>
                                New Payment
                            </c:otherwise>

                        </c:choose>

                    </h2>

                    <p>
                        Enter the rent payment details.
                    </p>

                </div>


                <div class="toolbar-actions">

                    <a href="${pageContext.request.contextPath}/payment/list"
                       class="btn btn-secondary">

                        ← Payment List

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


            <!-- INFORMATION MESSAGE -->

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
                            Payment Information
                        </h3>

                        <p>
                            Fill in all required fields marked with *
                        </p>

                    </div>

                    <div class="card-header-icon">
                        💰
                    </div>

                </div>


                <!-- ================= PAYMENT FORM ================= -->

                <form method="post"
                      action="${pageContext.request.contextPath}${payment.id > 0 ? '/payment/update' : '/payment/save'}">


                    <!-- Hidden ID for Update -->

                    <c:if test="${not empty payment and payment.id > 0}">

                        <input type="hidden"
                               name="id"
                               value="${payment.id}">

                    </c:if>


                    <div class="form-grid">


                        <!-- ================= ALLOCATION ================= -->

                        <div class="form-group form-group-full">

                            <label for="allocationId">

                                Student / Room Allocation

                                <span>*</span>

                            </label>


                            <select id="allocationId"
                                    name="allocationId"
                                    required>

                                <option value="">
                                    -- Select Allocation --
                                </option>


                                <c:forEach
                                    var="allocation"
                                    items="${allocations}">

                                    <option
                                        value="${allocation.id}"

                                        <c:if test="${payment.allocationId == allocation.id}">
                                            selected
                                        </c:if>>

                                        Allocation #${allocation.id}


                                        <!-- Student Name -->

                                        <c:forEach
                                            var="student"
                                            items="${students}">

                                            <c:if test="${student.id == allocation.studentId}">

                                                - ${student.name}

                                            </c:if>

                                        </c:forEach>


                                        <!-- Room Number -->

                                        <c:forEach
                                            var="room"
                                            items="${rooms}">

                                            <c:if test="${room.id == allocation.roomId}">

                                                - Room ${room.roomNumber}

                                            </c:if>

                                        </c:forEach>

                                    </option>

                                </c:forEach>

                            </select>

                        </div>


                        <!-- ================= AMOUNT ================= -->

                        <div class="form-group">

                            <label for="amount">

                                Payment Amount

                                <span>*</span>

                            </label>


                            <input type="number"
                                   id="amount"
                                   name="amount"
                                   value="${payment.amount}"
                                   min="0.01"
                                   step="0.01"
                                   placeholder="Enter payment amount"
                                   required>

                        </div>


                        <!-- ================= PAYMENT DATE ================= -->

                        <div class="form-group">

                            <label for="paymentDate">

                                Payment Date

                                <span>*</span>

                            </label>


                            <input type="date"
                                   id="paymentDate"
                                   name="paymentDate"
                                   value="${payment.paymentDate}"
                                   required>

                        </div>


                        <!-- ================= MONTH / YEAR ================= -->

                        <div class="form-group">

                            <label for="monthYear">

                                Month / Year

                                <span>*</span>

                            </label>


                            <input type="month"
                                   id="monthYear"
                                   name="monthYear"
                                   value="${payment.monthYear}"
                                   required>


                            <small>

                                Select the month for which rent is paid.

                            </small>

                        </div>


                        <!-- ================= PAYMENT STATUS ================= -->

                        <div class="form-group">

                            <label for="paymentStatus">

                                Payment Status

                                <span>*</span>

                            </label>


                            <select id="paymentStatus"
                                    name="paymentStatus"
                                    required>

                                <option value="">
                                    -- Select Status --
                                </option>


                                <option value="Paid"

                                    <c:if test="${payment.paymentStatus == 'Paid'}">
                                        selected
                                    </c:if>>

                                    Paid

                                </option>


                                <option value="Pending"

                                    <c:if test="${payment.paymentStatus == 'Pending'}">
                                        selected
                                    </c:if>>

                                    Pending

                                </option>

                            </select>

                        </div>

                    </div>


                    <!-- ================= INFORMATION BOX ================= -->

                    <div class="alert alert-info">

                        <strong>
                            Note:
                        </strong>

                        Only one payment record can be created for the same
                        allocation and month.

                    </div>


                    <!-- ================= FORM ACTIONS ================= -->

                    <div class="form-actions">


                        <a href="${pageContext.request.contextPath}/payment/list"
                           class="btn btn-secondary">

                            Cancel

                        </a>


                        <button type="submit"
                                class="btn btn-primary">


                            <c:choose>

                                <c:when test="${not empty payment and payment.id > 0}">

                                    Update Payment

                                </c:when>

                                <c:otherwise>

                                    Save Payment

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