package org.techhub.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {


@Override
public boolean preHandle(
        HttpServletRequest request,
        HttpServletResponse response,
        Object handler) throws Exception {

    String uri = request.getRequestURI();
    String contextPath = request.getContextPath();

    HttpSession session =
            request.getSession(false);

    /*
     * =====================================================
     * ADMIN PAGES
     * =====================================================
     */

    if (uri.startsWith(
            contextPath + "/admin/")) {

        // Allow admin login page
        if (uri.equals(
                contextPath + "/admin/login")) {

            return true;
        }

        // Check admin session
        if (session != null
                && session.getAttribute(
                        "adminUsername") != null) {

            return true;
        }

        response.sendRedirect(
                contextPath + "/admin/login");

        return false;
    }


    /*
     * =====================================================
     * ADMIN STUDENT MANAGEMENT
     * =====================================================
     *
     * These URLs are under /student/, but they are
     * administrative operations.
     */

    if (uri.equals(contextPath + "/student/add")
            || uri.equals(contextPath + "/student/save")
            || uri.equals(contextPath + "/student/list")
            || uri.equals(contextPath + "/student/delete")
            || uri.equals(contextPath + "/student/edit")
            || uri.equals(contextPath + "/student/update")) {

        if (session != null
                && session.getAttribute(
                        "adminUsername") != null) {

            return true;
        }

        /*
         * /student/edit and /student/update can also
         * be used by a logged-in student for their own
         * profile.
         */
        if (uri.equals(
                    contextPath + "/student/edit")
                || uri.equals(
                    contextPath + "/student/update")) {

            if (session != null
                    && session.getAttribute(
                            "studentId") != null) {

                return true;
            }
        }

        response.sendRedirect(
                contextPath + "/admin/login");

        return false;
    }


    /*
     * =====================================================
     * STUDENT PAGES
     * =====================================================
     */

    if (uri.equals(contextPath + "/student/login")
            || uri.equals(contextPath + "/student/dashboard")
            || uri.equals(contextPath + "/student/profile")) {

        // Allow student login page
        if (uri.equals(
                contextPath + "/student/login")) {

            return true;
        }

        // Check student session
        if (session != null
                && session.getAttribute(
                        "studentId") != null) {

            return true;
        }

        response.sendRedirect(
                contextPath + "/student/login");

        return false;
    }


    /*
     * =====================================================
     * STUDENT ALLOCATION / PAYMENT / COMPLAINT /
     * VISITOR PAGES
     * =====================================================
     */

    if (uri.startsWith(
                contextPath + "/allocation/my")
            || uri.startsWith(
                contextPath + "/payment/my")
            || uri.startsWith(
                contextPath + "/complaint/my")
            || uri.startsWith(
                contextPath + "/complaint/student/")
            || uri.startsWith(
                contextPath + "/visitor/my")
            || uri.startsWith(
                contextPath + "/visitor/student/")) {

        if (session != null
                && session.getAttribute(
                        "studentId") != null) {

            return true;
        }

        response.sendRedirect(
                contextPath + "/student/login");

        return false;
    }


    /*
     * =====================================================
     * OTHER URLs
     * =====================================================
     */

    return true;
}

}
