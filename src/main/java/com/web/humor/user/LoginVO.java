package com.web.humor.user;

import lombok.Data;

@Data
public class LoginVO {
	private String id;
	private String pass;
	private String remember;
}