<%-- 
    Document   : userhome
    Created on : 3 Feb, 2025, 4:58:39 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String username = (String) session.getAttribute("user");%>
        <jsp:include page="includesidebar.jsp"/>
       <div class="main-content bounce-animation" data-aos="fade-in" data-aos-duration="1500" data-aos-delay="500" data-aos-easing="ease-in-out" style="position: absolute; left: 500px; top: 200px; text-align: center; font-size: 200px;">
    <h1 style="font-size: 40px;">Welcome to <%=username%> Portfolio</h1>
    <p style="font-size: 20px;">Explore the projects I've worked on, my skills, and certifications.</p>
</div>

    </body>
</html>
