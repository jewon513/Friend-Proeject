package com.biz.friend.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.biz.friend.domain.FriendDTO;

@Mapper
public interface FriendDao {

	@Select("SELECT * FROM tbl_friend WHERE f_user = #{f_user}")
	public List<FriendDTO> selectAll (String f_user); 
	public List<FriendDTO> nameSearch (@Param("search") String search, @Param("f_user") String f_user);
	public List<FriendDTO> telSearch(@Param("search") String keyword, @Param("f_user") String user_id);
	
	public int insert(FriendDTO friendDTO);
	
	@Delete("DELETE FROM tbl_friend WHERE f_id = #{f_id}")
	public int delete(long f_id);
	
	public int update(FriendDTO friendDTO);
	
	@Select("SELECT * FROM tbl_friend WHERE f_id = #{f_id}")
	public FriendDTO findById(long f_id);
	
	
}
