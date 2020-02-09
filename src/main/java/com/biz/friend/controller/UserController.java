package com.biz.friend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.friend.domain.UserDTO;
import com.biz.friend.service.UserService;

import lombok.RequiredArgsConstructor;

@RequestMapping(value = "user")
@RequiredArgsConstructor
@Controller
public class UserController {

	private final UserService userService;
	
	@ModelAttribute("userDTO")
	public UserDTO makeUserDTO() {
		return UserDTO.builder().build();
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(@ModelAttribute("userDTO") UserDTO userDTO, Model model) {
		
		model.addAttribute("Controller","login");
		
		return "login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(UserDTO userDTO, HttpSession httpSession) {
		
		userDTO = userService.loginCheck(userDTO);
		
		if(userDTO == null) {
			return "redirect:/";
		}
		
		httpSession.setAttribute("LoginUser", userDTO);
		return "redirect:/";
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		
		httpSession.removeAttribute("LoginUser");
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET) 
	public String join(@ModelAttribute("userDTO") UserDTO userDTO, String dumy) {
		
		return "login";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST) 
	public String join(UserDTO userDTO) {
		
		userService.userJoin(userDTO);
		
		return "redirect:/";
	}
	
}
