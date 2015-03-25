package com.latvsumm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "/submit-article", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/sim-table")
	public String simTableController(Model model) {
		
		MyModel text = (MyModel)model.asMap().get("text");
		
		//System.out.println("SIMILARITY MATRIX!");
		//System.out.println(text.getText());
		
		
		
		return "simtable";
	}
	
	@RequestMapping(value="/sentence-comparison",
			params = {"sentence1", "sentence2"})
	public String sentenceComparison(Model model, 
			@RequestParam(value = "sentence1") int sentence1,
			@RequestParam(value = "sentence2") int sentence2
			) {
		
		System.out.println(sentence1+" "+sentence2);
		
		MyModel text = (MyModel)model.asMap().get("text");
		
		text.setSentenceComparison(sentence1, sentence2);
		
		
		
		return "sentence-comparison";
	}
	
	
  @ExceptionHandler(Exception.class)
  public String exceptionController() {
    return "exception";
  }
  
  
  @RequestMapping(value = "all-sentences")
  public String allSentences(Model model) {
	  
	  MyModel text = (MyModel)model.asMap().get("text");
	  
	  return "sentences";
  }
  
  @RequestMapping(value = "all-iterations") 
  public String AllIterations(Model model) {
	  MyModel text = (MyModel)model.asMap().get("text");
	  return "iterations";
  }
  
}
