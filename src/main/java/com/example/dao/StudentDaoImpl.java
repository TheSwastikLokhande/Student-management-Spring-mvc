package com.example.dao;

import com.example.model.Student;
import jakarta.persistence.criteria.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.persistence.StoredProcedureQuery;
import java.util.List;

@Repository
public class StudentDaoImpl implements StudentDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session session() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Student student) {
        session().persist(student);
    }

    @Override
    public void update(Student student) {
        session().merge(student);
    }

    @SuppressWarnings("deprecation")
    @Override
    public void delete(Long id) {
        Student student = session().get(Student.class, id);
        if (student != null) {
            session().delete(student);
        }
    }

    @Override
    public Student findById(Long id) {
        String hql = "SELECT s FROM Student s LEFT JOIN FETCH s.courses LEFT JOIN FETCH s.projects WHERE s.id = :id";
        return session().createQuery(hql, Student.class)
                .setParameter("id", id)
                .uniqueResult();
    }

    @Override
    public List<Student> findAll() {
        return session().createQuery("from Student", Student.class).list();
    }

    @Override
    public List<Student> findByNameHQL(String name) {
        String hql = "FROM Student s WHERE s.name = :name";
        Query<Student> query = session().createQuery(hql, Student.class);
        query.setParameter("name", name);
        return query.list();
    }

    @Override
    public List<Student> findByNameNative(String name) {
        String sql = "SELECT * FROM students WHERE name = ?";
        NativeQuery<Student> query = session().createNativeQuery(sql, Student.class);
        query.setParameter(1, name);
        return query.list();
    }

    @Override
    public List<Student> findByNameCriteria(String name) {
        CriteriaBuilder cb = session().getCriteriaBuilder();
        CriteriaQuery<Student> cq = cb.createQuery(Student.class);
        Root<Student> root = cq.from(Student.class);
        cq.select(root).where(cb.equal(root.get("name"), name));
        return session().createQuery(cq).getResultList();
    }

    @Override
    public void saveMultipleStudents(List<Student> students) {
        for (int i = 0; i < students.size(); i++) {
            session().persist(students.get(i));
            if (i % 20 == 0) {
                session().flush();
                session().clear();
            }
        }
    }

    @Override
    public List<StudentDTO> fetchStudentDTOs() {
        String hql = "SELECT new com.example.dto.StudentDTO(s.id, s.name) FROM Student s";
        return session().createQuery(hql, StudentDTO.class).list();
    }

    @Override
    public int getStudentCountViaProcedure() {
        StoredProcedureQuery query = session().createStoredProcedureQuery("get_student_count");
        Object result = query.getSingleResult();
        return ((Number) result).intValue();
    }

    @Override
    public int getCourseCountForStudent(Long studentId) {
        Query<?> query = session().createNativeQuery("SELECT course_count_for_student(:sid)")
                .setParameter("sid", studentId);
        return ((Number) query.getSingleResult()).intValue();
    }
}
