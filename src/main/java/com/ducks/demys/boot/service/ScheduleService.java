package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.ScheduleRepository;
import com.ducks.demys.boot.vo.Schedule;

@Service
public class ScheduleService {
	
	private ScheduleRepository scheduleRepository;
	
	public ScheduleService(ScheduleRepository scheduleRepository) {
		this.scheduleRepository= scheduleRepository;
	}
	
	public List<Schedule> getScheduleList(){
		return scheduleRepository.getScheduleList();
	}
	
	public List<Schedule> getScheduleListByMEMBER_NUM(int MEMBER_NUM){
		return scheduleRepository.getScheduleListByMEMBER_NUM(MEMBER_NUM);
	}

	
	public Schedule getScheduleBySC_NUM(int SC_NUM) {
		return scheduleRepository.getScheduleBySC_NUM(SC_NUM);
	}
	
	public void registSchedule(Schedule schedule) {
		schedule.setSC_NUM(scheduleRepository.selectScheduleSequenceNextValue());
		scheduleRepository.registSchedule(schedule);
	}
	
	public void modifySchedule(Schedule schedule) {
		scheduleRepository.modifySchedule(schedule);
	}
	
	public void removeSchedule(int SC_NUM) {
		scheduleRepository.removeSchedule(SC_NUM);
	}
}
