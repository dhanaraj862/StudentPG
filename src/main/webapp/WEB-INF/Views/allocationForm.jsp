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

            <c:when test="${not empty allocation and allocation.id > 0}">
                Edit Allocation
            </c:when>

            <c:otherwise>
                Add Allocation
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

            <a class="active"
               href="${pageContext.request.contextPath}/allocation/list">
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

                        <c:when
                            test="${not empty allocation and allocation.id > 0}">

                            Edit Allocation

                        </c:when>

                        <c:otherwise>

                            Add Allocation

                        </c:otherwise>

                    </c:choose>

                </h1>

                <p>
                    Manage student room allocation
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

                            <c:when
                                test="${not empty allocation and allocation.id > 0}">

                                Update Allocation

                            </c:when>

                            <c:otherwise>

                                New Allocation

                            </c:otherwise>

                        </c:choose>

                    </h2>

                    <p>
                        Assign a student to an available PG room.
                    </p>

                </div>


                <div class="toolbar-actions">

                    <a href="${pageContext.request.contextPath}/allocation/list"
                       class="btn btn-secondary">

                        ← Allocation List

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
                            Allocation Information
                        </h3>

                        <p>
                            Fill in all required fields marked with *
                        </p>

                    </div>

                    <div class="card-header-icon">
                        🛏️
                    </div>

                </div>



                <!-- ================= FORM ================= -->

                <form method="post"
                      accept-charset="UTF-8"
                      action="${pageContext.request.contextPath}${allocation.id > 0 ? '/allocation/update' : '/allocation/save'}">


                    <!-- Hidden ID for update -->

                    <c:if test="${not empty allocation and allocation.id > 0}">

                        <input type="hidden"
                               name="id"
                               value="${allocation.id}">

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
                                        <c:if test="${allocation.studentId == student.id}">
                                            selected
                                        </c:if>>

                                        ${student.name} - ${student.email}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>



                        <!-- ================= ROOM ================= -->

                        <div class="form-group">

                            <label for="roomId">

                                Room

                                <span>*</span>

                            </label>


                            <select id="roomId"
                                    name="roomId"
                                    required>

                                <option value="">
                                    -- Select Room --
                                </option>


                                <c:forEach
                                    var="room"
                                    items="${rooms}">

                                    <option
                                        value="${room.id}"
                                        <c:if test="${allocation.roomId == room.id}">
                                            selected
                                        </c:if>>

                                        Room ${room.roomNumber}
                                        - ${room.sharingType}
                                        - ${room.rentAmount}
                                        - ${room.status}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>



                        <!-- ================= ALLOCATION DATE ================= -->

                        <div class="form-group">

                            <label for="allocationDate">

                                Allocation Date

                                <span>*</span>

                            </label>


                            <input type="date"
                                   id="allocationDate"
                                   name="allocationDate"
                                   value="${allocation.allocationDate}"
                                   required>

                        </div>



                        <!-- ================= CHECKOUT DATE ================= -->

                        <div class="form-group">

                            <label for="checkoutDate">
                                Checkout Date
                            </label>


                            <input type="date"
                                   id="checkoutDate"
                                   name="checkoutDate"
                                   value="${allocation.checkoutDate}">


                            <small>
                                Leave blank while the allocation is active.
                            </small>

                        </div>



                        <!-- ================= STATUS ================= -->

                        <div class="form-group">

                            <label for="status">
                                Allocation Status
                            </label>


                            <select id="status"
                                    name="status">


                                <option value="Active"
                                    <c:if test="${allocation.status == 'Active' or empty allocation.status}">
                                        selected
                                    </c:if>>

                                    Active

                                </option>


                                <option value="Checked_Out"
                                    <c:if test="${allocation.status == 'Checked_Out'}">
                                        selected
                                    </c:if>>

                                    Checked Out

                                </option>


                            </select>

                        </div>


                    </div>



                    <!-- ================= INFORMATION BOX ================= -->

                    <div class="alert alert-info">

                        <strong>
                            Note:
                        </strong>

                        A student can have only one active room allocation.
                        Room availability is automatically updated according
                        to the room capacity.

                    </div>



                    <!-- ================= FORM ACTIONS ================= -->

                    <div class="form-actions">


                        <a href="${pageContext.request.contextPath}/allocation/list"
                           class="btn btn-secondary">

                            Cancel

                        </a>


                        <button type="submit"
                                class="btn btn-primary">

                            <c:choose>

                                <c:when
                                    test="${not empty allocation and allocation.id > 0}">

                                    Update Allocation

                                </c:when>

                                <c:otherwise>

                                    Save Allocation

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