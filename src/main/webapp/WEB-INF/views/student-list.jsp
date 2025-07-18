<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Student List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
    <h2 class="text-2xl font-bold mb-6 text-blue-600">All Students</h2>
    <a href="<c:url value='/students/add'/>" class="text-blue-600 hover:underline">Add Student</a>
    <br/><br/>
    <table class="min-w-full bg-white border border-gray-300 rounded">
        <thead>
            <tr class="bg-blue-100 text-left">
                <th class="py-2 px-4 border-b border-gray-300">ID</th>
                <th class="py-2 px-4 border-b border-gray-300">Name</th>
                <th class="py-2 px-4 border-b border-gray-300">Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="s" items="${students}">
            <tr class="hover:bg-gray-50">
                <td class="py-2 px-4 border-b border-gray-300">${s.id}</td>
                <td class="py-2 px-4 border-b border-gray-300">${s.name}</td>
                <td class="py-2 px-4 border-b border-gray-300">
                    <a href="<c:url value='/students/details?id=${s.id}'/>" class="text-blue-600 hover:underline">View</a> |
                    <a href="<c:url value='/students/delete?id=${s.id}'/>" onclick="return confirm('Delete this student?')" class="text-red-600 hover:underline">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
