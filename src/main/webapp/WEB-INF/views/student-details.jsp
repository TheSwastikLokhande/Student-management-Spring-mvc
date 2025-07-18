<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Student Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
    <h2 class="text-2xl font-bold mb-6 text-blue-600">Student Details</h2>
    <p>ID: ${student.id}</p>
    <p>Name: ${student.name}</p>

    <c:if test="${student.address != null}">
        <p>  Address: ${student.address.city}, ${student.address.state}</p>
    </c:if>

    <c:if test="${not empty student.courses}">
        <h3>  Courses</h3>
        <ul>
            <c:forEach var="course" items="${student.courses}">
                <li>${course.courseName} (${course.durationInMonths} months)</li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${not empty student.projects}">
        <h3>  Projects</h3>
        <ul>
            <c:forEach var="project" items="${student.projects}">
                <li>${project.title}</li>
            </c:forEach>
        </ul>
    </c:if>

    <a href="<c:url value='/students'/>">  Back to list</a>
</body>
</html>
