package com.web.humor.main;

import org.springframework.stereotype.Repository;

import com.web.humor.content.ContentVO;

import lombok.Data;

@Data
public class mainVO extends ContentVO{
	private int boardid;
	private String boardname;
}
