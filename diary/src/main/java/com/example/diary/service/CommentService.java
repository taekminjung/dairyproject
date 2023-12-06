package com.example.diary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.CommentMapper;
import com.example.diary.vo.Comment;

@Service
@Transactional
public class CommentService {
	
		@Autowired
		private CommentMapper commentMapper;
		//댓글 리스트
		  public List<Comment> list(Map<String, Object> paramMap) {
			  System.out.println(paramMap + "<-------");
		        List<Comment> result = commentMapper.selectCommentList(paramMap);
		        System.out.println(result+"<--result");
		        return result;
		}
		 //댓글 추가
		  public int addComment(Comment comment) {
			  System.out.println(comment+"<-- comment");
			  int row = commentMapper.insertComment(comment);
			  return 0;
		  }
		  //댓글 삭제
		  public int deleteComment(Comment comment) {
			  System.out.println(comment+"<--deletecomment");
			  int row = commentMapper.deleteComment(comment);
			  return row;
		  }
		  //댓글 상세 출력
		  public Comment selectCommentOne(Comment comment) {
			  System.out.println(comment+"<--commentOne");
			  Comment resultC = commentMapper.selectCommentOne(comment);
			  return resultC;
		  }
		  //댓글 수정
		  public int updateComment(Comment comment) {
			  System.out.println(comment+"<--updatecomment");
			  int row = commentMapper.updateComment(comment);
			  return row;
		  }
}
