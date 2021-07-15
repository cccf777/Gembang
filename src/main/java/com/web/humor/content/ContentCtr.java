package com.web.humor.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.web.module.ModuleSvc;

@Controller
public class ContentCtr {

	@Autowired
	private ContentSvc ContentSvc;

	@Autowired
	private ModuleSvc ModuleSvc;

	// 게시판 목록 조회
	@RequestMapping(value = "/board/list")
	public String getList(HttpServletRequest req, ContentVO cv, SearchVO sv, ModelMap modelMap) {
		String userRank;
		int boardid = Integer.parseInt(req.getParameter("boardid"));/* 없으면 오류남 */
		int select = 0;
		if (req.getSession().getAttribute("userRank") == null) {
			userRank = "";
		} else {
			userRank = req.getSession().getAttribute("userRank").toString();
		}
		int b = sv.getBoardid();

		// aside acitve를 위한 값
		if (b == 1) {
			select = 2;
		} else if (b == 2) {
			select = 3;
		} else if (b == 3) {
			select = 4;
		} else if (b == 4) {
			select = 5;
		} else if (b == 5) {
			select = 6;
		} else if (b == 6) {
			select = 7;
		} else if (b == 7) {
			select = 8;
		} else if (b == 8) {
			select = 9;
		} else if (b == 0) {
			select = 10;
		}
		List<ContentVO> list = ContentSvc.getList(sv);		
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("sv", sv);
		modelMap.addAttribute("userRank", userRank);
		modelMap.addAttribute("select", select);
		modelMap.addAttribute("boardid", cv.getBoardid());
		modelMap.addAttribute("boardname", cv.getBoardname());
		return "content/tables";
	}

	
	  // 게시글 자세히 보기
	  
	  @RequestMapping(value = "/board/detail") public String
	  getDetail(HttpServletRequest req, ContentVO vo, ModelMap modelMap) {
	  ContentSvc.getupcocnt(vo.getId());  
	  ContentVO list = ContentSvc.getDetail(vo.getId());
	  modelMap.addAttribute("nt", list); // req.setattribute
	  modelMap.addAttribute("select", vo.getBoardid() + 1); return
	  "content/Detail"; }
	 

	// 게시판 글쓰기 form
	@RequestMapping(value = "/board/regedit")
	public String regeditPage(HttpServletRequest req, ContentVO vo, ModelMap modelMap) {
		String userID = req.getSession().getAttribute("userID").toString();
		String userRank = req.getSession().getAttribute("userRank").toString();
		String userName = req.getSession().getAttribute("userName").toString();
		List<ContentVO> BoardList = ContentSvc.getMyBoardList(userRank);
		modelMap.addAttribute("BoardList", BoardList);
		modelMap.addAttribute("userID", userID);
		modelMap.addAttribute("userRank", userRank);
		modelMap.addAttribute("select", vo.getBoardid() + 1);
		return "content/Regedit";
	}

	// 글쓰기 저장
	@RequestMapping(value = "/board/regeditSave")
	public String regeditSave(HttpServletRequest req, ContentVO cv, ModelMap modelMap) {

		cv.setTitle(ModuleSvc.filter(cv.getTitle()));
		cv.setContent(ModuleSvc.filter(cv.getContent()));

		ContentSvc.regeditSave(cv);

		return "redirect: list?boardid=" + cv.getBoardid();
	}

	// 글 수정 form
	@RequestMapping(value = "/board/modify")
	public String getmodify(HttpServletRequest req, ContentVO cv, ModelMap modelMap) {
		int id = Integer.parseInt(req.getParameter("id"));
		String userRank = req.getSession().getAttribute("userRank").toString();
		List<ContentVO> BoardList = ContentSvc.getMyBoardList(userRank);

		ContentVO list = ContentSvc.getDetail(id);

		modelMap.addAttribute("select", cv.getBoardid() + 1);
		modelMap.addAttribute("BoardList", BoardList);
		modelMap.addAttribute("nt", list); // req.setattribute
		modelMap.addAttribute("titleid", cv.getTitleid()); // req.setattribute
		return "content/modify";
	}

	// 글 수정 저장
	@RequestMapping(value = "/board/edit")
	public String edit(HttpServletRequest req, ContentVO cv, ModelMap modelMap) {

		cv.setTitle(ModuleSvc.filter(cv.getTitle()));
		cv.setContent(ModuleSvc.filter(cv.getContent()));
		ContentSvc.editContent(cv);

		return "redirect: list?boardid=" + cv.getBoardid();
	}

	// 글 삭제하기
	@RequestMapping(value = "/board/removelist")
	public String removelist(HttpServletRequest req, ContentVO cv, ModelMap modelMap) {
		
		int str2 = Integer.parseInt(req.getParameter("id"));
		int bdid = ContentSvc.getbdidViaid(str2);
		ContentSvc.removelist(cv);

		return "redirect: list?boardid=" + bdid;
	}
	
	
	//통계 페이지 이동
	@RequestMapping(value = "board/statistic")
	public String statistic(HttpServletRequest req, ModelMap modelMap) {
		

		return "other/statistic";
	}
	
	

	
}
