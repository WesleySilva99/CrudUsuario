package br.com.local.crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrudController {

	@RequestMapping("index")
	public String test(){
		System.out.println("Executando a lógica com Spring MVC.");
		return "index";
	}


}