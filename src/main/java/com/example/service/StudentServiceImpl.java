package com.example.service;

import com.example.dao.StudentDao;
import com.example.dao.StudentDTO;
import com.example.model.Address;
import com.example.model.Course;
import com.example.model.Project;
import com.example.model.Student;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public void registerStudent(Student student) {
        studentDao.save(student);
    }

    @Override
    public void updateStudent(Student student) {
        studentDao.update(student);
    }

    @Override
    public void deleteStudent(Long id) {
        studentDao.delete(id);
    }

    @Override
    public Student getStudentById(Long id) {
        return studentDao.findById(id);
    }

    @Override
    public List<Student> getAllStudents() {
        return studentDao.findAll();
    }

    @Override
    public List<Student> searchByNameHQL(String name) {
        return studentDao.findByNameHQL(name);
    }

    @Override
    public List<Student> searchByNameNative(String name) {
        return studentDao.findByNameNative(name);
    }

    @Override
    public List<Student> searchByNameCriteria(String name) {
        return studentDao.findByNameCriteria(name);
    }

    @Override
    public void saveMultiple(List<Student> students) {
        studentDao.saveMultipleStudents(students);
    }

    @Override
    public List<StudentDTO> getStudentDTOs() {
        return studentDao.fetchStudentDTOs();
    }

    @Override
    public int getStudentCount() {
        return studentDao.getStudentCountViaProcedure();
    }

    @Override
    public int getCourseCount(Long studentId) {
        return studentDao.getCourseCountForStudent(studentId);
    }

    @Override
    public void printStudentDetails(Long id) {
        Student student = studentDao.findById(id);
        if (student == null) {
            System.out.println("❌ Student not found.");
        }
    }
}