<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
        <%
            session.invalidate();
            response.sendRedirect("Index.jsp");
        %>
    </body>
</html>