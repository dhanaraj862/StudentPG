<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>
    <c:choose>
        <c:when test="${not empty property and property.id > 0}">
            Edit Property
        </c:when>
        <c:otherwise>
            Add Property
        </c:otherwise>
    </c:choose>
    - PGHub
</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

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

.property-form {
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
.form-group textarea {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    outline: none;
    font-family: Arial, sans-serif;
    font-size: 14px;
    color: #1f2937;
    background: #ffffff;
    transition: 0.2s;
}

.form-group input {
    height: 44px;
}

.form-group textarea {
    resize: vertical;
    min-height: 105px;
    line-height: 1.5;
}

.form-group input:focus,
.form-group textarea:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
}

.form-group input::placeholder,
.form-group textarea::placeholder {
    color: #94a3b8;
}

.field-help {
    margin-top: 6px;
    font-size: 12px;
    color: #64748b;
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

    .property-form {
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

</style>

</head>

<body>

<div class="app-layout">

<!-- SIDEBAR -->

<aside class="sidebar">

```
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

    <a class="active"
       href="${pageContext.request.contextPath}/property/list">
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
```

</aside>

<!-- MAIN CONTENT -->

<main class="main-content">

```
<header class="top-header">

    <div>

        <h1>

            <c:choose>

                <c:when test="${not empty property and property.id > 0}">
                    Edit Property
                </c:when>

                <c:otherwise>
                    Add Property
                </c:otherwise>

            </c:choose>

        </h1>

        <p>
            Manage PG property information
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

                    <c:when test="${not empty property and property.id > 0}">
                        Update Property
                    </c:when>

                    <c:otherwise>
                        New Property
                    </c:otherwise>

                </c:choose>

            </h2>

            <p>
                Enter the property and owner details.
            </p>

        </div>

        <div class="toolbar-actions">

            <a href="${pageContext.request.contextPath}/property/list"
               class="btn btn-secondary">
                ← Property List
            </a>

        </div>

    </div>


    <c:if test="${not empty error}">

        <div class="alert alert-danger">

            <strong>
                ⚠ Error:
            </strong>

            &nbsp;

            ${error}

        </div>

    </c:if>


    <c:if test="${not empty message}">

        <div class="alert alert-success">

            <strong>
                ✓ Success:
            </strong>

            &nbsp;

            ${message}

        </div>

    </c:if>


    <div class="form-card">

        <div class="form-card-header">

            <div>

                <h3>
                    🏢 Property Information
                </h3>

                <p>
                    Fill in all required fields marked with *
                </p>

            </div>

            <div class="card-header-icon">
                🏢
            </div>

        </div>


        <!-- CORRECT FORM ACTION -->

        <form method="post"
              action="${pageContext.request.contextPath}${property.id > 0 ? '/property/update' : '/property/save'}"
              class="property-form">

            <c:if test="${not empty property and property.id > 0}">

                <input type="hidden"
                       name="id"
                       value="${property.id}">

            </c:if>


            <div class="form-grid">

                <div class="form-group">

                    <label for="propertyName">
                        Property Name
                        <span>*</span>
                    </label>

                    <input type="text"
                           id="propertyName"
                           name="propertyName"
                           value="${property.propertyName}"
                           placeholder="Enter property name"
                           maxlength="100"
                           required>

                    <div class="field-help">
                        Example: Sunrise PG
                    </div>

                </div>


                <div class="form-group">

                    <label for="ownerName">
                        Owner Name
                        <span>*</span>
                    </label>

                    <input type="text"
                           id="ownerName"
                           name="ownerName"
                           value="${property.ownerName}"
                           placeholder="Enter owner name"
                           maxlength="100"
                           required>

                    <div class="field-help">
                        Enter the property owner's full name.
                    </div>

                </div>


                <div class="form-group">

                    <label for="contactNumber">
                        Contact Number
                        <span>*</span>
                    </label>

                    <input type="tel"
                           id="contactNumber"
                           name="contactNumber"
                           value="${property.contactNumber}"
                           placeholder="Enter 10-digit contact number"
                           maxlength="10"
                           pattern="[0-9]{10}"
                           inputmode="numeric"
                           required>

                    <div class="field-help">
                        Enter exactly 10 digits.
                    </div>

                </div>


                <div class="form-group form-group-full">

                    <label for="address">
                        Property Address
                        <span>*</span>
                    </label>

                    <textarea
                        id="address"
                        name="address"
                        rows="4"
                        maxlength="255"
                        placeholder="Enter complete property address"
                        required>${property.address}</textarea>

                    <div class="field-help">
                        Maximum 255 characters.
                    </div>

                </div>

            </div>


            <div class="form-actions">

                <a href="${pageContext.request.contextPath}/property/list"
                   class="btn btn-secondary">
                    Cancel
                </a>

                <button type="submit"
                        class="btn btn-primary">

                    <c:choose>

                        <c:when test="${not empty property and property.id > 0}">
                            ✓ Update Property
                        </c:when>

                        <c:otherwise>
                            ✓ Save Property
                        </c:otherwise>

                    </c:choose>

                </button>

            </div>

        </form>

    </div>


    <div class="form-note">
        * All fields marked with an asterisk are required.
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
