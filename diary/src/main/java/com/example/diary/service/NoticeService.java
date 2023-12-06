package com.example.diary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.NoticeMapper;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Notice;

@Service
@Transactional
public class NoticeService {
		@Autowired	private	NoticeMapper noticeMapper;
	//공지사항 리스트
	  public List<Notice> list(Map<String, Object> params) {
		  System.out.println(params + "<-------");
	        List<Notice> result = noticeMapper.selectNoticeList(params);
	        System.out.println(result);
	        return result;
	    }
	  //공지사항 상세
	  public Notice noticeOne(Notice paramNotice){
		  Notice one = noticeMapper.selectNoticeOne(paramNotice);
		  System.out.println(one +"<-- service one");
		  return one;
	  }
	  //공자사항 추가
	  public int addNotice(Notice notice) {
		  int row = noticeMapper.insertNotice(notice);
		  System.out.println(row+"<-- addNOtice One");
		  return 0;
	  }
	  //공지사항 삭제
	  public int deleteNotice(Notice notice) {
		  int row = noticeMapper.deleteNotice(notice);
		  return row;
	  }
	  //공지사항 수정
	  public int updateNotice(Notice notice) {
		  int row = noticeMapper.updateNotice(notice);
		  return row;
	  }
}
