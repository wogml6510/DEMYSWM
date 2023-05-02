package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Schedule;

@Mapper
public interface ScheduleRepository {

	public List<Schedule> getScheduleList();

	public List<Schedule> getScheduleListByMEMBER_NUM(int MEMBER_NUM);
	
	public Schedule getScheduleBySC_NUM(int SC_NUM);
	
	public int selectScheduleSequenceNextValue();
	
	public void registSchedule(Schedule schedule);
	
	public void modifySchedule(Schedule schedule);
	
	public void removeSchedule(int SC_NUM);
	
}