<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.Student"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String address = request.getParameter("address");

        Student student = new Student(name, address);

        Configuration cfg = new Configuration();
        cfg.configure("hiber.cfg.xml");
        SessionFactory factory = cfg.buildSessionFactory();
        Session sessionn = factory.openSession();

        Transaction t = sessionn.beginTransaction();

        sessionn.save(student);

        t.commit();
        sessionn.close();

        out.print("Data inserted");
    %>
</body>
</html>
