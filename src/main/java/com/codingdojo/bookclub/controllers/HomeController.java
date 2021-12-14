package com.codingdojo.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.LoginUser;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.HomeService;

@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeServ;
	
	
	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		if(session.getAttribute("user_id") != null) {
			return "redirect:/dashboard";
		}
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "logreg.jsp";
	}
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result,  HttpSession session, Model model) {
        homeServ.register(newUser, result);
        if(result.hasErrors()) {
    		model.addAttribute("newLogin", new LoginUser());
            return "logreg.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        session.setAttribute("userName", newUser.getUserName());
        return "redirect:/dashboard";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = homeServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "logreg.jsp";
        }
        session.setAttribute("user_id", user.getId());
        session.setAttribute("userName", user.getUserName());
        return "redirect:/dashboard";
    }
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate(); // clear session
    	return "redirect:/";
    }
    
    //****** FIND ALL ******
    @GetMapping("/dashboard")
    public String home(HttpSession session, Model model) {
    	if(session.getAttribute("user_id") == null) {
    		return "redirect:/";
    	}else {
    		List<Book> books = homeServ.allBooks();
    		model.addAttribute("books", books);
    		return "loggedin.jsp";
    	}
    }
    
    // ******* CREATE BOOK ********
    @GetMapping("/books/add")
    public String addBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
    	List<User> users = homeServ.allUsers();
    	model.addAttribute("users", users);  	
    	return "newBook.jsp";
    }
    
    @PostMapping("/books/add")
    public String processAddBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model) {
    	if (result.hasErrors()) {
			List<User> users = homeServ.allUsers();
			model.addAttribute("users", users);
			return "newBook.jsp";
		} else {
			homeServ.saveBook(book);
			return "redirect:/";
		}
	}
	// ******** FIND ONE ********
    @GetMapping("/books/{id}")
    public String showOneBook(@PathVariable("id")Long id, Model model) {
    	Book book = homeServ.findBook(id);
    	model.addAttribute("book", book);
    	return "showBook.jsp";
    }
    
	// ******** UPDATE ********
    @GetMapping("/books/{id}/edit")
    public String edit(@PathVariable("id")Long id, Model model) {
    	Book book = homeServ.findBook(id);
    	model.addAttribute("book", book);
    	return "editBook.jsp";
    }
    
    @PutMapping("/books/{id}/edit")
    public String processEdit(@Valid @ModelAttribute("book") Book book, BindingResult result) {
    	if(result.hasErrors()) {
    		return "editBook.jsp";
    	} else {
    		homeServ.saveBook(book);
    		return "redirect:/dashboard";
    	}
    }
    
 // ******** DELETE *******
    @RequestMapping(value="/books/{id}", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id")Long id) {
    	homeServ.deleteBook(id);
    	return "redirect:/dashboard";
    }
    
    

}
