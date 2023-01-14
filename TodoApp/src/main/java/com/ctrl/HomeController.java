package com.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.TodoDao;
import com.entities.Todo;

@Controller
public class HomeController {

	@Autowired
	ServletContext sc;

	@Autowired
	TodoDao todoDao;

	@RequestMapping("/home")
	public String home(Model m) {
		String name = "home";
		m.addAttribute("page", name);
		List<Todo> listOfTodos = this.todoDao.getAll();
		m.addAttribute("todos", listOfTodos);
		return "home";
	}

	@RequestMapping("/add")
	public String addTodo(Model m) {
//		String name = "add";
		Todo t = new Todo();
		m.addAttribute("page", "add");
		m.addAttribute("todo", t);
		return "home";
	}

	@RequestMapping(value = "/saveTodo", method = RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") Todo t, Model m) {
		m.addAttribute("page","home");
		System.out.println(t);
		Date d = new Date();
		t.setTodoDate(d);
		this.todoDao.save(t);
		
		m.addAttribute("msg", "successfully addded...");

		return "home";
	}

}
