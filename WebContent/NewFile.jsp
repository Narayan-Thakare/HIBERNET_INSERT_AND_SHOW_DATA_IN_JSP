<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.Query"%>
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
<table> <!-- Added missing <table> tag -->
    <tr>
        <th>id</th> <!-- Corrected the column name from "name" to "id" -->
        <th>name</th>
        <th>address</th>
    </tr>

    <%
        String name = request.getParameter("name");
        String address = request.getParameter("address");

        Student student = new Student(name, address);

        Configuration cfg = new Configuration();
        cfg.configure("hiber.cfg.xml");

        SessionFactory factory = cfg.buildSessionFactory();
        Session sess = factory.openSession();

        Transaction tr = sess.beginTransaction();

        

        Query query = sess.createQuery("from model.Student");
        ArrayList<Student> studentList = (ArrayList<Student>) query.list(); // Corrected syntax

        for (Student s : studentList) { // Corrected variable name from "u" to "s"
    %>

    <tr>
    <td><%=s.getName() %>
        <td><%= s.getaddress() %></td>
    </tr>

    <%
        }
        
        sess.save(student);

        tr.commit();
        sess.close();
    %>
</table> <!-- Closed the <table> tag -->
</body>
</html>
