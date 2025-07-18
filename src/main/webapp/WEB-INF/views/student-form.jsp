<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title><c:choose><c:when test="${not empty student.id}">Update Student</c:when><c:otherwise>Add Student</c:otherwise></c:choose></title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
<div class="max-w-3xl mx-auto bg-white p-8 rounded shadow">
    <div class="flex justify-between items-center mb-6">
        <h2 class="text-3xl font-bold text-blue-600 border-b pb-2"><c:choose><c:when test="${not empty student.id}">Update Full Student Details</c:when><c:otherwise>Add Full Student Details</c:otherwise></c:choose></h2>
        <a href="<c:url value='/'/>" class="inline-block px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 transition">Home</a>
    </div>

    <form:form method="POST" modelAttribute="student" action="${pageContext.request.contextPath}/students/save">
        <form:hidden path="id" />
        <form:hidden path="version" />
        <fieldset class="mb-6">
            <legend class="font-semibold mb-2">Student Info</legend>
            <label class="block mb-1">Name:</label>
            <form:input path="name" cssClass="w-full border border-gray-300 rounded px-3 py-2" />
        </fieldset>

        <fieldset class="mb-6">
            <legend class="font-semibold mb-2">Address</legend>
            <label class="block mb-1">City:</label>
            <form:input path="address.city" cssClass="w-full border border-gray-300 rounded px-3 py-2 mb-3" />
            <label class="block mb-1">State:</label>
            <form:input path="address.state" cssClass="w-full border border-gray-300 rounded px-3 py-2" />
        </fieldset>

        <fieldset class="mb-6">
            <legend class="font-semibold mb-2">Courses</legend>
            <c:forEach var="i" begin="0" end="2">
                <div class="mb-4">
                    <label class="block mb-1">Course Name:</label>
                    <form:input path="courses[${i}].courseName" cssClass="w-full border border-gray-300 rounded px-3 py-2 mb-1" />
                    <label class="block mb-1">Duration (months):</label>
                    <form:input path="courses[${i}].durationInMonths" cssClass="w-full border border-gray-300 rounded px-3 py-2" />
                </div>
            </c:forEach>
        </fieldset>

        <fieldset class="mb-6">
            <legend class="font-semibold mb-2">Projects</legend>
            <c:forEach var="i" begin="0" end="2">
                <div class="mb-4">
                    <label class="block mb-1">Project Title:</label>
                    <form:input path="projects[${i}].title" cssClass="w-full border border-gray-300 rounded px-3 py-2" />
                </div>
            </c:forEach>
        </fieldset>

        <input type="submit" value="Save Student" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition cursor-pointer" />
    </form:form>
</div>
</body>
</html>
