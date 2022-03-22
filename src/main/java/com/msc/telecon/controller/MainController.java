package com.msc.telecon.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("/request")
	public String helloWorld() {
		return "Works!";
	}

}
