package com.example.controller;

import com.example.model.Address;
import com.example.model.Course;
import com.example.model.Project;
import com.example.model.Student;
import com.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    // 1. List all students
    @GetMapping
    public String listStudents(Model model) {
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        return "student-list"; // -> /WEB-INF/views/student-list.jsp
    }

    // 2. Show form to add student
    @GetMapping("/add")
    public String showAddForm(Model model) {
        Student student = new Student();
        student.setAddress(new Address());

        // Init 3 courses
        for (int i = 0; i < 3; i++) {
            student.getCourses().add(new Course());
        }

        // Init 3 projects
        for (int i = 0; i < 3; i++) {
            student.getProjects().add(new Project());
        }

        model.addAttribute("student", student);
        return "student-form";
    }


    // 3. Save student
    @PostMapping("/save")
    public String saveStudent(@ModelAttribute("student") Student student) {
        studentService.registerStudent(student);
        return "redirect:/students";
    }

    // 4. Delete student
    @GetMapping("/delete")
    public String deleteStudent(@RequestParam("id") Long id) {
        studentService.deleteStudent(id);
        return "redirect:/students";
    }

    // 5. View details (optional)
    @GetMapping("/details")
    public String printDetails(@RequestParam("id") Long id, Model model) {
        Student student = studentService.getStudentById(id);
        if (student == null) {
            return "redirect:/students";
        }
        model.addAttribute("student", student);
        return "student-details"; // Create optional JSP for full details
    }
}
