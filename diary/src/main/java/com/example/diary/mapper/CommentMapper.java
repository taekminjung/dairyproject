package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Comment;
 
@Mapper
public interface CommentMapper {
			//댓글리스트 출력
		List<Comment> selectCommentList(Map<String, Object> paramMap) ;
		//댓글 입력
		int insertComment(Comment comment);
		//댓글 삭제
		int deleteComment(Comment comment);
		//댓글 수정
		int updateComment(Comment comment);
		//댓글 상세
		Comment selectCommentOne(Comment comment);
}
