package com.example.diary.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.diary.service.MemberService;
import com.example.diary.vo.Member;

@RestController
public class MemberRest {
	@Autowired MemberService memberService;	
	
	@GetMapping("/idCheck")
	public int idCheck(String memberId) {
		Member member = new Member();
		member.setMemberId(memberId);
		int row = memberService.idCheck(member);
		
		return row;
	}
}
