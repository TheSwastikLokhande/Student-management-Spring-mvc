package com.example.dao;

import com.example.model.Student;
import com.example.dao.StudentDTO;

import java.util.List;

public interface StudentDao {
    void save(Student student);
    void update(Student student);
    void delete(Long id);
    Student findById(Long id);
    List<Student> findAll();

    // Queries
    List<Student> findByNameHQL(String name);
    List<Student> findByNameNative(String name);
    List<Student> findByNameCriteria(String name);

    // Batch
    void saveMultipleStudents(List<Student> students);

    // Projection
    List<StudentDTO> fetchStudentDTOs();

    // SP/Function
    int getStudentCountViaProcedure();
    int getCourseCountForStudent(Long studentId);
}
