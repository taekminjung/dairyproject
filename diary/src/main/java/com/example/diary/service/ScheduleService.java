package com.example.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.vo.Schedule;

@Service
@Transactional
public class ScheduleService {
	@Autowired
	 	private ScheduleMapper scheduleMapper;
		//달력출력
		public List<Map<String, Object>> getScheduleListByMonth(String memberId, int targetY, int targetM){
			Map<String, Object> map = new HashMap<>();
			map.put("memberId", memberId );
			map.put("targetY", targetY );
			map.put("targetM", targetM+1 );
			System.out.println(memberId+"<--service.scheduleListByMonthMap");
			
			
			 
			return scheduleMapper.getScheduleListByMonth(map);
		}
		//스케줄리스트 출력
		public List<Map<String, Object>> ScheduleList(String memberId, int targetY, int targetM, int targetD){
			Map<String, Object> list = new HashMap<>();
			list.put("memberId", memberId);
			list.put("targetY", targetY);
			list.put("targetM", targetM);
			list.put("targetD", targetD);
			System.out.println(list+"<---service.hashMaplist");
			return scheduleMapper.ScheduleList(list);
		}
		//스케줄 삭제
		public int deleteSchedule(Schedule schedule) {
			int row = scheduleMapper.deleteSchedule(schedule);
			return row;
		}
		//스케줄 추가
		public int insertSchedule(Schedule schedule) {
			int row = scheduleMapper.insertSchedule(schedule);
			return row;
		}
		//스케줄 수정
		public int updateSchedule(Schedule schedule) {
			int row = scheduleMapper.updateSchedule(schedule);
			return row;
		}
		//스케줄 검색
		public List<Schedule> getScheduleListByWord(String word, String memberId){
				List<Schedule> list  = scheduleMapper.selectScheduleListByWord(word, memberId);

				return list;
		}
	
		//페이징
		int rowPerPage = 10;
		
		//최대 최소 년도
		public Map<String, Integer> getScheduleYearMaxMin(){
			Integer maxYear = scheduleMapper.selectScheduleMaxYear();
			Integer minYear = scheduleMapper.selectScheduleMinYear();
			
			Map<String, Integer> map = new HashMap<>();
			map.put("minYear", minYear);
			map.put("maxYear", maxYear);
			
			return map;
		}
		//연월일 검색
		public List<Schedule> selectScheduleListBySearch(int currentPage, String year,String month,String date, String memberId){
			int beginRow = (currentPage -1)*rowPerPage;
			
			Map<String, Object> paramMap = new HashMap<>();
			if(year.equals("")) {
				paramMap.put("year",null);
			}else {
				paramMap.put("year", Integer.parseInt(year));
			}
			if(month.equals("")) {
				paramMap.put("month",null);
			}else {
				paramMap.put("month", Integer.parseInt(month));
			}
			if(date.equals("")) {
				paramMap.put("date",null);
			}else {
				paramMap.put("date", Integer.parseInt(date));
			}
			paramMap.put("memberId", memberId);
			paramMap.put("rowPerPage", rowPerPage);
			paramMap.put("beginRow", beginRow);
			
			return scheduleMapper.selectScheduleListBySearch(paramMap);
		}
		//연월일 검색 목록 카운팅
		public int getScheduleListByYMDCnt(String year,String month,String date) {
			
			Map<String, Integer> paramMap = new HashMap<>();
			if(year.equals("")) {
				paramMap.put("year",null);
			}else {
				paramMap.put("year", Integer.parseInt(year));
			}
			if(month.equals("")) {
				paramMap.put("month",null);
			}else {
				paramMap.put("month", Integer.parseInt(month));
			}
			if(date.equals("")) {
				paramMap.put("date",null);
			}else {
				paramMap.put("date", Integer.parseInt(date));
			}
			
			int totalCnt = scheduleMapper.selectScheduleByYMDCnt(paramMap);
			int lastPage = totalCnt / rowPerPage;
			if((totalCnt % rowPerPage) != 0) {
				lastPage = lastPage + 1;
			}
			
			return lastPage;
		}
}
