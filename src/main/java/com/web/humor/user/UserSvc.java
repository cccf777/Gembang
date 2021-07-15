package com.web.humor.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.humor.content.ContentVO;
import com.web.humor.content.SearchVO;

@Service
public class UserSvc {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인 확인
	public UserVO LoginCheck(LoginVO lv) {
		return sqlSession.selectOne("LoginCehck", lv);
	}

	// 회원가입시 아이디 중복 체크
	public int idcheck(String id) {
		return sqlSession.selectOne("IdCehck", id);
	}

	// 입력한 사용자 정보 등록(회원가입)
	public void registUser(UserVO uv) {
		sqlSession.insert("registUser", uv);
	}

	// 유저관리 게시판 불러오기==============이 밑에 세개 추가하기
	public List<UserVO> userManage(SearchVO sv) {
		if (sv.getF() == null || sv.getF() == "") {
			sv.setF("id");
		}
		if (sv.getP() == 0) {
			sv.setP(0);
		} else {
			sv.setP((sv.getP() - 1) * 10);
		}
		if (sv.getQ() == null) {
			sv.setQ("");
		}
		System.out.println("service 들어옴");
		return sqlSession.selectList("userManagesql",sv);
	}

	// 유저테이블에서 문자열로(id)로 디테일 가져오기
	public List<UserVO> getDetailstr(String id2) {
		return sqlSession.selectList("getDetailStr", id2);
	}

	// 유저 등급 변경하기
	public void setUsergrade(UserVO uv) {
		sqlSession.update("setGrade", uv);
	}

	public List<UserVO> getCommentFlaginfo(String id) {
		System.out.println("======asdjlkfasj;lf");
		return sqlSession.selectList("getCommentFlaginfo", id);
	}

	// comment flag 변경하기
	public void setcommentFlag(UserVO uv) {
		sqlSession.update("flagmodify", uv);
	}

	// 내가 쓴 글의 정보를 가져오자mypage
	public List<ContentVO> getWritten(String ui) {

		return sqlSession.selectList("selectbiauserID", ui);
	}

	public List<UserVO> getUserinfo(String uin) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getUserinfo", uin);
	}

	// 글쓴이 쓴글 불러오기
	public List<UserVO> writeuserpage(String ut) {

		return sqlSession.selectList("writeuserpage", ut);
	}


	// 글쓴이 쓴글 불러오기
	public List<ContentVO> writeuserpage2(String ut) {

		return sqlSession.selectList("writeuserpage2", ut);
	}

}