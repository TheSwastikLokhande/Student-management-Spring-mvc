package com.example.service;

import com.example.model.Student;
import com.example.dao.StudentDTO;

import java.util.List;

public interface StudentService {
    void registerStudent(Student student);
    void updateStudent(Student student);
    void deleteStudent(Long id);
    Student getStudentById(Long id);
    List<Student> getAllStudents();

    List<Student> searchByNameHQL(String name);
    List<Student> searchByNameNative(String name);
    List<Student> searchByNameCriteria(String name);

    void saveMultiple(List<Student> students);

    List<StudentDTO> getStudentDTOs();

    int getStudentCount();
    int getCourseCount(Long studentId);

    void printStudentDetails(Long id);
}
