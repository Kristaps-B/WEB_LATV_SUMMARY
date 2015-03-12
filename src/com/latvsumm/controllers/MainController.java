package com.latvsumm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.latvsumm.models.MyModel;

@Controller
@SessionAttributes("text")
public class MainController {

	@RequestMapping(value = "/index")
	public String indexController(Model model) {
		
		
		
		MyModel text;
		if (!model.containsAttribute("text")) {
			text = new MyModel();
			model.addAttribute("text", text);
		} else {
			text = (MyModel)model.asMap().get("text");
		}
		
		
		
		return "index";
	}
	
	@RequestMapping(value = "/")
	public String index() {
	    return "index";
	}
	
	//Kluda!
	//Session attribute 'text' required - not found in session
	
	@RequestMapping(value = "/submitArticle", method = RequestMethod.POST)
	public String submitArticleController(@ModelAttribute("text") MyModel text) {
		
		
		//text.createList();
		
		text.summarize();
		
		return "summary";
	}
	
	@RequestMapping(value = "/summary")
	public String summaryController(Model model) {
		MyModel text = (MyModel)model.asMap().get("text");
		
		return "summary";
	}
	
	@RequestMapping(value = "/simtable")
	public String simTableController(Model model) {
		
		MyModel text = (MyModel)model.asMap().get("text");
		
		System.out.println("SIMILARITY MATRIX!");
		System.out.println(text.getText());
		
		
		
		return "simtable";
	}
	
	  @ExceptionHandler(Exception.class)
	  public String exceptionController() {
		  return "exception";
	  }
}
