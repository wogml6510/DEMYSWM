package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Schedule;

@Mapper
public interface ScheduleRepository {

	public List<Schedule> getScheduleListByMEMBER_NUM(int MEMBER_NUM);

	public List<Schedule> getScheduleList();
	
	public Schedule getScheduleByMSG_NUM(int SC_NUM);
	
	public void registSchedule(Schedule schedule);
	
	public void modifySchedule(Schedule schedule);
	
	public void removeSchedule(int SC_NUM);
	
}