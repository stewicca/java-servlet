<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.enigma.java_test.util.StudentDataUtil" %>
<%@ page import="com.enigma.java_test.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>

<%
  String username = (String) request.getSession().getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.jsp");
  }
  List<Student> students = StudentDataUtil.getStudents();
  Map<String, Double> passByDepartment = StudentDataUtil.calculatePassPercentageByDepartment(students);

  Map<String, List<Student>> studentsByDepartment = new HashMap<>();
  for (Student student : students) {
    studentsByDepartment
        .computeIfAbsent(student.getDepartment(), k -> new ArrayList<>())
        .add(student);
  }

  List<String> sortedDepartments = new ArrayList<>(studentsByDepartment.keySet());
  Collections.sort(sortedDepartments);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e2e2e2;
        }
    </style>
  </head>
  <body>
  <h2>Welcome, <%= username %>!</h2>
  <table>
    <tr>
      <th>Department</th>
      <th>Student ID</th>
      <th>Marks</th>
      <th>Pass %</th>
    </tr>

    <%
      for (String department : sortedDepartments) {
        List<Student> departmentStudents = studentsByDepartment.get(department);
        double passPercentage = passByDepartment.get(department);

        for (int i = 0; i < departmentStudents.size(); i++) {
          Student student = departmentStudents.get(i);

          if (i == 0) {
    %>
    <tr>
      <td rowspan="<%= departmentStudents.size() %>"><%= department %></td>
      <td><%= student.getId() %></td>
      <td><%= student.getMarks() %></td>
      <td rowspan="<%= departmentStudents.size() %>"><%= passPercentage %> %</td>
    </tr>
    <%
    } else {
    %>
    <tr>
      <td><%= student.getId() %></td>
      <td><%= student.getMarks() %></td>
    </tr>
    <%
          }
        }
      }
    %>
  </table>
  </body>
</html>
