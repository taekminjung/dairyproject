package com.example.diary.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Member;

@Mapper
public interface MemberMapper {
			//로그인
			Member login(Member member);
			
			//회원가입
			int insertMember(Member member) ;
			//비밀번호 수정
			int updatePw(Map<String, Object> MemberPwMap);
			//idCheck
			int idCheck(Member member);
}
