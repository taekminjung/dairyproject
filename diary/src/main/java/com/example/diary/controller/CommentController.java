package com.example.diary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CommentService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {
		@Autowired
		private CommentService commentService;
		
		@GetMapping(value="/addComment")
		public String addComment() {
			return "addComment";	
		}
		@PostMapping(value="/addComment")
		public String addComment(Comment comment, HttpSession session) {
			String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
			comment.setMemberId(memberId);
			int row = this.commentService.addComment(comment);
			
			String a = "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
			return a;
		}
		@GetMapping(value="/deleteComment")
		public String deleteComment(Comment comment, HttpSession session) {
			String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
			comment.setMemberId(memberId);
			System.out.println(comment+"<--deletecomment");
			int row = this.commentService.deleteComment(comment);
			
			
			String a = "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
			return a;
		}
		@GetMapping(value="updateComment")
		public String selectCommentOne(Comment comment, Model model, HttpSession session) {
			String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
			comment.setMemberId(memberId);
			Comment resultC = this.commentService.selectCommentOne(comment);
			model.addAttribute("resultC", resultC);
			System.out.println(resultC+"<--commentOne");
			return "updateComment";
		}
		
		@PostMapping(value="/updateComment")
		public String updateComment(Comment comment, HttpSession session) {
			String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
			comment.setMemberId(memberId);
			System.out.println(comment+"<--updatecomment");
			int row = this.commentService.updateComment(comment);
			
			String a = "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
			return a;
		}
}
