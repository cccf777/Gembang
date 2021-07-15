package com.web.humor.main;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class mainCtr {
	@Autowired
	private mainSvc mainSvc;
	
	// 메인 화면
	@RequestMapping(value = "main")
	public String MainListGroup(HttpServletRequest req, ModelMap modelMap) throws IOException {
		
		String url="https://www.issuelink.co.kr/community/listview";
		Document doc = Jsoup.connect(url).get();
		Elements elements = doc.select(".title > a");
		List<CrawilingVO> cv= new ArrayList<>();
		for(int i=0; i<10; i++) {
			String title=elements.get(i).text();
			String urls=elements.get(i).attr("href");
			CrawilingVO vo = new CrawilingVO(title,urls);
			cv.add(vo);
		}
		
		List<mainVO> count = mainSvc.getBoardCount(); // 게시판

		for (int i = 0; i < 4; i++) {
			List<mainVO> list = mainSvc.getMainList(count.get(i).getBoardid());
			modelMap.addAttribute("board" + count.get(i).getBoardid(), list);
		}
		
		modelMap.addAttribute("list", cv);
		modelMap.addAttribute("count", count);
		modelMap.addAttribute("select", 1);

		return "main/main";
	}
}
