package com.biz.friend.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.biz.friend.domain.UserDTO;
import com.biz.friend.persistence.UserDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {
	
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	private final UserDao uDao;
	
	public int userJoin(UserDTO userDTO) {

		String cryptext = bCryptPasswordEncoder.encode(userDTO.getUser_pw());
		userDTO.setUser_pw(cryptext);;
		
		return uDao.userInsert(userDTO);
		
	}
	
	public UserDTO loginCheck(UserDTO userDTO) {
		
		UserDTO dbUserDTO = uDao.findById(userDTO.getUser_id());
		
		if(dbUserDTO == null) {
			return null;
		}
		
		String dbPassword = dbUserDTO.getUser_pw();
		
		if(bCryptPasswordEncoder.matches(userDTO.getUser_pw(), dbPassword)) {
			return dbUserDTO;
		}
		return null;
	}
	
}
