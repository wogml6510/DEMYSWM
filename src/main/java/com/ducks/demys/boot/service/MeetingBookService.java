package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.MeetingBookRepository;
import com.ducks.demys.boot.vo.MeetingBook;

@Service
public class MeetingBookService {
	
	private MeetingBookRepository meetingBookRepository;
	
	public MeetingBookService(MeetingBookRepository meetingBookRepository) {
		this.meetingBookRepository= meetingBookRepository;
	}
	
	public List<MeetingBook> getMeetingBookListByPJ_NUM(int PJ_NUM){
		return meetingBookRepository.getMeetingBookListByPJ_NUM(PJ_NUM);
	}
	
	public MeetingBook getMeetingBookByMB_NUM(int MB_NUM){
		return meetingBookRepository.getMeetingBookByMB_NUM(MB_NUM);
	}
	
	public void registMeetingBook(MeetingBook meetingBook) {
		meetingBook.setMB_NUM(meetingBookRepository.selectMeetingBookSequenceNextValue());
		meetingBookRepository.registMeetingBook(meetingBook);
	}
	
	public void modifyMeetingBook(MeetingBook meetingBook) {
		meetingBookRepository.modifyMeetingBook(meetingBook);
	}
	
	public void removeMeetingBook(int MB_NUM) {
		meetingBookRepository.removeMeetingBook(MB_NUM);
	}
}
