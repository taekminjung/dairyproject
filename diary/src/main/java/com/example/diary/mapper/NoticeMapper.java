package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Comment;
import com.example.diary.vo.Notice;

@Mapper
public interface NoticeMapper {
	//목록(페이징)
		List<Notice> selectNoticeList(Map<String, Object> paramMap);

	//상세보기
	Notice selectNoticeOne(Notice paramNotice);
	//입력
	int insertNotice(Notice notice);
	//삭제
	int deleteNotice(Notice notice);
	//수정
	int updateNotice(Notice notice);
	//공지사항 상세보기에 댓글리스트 출력
	List<Comment> selectCommentList(Map<String, Object> paramMap) ;
	//공지사항에 첨부파일 갯수 출력
	List<Notice>selectNoticeListByPage(Map<String, Object> map);
}
