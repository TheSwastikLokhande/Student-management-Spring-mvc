<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Student</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
<h2 class="text-2xl font-bold mb-6 text-blue-600">Add Full Student Details</h2>

<form:form method="POST" modelAttribute="student" action="${pageContext.request.contextPath}/students/save">
    <fieldset>
        <legend> Student Info</legend>
        Name: <form:input path="name" /><br/><br/>
    </fieldset>

    <fieldset>
        <legend>Address</legend>
        City: <form:input path="address.city" /><br/>
        State: <form:input path="address.state" /><br/><br/>
    </fieldset>

    <fieldset>
        <legend> Courses</legend>
        <c:forEach var="i" begin="0" end="2">
            Course Name: <form:input path="courses[${i}].courseName" />
            Duration (months): <form:input path="courses[${i}].durationInMonths" /><br/><br/>
        </c:forEach>
    </fieldset>

    <fieldset>
        <legend> Projects</legend>
        <c:forEach var="i" begin="0" end="2">
            Project Title: <form:input path="projects[${i}].title" /><br/><br/>
        </c:forEach>
    </fieldset>

    <input type="submit" value="Save Student" />
</form:form>

</body>
</html>
