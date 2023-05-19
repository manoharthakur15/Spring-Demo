package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entities.Student;

@Component
public class StudentDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public void createStudent(Student std) {
		this.hibernateTemplate.saveOrUpdate(std);
	}

	public List<Student> getStudents() {
		List<Student> students = this.hibernateTemplate.loadAll(Student.class);
		return students;
	}

	@Transactional
	public void deleteStudent(int sid) {
		Student s = this.hibernateTemplate.load(Student.class, sid);
		this.hibernateTemplate.delete(s);
	}

	public Student getStudent(int sid) {
		return this.hibernateTemplate.get(Student.class, sid);
	}

}
