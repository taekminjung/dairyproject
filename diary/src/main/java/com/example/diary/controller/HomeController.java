package com.example.diary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CalendarService;
import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired CalendarService calendarService;
	@Autowired ScheduleService scheduleService;
	
	@GetMapping("/home")
	public String home(HttpSession session, Model model,
						@RequestParam(required = false) Integer targetY,
						@RequestParam(required = false) Integer targetM,
						@RequestParam(required = false) Integer targetD
						) {
		// 로그인 후에만
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		
		Map<String, Object> calendarMap = calendarService.getCalendar(targetY, targetM, targetD);
		model.addAttribute("calendarMap", calendarMap);
		System.out.println(calendarMap+"<--calendarMap");
		String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
		List<Map<String, Object>> list = scheduleService.getScheduleListByMonth( memberId, (int)calendarMap.get("targetY"), (int)calendarMap.get("targetM"));
		model.addAttribute("list", list);
		System.out.println(list+"<--schedulelist");
		return "home";
	}
}