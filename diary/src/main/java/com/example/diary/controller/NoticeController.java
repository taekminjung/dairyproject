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
import com.example.diary.service.NoticeService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeController {
	@Autowired  
	private NoticeService noticeService;
	@Autowired
	private CommentService commentService;
	@GetMapping(value="/noticeList")
	public String noticeList(Model model,
			@RequestParam(defaultValue = "1") int currentPage,HttpSession session) {
			if(session.getAttribute("loginMember")== null) {
			return "redirect:/login";
		}
			int rowPerPage = 3;
			int beginRow = (currentPage -1) * rowPerPage;
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("beginRow", beginRow);
			paramMap.put("rowPerPage", rowPerPage);
			System.out.println(paramMap);
			
			List<Notice> list = this.noticeService.list(paramMap);
			
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			System.out.println(list);
			return "noticeList";
	}
	
	@GetMapping(value= "/addNotice")
	public String addNotice() {
		
		return "addNotice";
	}
	
	@PostMapping(value= "/addNotice")
		public String addNotice(Notice notice, HttpSession session) {
		String memberId =( (Member)session.getAttribute("loginMember")).getMemberId();
		notice.setMemberId(memberId);
		int row  = this.noticeService.addNotice(notice);
		
		//mapper
		return "redirect:/noticeList";
	}
	@GetMapping(value = "/noticeOne")
		public String selectNoticeOne(Model model, Notice paramNotice, Map<String, Object> paramMap, @RequestParam(defaultValue = "1") int currentPage) {

		
		//공지사항 
		Notice resultNotice = this.noticeService.noticeOne(paramNotice);
		System.out.println(resultNotice+"<--resultNotice");
		model.addAttribute("resultNotice", resultNotice);
		
		int rowPerPage = 3;
		int beginRow = (currentPage -1) * rowPerPage;
		
		Map<String, Object> param = new HashMap<>();
		param.put("noticeNo", resultNotice.getNoticeNo());
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		System.out.println(param+"<-- param");

		List<Comment> com = this.commentService.list(param);
		model.addAttribute("com", com);
		System.out.println(com+"<--com");
		
		return "noticeOne";
	}
	@GetMapping(value="/deleteNotice")
		public String deleteNotice(Notice notice, Model model) {
		model.addAttribute("notice", notice);
		return "deleteNotice";
	}
	@PostMapping(value="/deleteNotice")
		public String deleteNotice(Notice notice) {
			int row = noticeService.deleteNotice(notice);
			return "redirect:/noticeList";
		}
	@GetMapping(value="updateNotice")
		public String updateNotice(Notice notice, Model model) {
		Notice now = noticeService.noticeOne(notice);
		model.addAttribute("now", now);
		return "updateNotice";
	}
	@PostMapping(value="updateNotice")
		public String updateNotice(Notice notice) {
		int row = noticeService.updateNotice(notice);
		return "redirect:/noticeList";
	}
}
