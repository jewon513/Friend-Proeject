package com.biz.friend.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.biz.friend.domain.FriendDTO;
import com.biz.friend.persistence.FriendDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class FriendService {

	private final FriendDao fDao;
	
	public int input(FriendDTO friendDTO) {
		
		int ret = fDao.insert(friendDTO);
		
		return ret;
		
	}

	public List<FriendDTO> selectAll(String f_user) {
		// TODO Auto-generated method stub
		
		return fDao.selectAll(f_user);
		
	}

	public List<FriendDTO> search(String select, String keyword, String user_id) {

		log.debug("FriendService search 부분으로 이동");
		
		if(select.equals("name")) {
			log.debug("name 분기로 이동");
			return fDao.nameSearch(keyword, user_id);
		}else if(select.equals("tel")) {
			return fDao.telSearch(keyword, user_id);
		}
		
		return null;
	}

	public int delete(long f_id) {

		int ret =fDao.delete(f_id);
		
		return ret;
	}

	public int update(FriendDTO friendDTO) {

		int ret =fDao.update(friendDTO);
		
		return ret;
	}

	public FriendDTO findById(long f_id) {

		FriendDTO friendDTO = fDao.findById(f_id);
		
		String[] temp = friendDTO.getF_tel().split("-");
		
		friendDTO.setTel1(temp[0]);
		friendDTO.setTel2(temp[1]);
		friendDTO.setTel3(temp[2]);
		
		return friendDTO;
	}
	
}
