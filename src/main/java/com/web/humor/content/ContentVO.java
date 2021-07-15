package com.web.humor.content;

import java.util.Date;
import lombok.Data;


@Data
public class ContentVO {
	private int boardid; 		//보드id
	private String boardname;	//보드명
	private int id;				//글 id
	private String title;    	//글 제목
	private String writeid;		//글쓴이 id
	private String content;		//글내용
	private Date regdate;		//글등록일
	private int hit;			//글 조회수
	private int cocnt;			//글에 대한 댓글 수
	private String files;		//첨부파일
	private int recommend;   	//추천수
    private String secret;		//비밀글 여부
    private int titleid;		//말머리 종류 ID
    private String titlename;	//(잡담, 질문 등)
    private int count;			//게시판 갯수
}
