package com.web.humor.etc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EtcCtr {
	@Autowired
	EtcSvc EtcSvc;
	
	//aside
	@RequestMapping(value = "/etc/aside")
	public String getMenuList(HttpServletRequest req, ModelMap modelMap) {
		String userRank="";
		
		if(req.getSession().getAttribute("userRank")==null) {
			userRank="G";
		}else {
			userRank=req.getSession().getAttribute("userRank").toString();
		}
		

		List<MenuVO> list = EtcSvc.getMenuList(userRank);
		modelMap.addAttribute("menu", list);
		return "etc/aside";
	}
	
	//nav
	@RequestMapping(value = "/etc/nav")
	public String Nav(HttpServletRequest req, ModelMap modelMap) {
		return "etc/nav";
	}
}
