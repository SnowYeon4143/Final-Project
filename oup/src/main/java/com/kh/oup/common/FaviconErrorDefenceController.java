package com.kh.oup.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FaviconErrorDefenceController {
	
	@GetMapping("statement/null")
	@ResponseBody
	public String favicon() {
		System.out.println("favicon test ~~~ ");
		return "";
	}
	@GetMapping("statement/statement_list/null")
	@ResponseBody
	public String favicon2() {
		System.out.println("favicon test ~~~ ");
		return "";
	}
	
	
	@GetMapping("project/null")
	@ResponseBody
	public String favicon3() {
		System.out.println("favicon test ~~~ ");
		return "";
	}
	
	
	@GetMapping("project/project_list/null")
	@ResponseBody
	public String favicon4() {
		System.out.println("favicon test ~~~ ");
		return "";
	}
	

}
