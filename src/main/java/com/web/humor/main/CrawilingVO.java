package com.web.humor.main;

import lombok.Data;

@Data
public class CrawilingVO {
	private String title;
	private String url;
	
	public CrawilingVO(String title, String url) {
		this.title = title;
		this.url = url;
	}
	
}
