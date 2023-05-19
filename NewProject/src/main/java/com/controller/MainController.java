package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.dao.StudentDao;
import com.entities.Student;

@Controller
public class MainController {
	@Autowired
	private StudentDao studentDao;

	@RequestMapping("/")
	public String home(Model m) {
		List<Student> students = studentDao.getStudents();
		m.addAttribute("students", students);
		return "home";
	}

//	@RequestMapping("/home")
//	public String homee(Model m) {
//		List<Student> students = studentDao.getStudents();
//		m.addAttribute("students", students);
//		return "home";
//	}

	@RequestMapping("/add-student")
	public String addStudent(Model m) {
		m.addAttribute("title", "Add Student");
		return "addStudent";
	}

	@RequestMapping(value = "/handle-student", method = RequestMethod.POST)
	public RedirectView handleStudent(@ModelAttribute Student student, HttpServletRequest request) {
		System.out.println(student);
		studentDao.createStudent(student);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}

	@RequestMapping("/delete/{studentId}")
	public RedirectView deleteStudent(@PathVariable("studentId") int studentId, HttpServletRequest request) {
		this.studentDao.deleteStudent(studentId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}

	@RequestMapping("/update/{studentId}")
	public String updateStudent(@PathVariable("studentId") int studentId, Model m) {
		Student student = this.studentDao.getStudent(studentId);
		m.addAttribute("student", student);
		return "updateStudent";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}

}
