package com.web.humor.content;

import java.util.Date;

import lombok.Data;

@Data
public class WordsVO {
	
	private int seq;
	private String Words;
	private Date regdate;
	private String userID;
	private String userRank;

}
