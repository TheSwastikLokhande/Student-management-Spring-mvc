# Student Management System - Spring MVC Web Application

## Project Overview
This is a simple Student Management System web application built using Spring MVC framework. It allows users to manage student records including adding, updating, viewing, and deleting student details. The application uses JSP for views and Tailwind CSS for styling.

## Features
- List all students with options to view, edit, or delete.
- Add new student with detailed information including address, courses, and projects.
- Update existing student details with version control to handle concurrent updates.
- View detailed student information in a clean, professional UI.
- Navigation buttons for easy access to home and other pages.
- Responsive and modern UI using Tailwind CSS.

## Folder Structure
```
src/
├── main/
│   ├── java/
│   │   └── com/example/
│   │       ├── controller/          # Spring MVC Controllers
│   │       ├── dao/                 # Data Access Objects (DAO)
│   │       ├── model/               # Entity and Model classes
│   │       └── service/             # Service layer interfaces and implementations
│   ├── resources/
│   │   ├── css/                     # Custom CSS files (if any)
│   │   └── db/migration/            # Database migration scripts
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── views/               # JSP view files
│       │   └── web.xml              # Web application configuration
│       ├── index.jsp                # Home page
│       └── resources/
│           └── css/                 # Tailwind CSS and other static resources
├── pom.xml                         # Maven project file
```

## Setup Instructions
1. **Prerequisites:**
   - Java JDK 8 or higher
   - Maven 3.x
   - A servlet container like Apache Tomcat

2. **Build and Run:**
   - Clone the repository.
   - Navigate to the project root directory.
   - Run `mvn clean install` to build the project.
   - Deploy the generated WAR file to your servlet container or run using embedded server if configured.
   - Access the application at `http://localhost:8080/spring-mvc-web-app/` (adjust port and context path as needed).

3. **Database:**
   - The project uses database migration scripts located in `src/main/resources/db/migration/`.
   - Configure your database connection in the application configuration files.

## Notes
- The application uses Tailwind CSS CDN for styling.
- The student update form includes versioning to handle optimistic locking with Hibernate.
- The project follows MVC architecture with clear separation of concerns.

## Contact
For any questions or issues, please contact the project maintainer.

---
