package com.biz.friend.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.friend.domain.FriendDTO;
import com.biz.friend.domain.UserDTO;
import com.biz.friend.service.FriendService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value = "friend")
@RequiredArgsConstructor
@Controller
public class FriendController {

	private final FriendService fService;

	@ModelAttribute("friendDTO")
	public FriendDTO makeFriendDTO() {

		return FriendDTO.builder().build();
	}
	
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public String list(Model model, HttpSession httpSession) {
		
		UserDTO userDTO = (UserDTO) httpSession.getAttribute("LoginUser");
		
		List<FriendDTO> list = fService.selectAll(userDTO.getUser_id());
		
		model.addAttribute("LIST",list);
		
		return "list";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(long f_id) {
		
		int ret = fService.delete(f_id);
		
		if(ret>0) {
			return "OK";
		}else {
			return "FALSE";
		}
		
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(long f_id, Model model) {
		
		FriendDTO friendDTO = fService.findById(f_id);
		
		model.addAttribute("friendDTO", friendDTO);
		
		return "input";
		
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("friendDTO") FriendDTO friendDTO, Model model) {
		
		log.debug("업데이트 friendDTO : " + friendDTO.toString());
		
		String tel = friendDTO.getTel1() +"-"+friendDTO.getTel2()+"-"+friendDTO.getTel3();
		
		friendDTO.setF_tel(tel);
		
		int ret = fService.update(friendDTO);
		
		return "redirect:/friend/list";
		
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(@RequestParam(value = "select")String select,  @RequestParam("keyword")String keyword, HttpSession httpSession, Model model) {
		
		UserDTO userDTO = (UserDTO) httpSession.getAttribute("LoginUser");
		
		log.debug(select + keyword + userDTO.getUser_id());
		
		List<FriendDTO> list = fService.search(select, keyword, userDTO.getUser_id());
		
		model.addAttribute("LIST",list);
		
		return "list";
		
	}
	
	@RequestMapping(value = "input", method = RequestMethod.GET)
	public String input(@ModelAttribute("friendDTO") FriendDTO friendDTO) {
		
		return "input";
	}
	
	@RequestMapping(value = "input", method = RequestMethod.POST)
	public String input(@ModelAttribute("friendDTO") FriendDTO friendDTO, HttpSession httpSession) {
		
		UserDTO LoginUser = (UserDTO) httpSession.getAttribute("LoginUser");
		
		String tel = friendDTO.getTel1() +"-"+friendDTO.getTel2()+"-"+friendDTO.getTel3();
		
		friendDTO.setF_user(LoginUser.getUser_id());
		friendDTO.setF_tel(tel);
		
		int ret = fService.input(friendDTO);
		
		return "redirect:/friend/list";
	}
	
	
}
