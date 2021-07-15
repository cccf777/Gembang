package com.web.humor.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class mainSvc {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//게시판 별 글 목록
	public List<mainVO> getMainList(int boardid) {
		log.debug("getMenuList");
		return sqlSession.selectList("getMainList", boardid);
	}

	//게시판 갯수
	public List<mainVO> getBoardCount() {
		log.debug("getBoardCount");
		return sqlSession.selectList("getBoardCount");
	}
}
