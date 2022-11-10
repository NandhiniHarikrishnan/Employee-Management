<%@page import="java.util.stream.Collectors"%>
<%@page import="com.ideas2it.model.Employee"%>
<%@page import="com.ideas2it.model.Project"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	List<Employee> employees = (List<Employee>) session.getAttribute("Employees");
	System.out.println(employees);
	if (null != employees) {
		System.out.println(employees);
		if (!employees.isEmpty()) {
	%>
	<%
	for (Employee employee : employees) {
	%>
    <table>
	<tr>
		<td>Id :</td>
		<td><%=employee.getId()%></td>
	</tr>

	<tr>
		<td>EmployeeCode :</td>
		<td><%=employee.getEmployeeCode()%></td>
	</tr>

	<tr>
		<td>Name :</td>
		<td><%=employee.getName()%></td>
	</tr>

	<tr>
		<td>Address :</td>
		<td><%=employee.getAddress()%></td>
	</tr>

	<tr>
		<td>Blood Group :</td>
		<td><%=employee.getBloodGroup()%></td>
	</tr>

	<tr>
		<td>Date Of Birth :</td>
		<td><%=employee.getDateOfBirth()%></td>
	</tr>

	<tr>
		<td>Date Of Join :</td>
		<td><%=employee.getDateOfJoin()%></td>
	</tr>

	<tr>
		<td>Experience Status :</td>
		<td><%=employee.hasExperience()%></td>
	</tr>

	<tr>
		<td>Previous Organisation Name :</td>
		<td><%=employee.getPreviousOrganisationName()%></td>
	</tr>

	<tr>
		<td>Age :</td>
		<td><%=employee.getAge()%></td>
	</tr>

	<tr>
		<td>Delete Status :</td>
		<td><%=employee.isDeleted()%></td>
	</tr>

	<tr>
		<td>Last Created Date and Time :</td>
		<td><%=employee.getCreatedAt()%></td>
	</tr>

	<tr>
		<td>Last Updated Date and Time :</td>
		<td><%=employee.getUpdatedAt()%></td>
	</tr>
	<%
	List<Project> projects = employee.getProjects();
	%>
	<tr>
		<td>Projects :</td>
		<%
		if (null != projects && !projects.isEmpty()) {
		%>

		<td><%=projects.stream().map(project -> project.getName()).collect(Collectors.joining(","))%></td>
		<%
		} else {
		%>
		<td>projects not yet assigned</td>
	</tr>
	<%
	}
	%>
	<tr>
		<td>---------------------</td>
	</tr>
	<%
	}
	}
	}
	%>
	</table>
</body>
</html>