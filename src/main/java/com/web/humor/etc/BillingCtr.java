package com.web.humor.etc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BillingCtr {
	
	//biling
	@RequestMapping(value = "billing")
	public String Sidebar(HttpServletRequest req, ModelMap modelMap) {
		
		//사이드바 active를 위한 값
		modelMap.addAttribute("select" ,6);
		return "other/billing";
	}
}
