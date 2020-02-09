package com.biz.friend.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class FriendDTO {

	private long f_id;
	private String f_user;
	private String f_name;
	private String f_tel;
	private String f_addr;
	private String f_hobby;
	private String f_relation;

	private String tel1;
	private String tel2;
	private String tel3;
	
	
}
