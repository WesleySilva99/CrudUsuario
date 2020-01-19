package br.com.local.crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrudController {

	@RequestMapping("index")
	public String test(){
		return "index";
	}

	@RequestMapping("")
	public String index(){
		return "index";
	}


}