<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Student Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 p-8">
    <div class="max-w-4xl mx-auto bg-white p-10 rounded-lg shadow-lg border border-gray-200">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-4xl font-extrabold text-blue-700 border-b-4 border-blue-300 pb-3">Student Details</h2>
            <a href="<c:url value='/'/>" class="inline-block px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 transition">Home</a>
        </div>
        <div class="mb-6 grid grid-cols-2 gap-6">
            <div>
                <h3 class="text-lg font-semibold text-gray-700 mb-2">ID</h3>
                <p class="text-gray-900 text-xl">${student.id}</p>
            </div>
            <div>
                <h3 class="text-lg font-semibold text-gray-700 mb-2">Name</h3>
                <p class="text-gray-900 text-xl">${student.name}</p>
            </div>
        </div>

        <c:if test="${student.address != null}">
            <div class="mb-6">
                <h3 class="text-lg font-semibold text-gray-700 mb-2">Address</h3>
                <p class="text-gray-900 text-lg">${student.address.city}, ${student.address.state}</p>
            </div>
        </c:if>

        <c:if test="${not empty student.courses}">
            <h3 class="text-2xl font-bold mb-4 text-blue-600 border-b pb-2">Courses</h3>
            <ul class="list-disc list-inside space-y-2 mb-6">
                <c:forEach var="course" items="${student.courses}">
                    <li class="text-gray-800 text-lg">${course.courseName} <span class="text-gray-500">(${course.durationInMonths} months)</span></li>
                </c:forEach>
            </ul>
        </c:if>

        <c:if test="${not empty student.projects}">
            <h3 class="text-2xl font-bold mb-4 text-blue-600 border-b pb-2">Projects</h3>
            <ul class="list-disc list-inside space-y-2 mb-6">
                <c:forEach var="project" items="${student.projects}">
                    <li class="text-gray-800 text-lg">${project.title}</li>
                </c:forEach>
            </ul>
        </c:if>

        <a href="<c:url value='/students'/>" class="inline-block mt-6 px-6 py-3 bg-blue-700 text-white rounded-lg shadow hover:bg-blue-800 transition">Back to list</a>
    </div>
</body>
</html>
