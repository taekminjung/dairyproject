package com.example.diary.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.diary.service.MemberService;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
		@Autowired
		private MemberService memberService;
		
				@GetMapping("/login")
				public String login(HttpSession session,  Model model) {
						//로그인 전에만
						if(session.getAttribute("loginMember") != null) {
							return "redirect:/home";
					}
					return "login";
				}
				
				@PostMapping("/login")
				public String login(HttpSession session, Member paramMember) {
					Member loginMember = 	memberService.login(paramMember);
					if(loginMember == null) {
						//로그인 실패
						return "redirect:/login";
					}
					session.setAttribute("loginMember", loginMember);
					
					return "redirect:/home";
				}
				//회원가입 폼
				@GetMapping("addMember")
				public String addMember() {
					
					return "addMember";
					
				}
				//회원가입 액션
				@PostMapping(value= "addMember")
				public String addMember(Member member) {
					
					int row = this.memberService.addMember(member);
					
					return "redirect:/login";
				}
				//로그아웃
				@GetMapping(value="logout")
				public String logout(HttpServletRequest request, HttpServletResponse response) {
					//세션 초기화
					request.getSession().invalidate();
					//로그아웃 성공 리다이렉트
					return "redirect:/login";
			}
				//비밀번호 수정 폼
				@GetMapping(value="updatePw")
				public String updatePw(HttpSession session) {
					if(session.getAttribute("loginMember") ==null) {
						return "redirect:/login";
					}
					return "updatePw";
				}
				//비밀번호 수정 액션
				@PostMapping(value="updatePw")
				public String updatePw(HttpSession session, int memberPw, int newMemberPw) {
					int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
					Map<String,Object> pwMap = new HashMap<>();
					pwMap.put("newMemberPw", newMemberPw);
					pwMap.put("memberPw", memberPw); 
					pwMap.put("memberNo", memberNo);
				
					int row = memberService.updatePw(pwMap);
					System.out.println(pwMap+"<-- pwMap");
					session.invalidate();
					return "redirect:/login";
				}
}
