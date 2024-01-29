package com.example.diary.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.MemberMapper;
import com.example.diary.vo.Member;

@Service
@Transactional
public class MemberService {
		@Autowired
		private MemberMapper memberMapper;
		
		public Member login(Member paramMember) {
				Member loginMember = memberMapper.login(paramMember);
				return loginMember;
			}
		//회원가입
		public int addMember(Member paramMember) {
			int add = memberMapper.insertMember(paramMember);
			return 0;
		}
		//비밀번호 수정
		public int updatePw(Map<String, Object> paramMap) {
			System.out.println(paramMap+"<-- paramMap");
			return memberMapper.updatePw(paramMap);
			
		}
		//idCheck
		public int idCheck(Member member) {
			
			return memberMapper.idCheck(member);
		}
}
