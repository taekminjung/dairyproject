package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Schedule;

@Mapper
public interface ScheduleMapper {
	
			//스케줄 최대년 구하기
			int selectScheduleMaxYear();
			//스케줄 최소년 구하기
			int selectScheduleMinYear();
			//연월일로 검색
			List<Schedule> selectScheduleListBySearch(Map<String, Object> paramMap);
			//연월일 검색 결과 카운팅
			int selectScheduleByYMDCnt(Map<String, Integer> paramMap);
		   
		   List<Schedule> selectScheduleListByWord(String word, String memberId);
		   
		   List<Schedule> selectScheduleListByMonth(Map<String, Object> paramMap);
			List<Map<String, Object>> getScheduleListByMonth(Map<String, Object> map);
			
			List<Map<String, Object>> ScheduleList(Map<String, Object> map);
			
			//삭제
			int deleteSchedule(Schedule schedule);
			//추가
			int insertSchedule(Schedule schedule);
			//수정
			int updateSchedule(Schedule schedule);
			
}
