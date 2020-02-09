package com.biz.friend.persistence;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.biz.friend.domain.UserDTO;

@Mapper
public interface UserDao {

	public int userInsert(UserDTO userDTO);
	
	@Select("SELECT * FROM tbl_friend_user WHERE user_id = #{user_id}")
	public UserDTO findById(String user_id);
	
}
