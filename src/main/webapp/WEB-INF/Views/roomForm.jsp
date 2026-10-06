<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>
<head><meta charset="UTF-8">

<title>
    <c:choose>
        <c:when test="${not empty room and room.id > 0}">
            Edit Room
        </c:when>
        <c:otherwise>
            Add Room
        </c:otherwise>
    </c:choose>
    - PGHub
</title>

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/CSS/style.css">

<style>

    .form-card {
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0 3px 14px rgba(15, 23, 42, 0.08);
        overflow: hidden;
        max-width: 950px;
        margin: 0 auto;
    }

    .form-card-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 22px 25px;
        border-bottom: 1px solid #e5e7eb;
        background: #ffffff;
    }

    .form-card-header h3 {
        margin: 0 0 5px;
        color: #172554;
        font-size: 19px;
    }

    .form-card-header p {
        margin: 0;
        color: #64748b;
        font-size: 13px;
    }

    .card-header-icon {
        width: 48px;
        height: 48px;
        border-radius: 10px;
        background: #eff6ff;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 23px;
    }

    .room-form {
        padding: 28px;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 22px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
    }

    .form-group-full {
        grid-column: 1 / -1;
    }

    .form-group label {
        margin-bottom: 8px;
        font-size: 14px;
        font-weight: 600;
        color: #334155;
    }

    .form-group label span {
        color: #dc2626;
        margin-left: 2px;
    }

    .form-group input,
    .form-group select {
        width: 100%;
        height: 44px;
        padding: 10px 13px;
        border: 1px solid #cbd5e1;
        border-radius: 7px;
        outline: none;
        font-family: Arial, sans-serif;
        font-size: 14px;
        color: #1f2937;
        background: #ffffff;
        transition: 0.2s;
        box-sizing: border-box;
    }

    .form-group input:focus,
    .form-group select:focus {
        border-color: #2563eb;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
    }

    .form-group input::placeholder {
        color: #94a3b8;
    }

    .form-group input[readonly] {
        background: #f8fafc;
        color: #64748b;
        cursor: not-allowed;
    }

    .field-help {
        margin-top: 6px;
        font-size: 12px;
        color: #64748b;
        line-height: 1.4;
    }

    .form-actions {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        margin-top: 30px;
        padding-top: 22px;
        border-top: 1px solid #e5e7eb;
    }

    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 10px 17px;
        border-radius: 7px;
        text-decoration: none;
        border: none;
        cursor: pointer;
        font-size: 14px;
        font-weight: 500;
        transition: 0.2s;
    }

    .btn-primary {
        background: #2563eb;
        color: #ffffff;
    }

    .btn-primary:hover {
        background: #1d4ed8;
    }

    .btn-secondary {
        background: #475569;
        color: #ffffff;
    }

    .btn-secondary:hover {
        background: #334155;
    }

    .alert {
        max-width: 950px;
        margin: 0 auto 20px;
        padding: 14px 17px;
        border-radius: 8px;
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

    .form-note {
        max-width: 950px;
        margin: 18px auto 0;
        font-size: 12px;
        color: #64748b;
    }

    @media (max-width: 700px) {

        .form-grid {
            grid-template-columns: 1fr;
        }

        .form-group-full {
            grid-column: auto;
        }

        .room-form {
            padding: 20px;
        }

        .form-card-header {
            padding: 18px;
        }

        .form-actions {
            flex-direction: column-reverse;
        }

        .form-actions .btn {
            width: 100%;
        }
    }

</style></head>

<body>

<div class="app-layout">

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

        <a class="active"
           href="${pageContext.request.contextPath}/room/list">
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


<main class="main-content">

    <header class="top-header">

        <div>

            <h1>

                <c:choose>

                    <c:when test="${not empty room and room.id > 0}">
                        Edit Room
                    </c:when>

                    <c:otherwise>
                        Add Room
                    </c:otherwise>

                </c:choose>

            </h1>

            <p>
                Manage PG room information
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


    <section class="content-area">

        <div class="page-toolbar">

            <div>

                <h2>

                    <c:choose>

                        <c:when test="${not empty room and room.id > 0}">
                            Update Room
                        </c:when>

                        <c:otherwise>
                            New Room
                        </c:otherwise>

                    </c:choose>

                </h2>

                <p>
                    Enter the room details and select the property.
                </p>

            </div>

            <div class="toolbar-actions">

                <a href="${pageContext.request.contextPath}/room/list"
                   class="btn btn-secondary">
                    ← Room List
                </a>

            </div>

        </div>


        <c:if test="${not empty error}">

            <div class="alert alert-danger">

                <strong>⚠ Error:</strong>
                &nbsp;
                ${error}

            </div>

        </c:if>


        <c:if test="${not empty message}">

            <div class="alert alert-success">

                <strong>✓ Success:</strong>
                &nbsp;
                ${message}

            </div>

        </c:if>


        <div class="form-card">

            <div class="form-card-header">

                <div>

                    <h3>
                        🚪 Room Information
                    </h3>

                    <p>
                        Fill in all required fields marked with *
                    </p>

                </div>

                <div class="card-header-icon">
                    🚪
                </div>

            </div>


            <form method="post"
                  action="${pageContext.request.contextPath}${room.id > 0 ? '/room/update' : '/room/save'}"
                  class="room-form">

                <c:if test="${not empty room and room.id > 0}">

                    <input type="hidden"
                           name="id"
                           value="${room.id}">

                </c:if>


                <div class="form-grid">

                    <div class="form-group">

                        <label for="propertyId">
                            Property
                            <span>*</span>
                        </label>

                        <select id="propertyId"
                                name="propertyId"
                                required>

                            <option value="">
                                -- Select Property --
                            </option>

                            <c:forEach
                                var="property"
                                items="${properties}">

                                <option
                                    value="${property.id}"
                                    <c:if test="${room.propertyId == property.id}">
                                        selected
                                    </c:if>>

                                    ${property.propertyName}

                                </option>

                            </c:forEach>

                        </select>

                        <div class="field-help">
                            Select the PG property where this room is located.
                        </div>

                    </div>


                    <div class="form-group">

                        <label for="roomNumber">
                            Room Number
                            <span>*</span>
                        </label>

                        <input type="text"
                               id="roomNumber"
                               name="roomNumber"
                               value="${room.roomNumber}"
                               placeholder="Example: 101"
                               maxlength="20"
                               required>

                        <div class="field-help">
                            Example: 101, A-101, Ground-01.
                        </div>

                    </div>


                    <div class="form-group">

                        <label for="capacity">
                            Capacity
                            <span>*</span>
                        </label>

                        <input type="number"
                               id="capacity"
                               name="capacity"
                               value="${room.capacity}"
                               min="1"
                               required>

                        <div class="field-help">
                            Maximum number of students allowed in the room.
                        </div>

                    </div>


                    <div class="form-group">

                        <label for="sharingType">
                            Sharing Type
                            <span>*</span>
                        </label>

                        <select id="sharingType"
                                name="sharingType"
                                required>

                            <option value="">
                                -- Select Sharing Type --
                            </option>

                            <option value="Single"
                                <c:if test="${room.sharingType == 'Single'}">
                                    selected
                                </c:if>>
                                Single
                            </option>

                            <option value="Double"
                                <c:if test="${room.sharingType == 'Double'}">
                                    selected
                                </c:if>>
                                Double
                            </option>

                            <option value="Triple"
                                <c:if test="${room.sharingType == 'Triple'}">
                                    selected
                                </c:if>>
                                Triple
                            </option>

                            <option value="Four Sharing"
                                <c:if test="${room.sharingType == 'Four Sharing'}">
                                    selected
                                </c:if>>
                                Four Sharing
                            </option>

                        </select>

                        <div class="field-help">
                            Select the room's sharing arrangement.
                        </div>

                    </div>


                    <div class="form-group">

                        <label for="rentAmount">
                            Rent Amount
                            <span>*</span>
                        </label>

                        <input type="number"
                               id="rentAmount"
                               name="rentAmount"
                               value="${room.rentAmount}"
                               min="0"
                               step="0.01"
                               placeholder="Monthly rent"
                               required>

                        <div class="field-help">
                            Enter the monthly rent amount in ₹.
                        </div>

                    </div>


                    <div class="form-group">

                        <label for="status">
                            Room Status
                        </label>

                        <input type="text"
                               id="status"
                               name="status"
                               value="${room.status}"
                               readonly>

                        <div class="field-help">
                            Room status is managed automatically based on
                            active allocations and room capacity.
                        </div>

                    </div>

                </div>


                <div class="form-actions">

                    <a href="${pageContext.request.contextPath}/room/list"
                       class="btn btn-secondary">
                        Cancel
                    </a>

                    <button type="submit"
                            class="btn btn-primary">

                        <c:choose>

                            <c:when test="${not empty room and room.id > 0}">
                                ✓ Update Room
                            </c:when>

                            <c:otherwise>
                                ✓ Save Room
                            </c:otherwise>

                        </c:choose>

                    </button>

                </div>

            </form>

        </div>


        <div class="form-note">
            * All required fields must be filled before saving the room.
        </div>

    </section>


    <footer class="footer">

        <p>
            © 2026 Student PG Management System
        </p>

    </footer>

</main>

</div>

</body>
</html>
