package com.example.diary.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CalendarService;
import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleController {
		@Autowired private ScheduleService scheduleService;
	 @Autowired private CalendarService calendarService;
		@GetMapping(value="/ScheduleList")
		public String  ScheduleList(HttpSession session, Schedule schedule, @RequestParam(required = false) Integer targetY,
				@RequestParam(required = false) Integer targetM, @RequestParam(required = false) Integer targetD, Model model) {
			if(session.getAttribute("loginMember")== null) {
				return "login";
			}
			String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
			schedule.setMemberId(memberId);
			
			List<Map<String, Object>> list  = this.scheduleService.ScheduleList(memberId, targetY, targetM ,targetD);
			model.addAttribute("list", list);
			model.addAttribute("targetY", targetY);
			model.addAttribute("targetM", targetM);
			model.addAttribute("targetD", targetD);
			System.out.println(list+"<---controller.list");
			return "ScheduleList";
   }
		@GetMapping(value="/deleteSchedule")
		public String deleteSchedule(Schedule schedule, Model model,int targetY, int targetM, int targetD) {
			model.addAttribute("schedule", schedule);
			int row = scheduleService.deleteSchedule(schedule);
			String S = "redirect:/ScheduleList?targetY="+targetY+"&targetM="+targetM+"&targetD="+targetD;
			return S;
		}
		//스케줄 추가
	@PostMapping(value="insertSchedule")
	public String insertSchedule(HttpSession session, Schedule schedule, Model model,int targetY, int targetM, int targetD) {
		if(session.getAttribute("loginMember")== null) {
			return "login";
		}
		LocalDate date = LocalDate.of(targetY, targetM, targetD);
		String scheduleDate = date.toString();
		schedule.setScheduleDate(scheduleDate);
		String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
		schedule.setMemberId(memberId);
		int row  = scheduleService.insertSchedule(schedule);
		String A = "redirect:/ScheduleList?targetY="+targetY+"&targetM="+targetM+"&targetD="+targetD;
		return A;
	}
	//스케줄 수정
	@GetMapping(value= "updateSchedule")
		public String updateSchedule(HttpSession session, int scheduleNo, int targetY, int targetM, int targetD,Model model) {
		if(session.getAttribute("loginMember")== null) {
			return "login";
		}
		model.addAttribute("targetY", targetY);
		model.addAttribute("targetM", targetM);
		model.addAttribute("targetD", targetD);
		model.addAttribute("scheduleNo", scheduleNo);
		return "updateSchedule";
	}
	@PostMapping(value= "updateSchedule")
	 	public String updateSchedule(HttpSession session, Schedule schedule, int targetY, int targetM, int targetD, int scheduleNo, Model model) {
		if(session.getAttribute("loginMember")== null) {
			return "login";
		}
		String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
		schedule.setMemberId(memberId);
		LocalDate date = LocalDate.of(targetY, targetM, targetD);
		String scheduleDate = date.toString();
		schedule.setScheduleDate(scheduleDate);
		schedule.setScheduleNo(scheduleNo);
		int row = this.scheduleService.updateSchedule(schedule);
		model.addAttribute(row);
		String A = "redirect:/ScheduleList?targetY="+targetY+"&targetM="+targetM+"&targetD="+targetD;
		return A;
	}
	//스케줄 검색 기능
	@GetMapping("/selectScheduleListByWord")
	public String scheduleListByWord(Model model, @RequestParam(defaultValue = "") String word, HttpSession session,
																			@RequestParam(defaultValue = "1")int currentPage,
																			@RequestParam(defaultValue = "")String year,
																			@RequestParam(defaultValue = "")String month,
																			@RequestParam(defaultValue = "")String date) {
		if(session.getAttribute("loginMember")== null) {
			return "login";
		}
		Map<String, Integer> maxMinMap = scheduleService.getScheduleYearMaxMin();
			String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
			List<Schedule> list = scheduleService.getScheduleListByWord(word, memberId);
			int lastPage = scheduleService.getScheduleListByYMDCnt(year, month, date);
			System.out.println(maxMinMap+"<=============");
			model.addAttribute("maxMinMap", maxMinMap);
			model.addAttribute("list", list);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("year", year);
			model.addAttribute("month", month);
			model.addAttribute("date", date);
		return "/selectScheduleListBySearch";
	}
	//연월일로 검색
		@GetMapping("/selectScheduleListBySearch")
		public String selectScheduleListBySearch(Model model, HttpSession session, String word,
										@RequestParam(defaultValue = "1")int currentPage,
										@RequestParam(defaultValue = "")String year,
										@RequestParam(defaultValue = "")String month,
										@RequestParam(defaultValue = "")String date) {
			if(session.getAttribute("loginMember")== null) {
				return "login";
			}
			// scheduleService 호출
			Map<String, Integer> maxMinMap = scheduleService.getScheduleYearMaxMin();
			String memberId = ( (Member)session.getAttribute("loginMember")).getMemberId();
			List<Schedule> list = scheduleService.selectScheduleListBySearch(currentPage, year, month, date, memberId);
			int lastPage = scheduleService.getScheduleListByYMDCnt(year, month, date);
			log.debug("\u001B[42m"+maxMinMap.get("maxYear")+"");
			log.debug("\u001B[42m"+maxMinMap.get("minYear")+"");
			
			//view로 보낼 값 설정
			model.addAttribute("list", list);
			model.addAttribute("maxMinMap", maxMinMap);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("year", year);
			model.addAttribute("month", month);
			model.addAttribute("date", date);
			
			//리턴
			return "/selectScheduleListBySearch";
		}
}