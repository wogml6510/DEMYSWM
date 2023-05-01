package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Projects;

@Mapper
public interface ProjectsRepository {

	public List<Projects> getProjectList();
	
	public Projects getPJByPJ_NUM(int PJ_NUM);
	
	public void registPJ(Projects project);
	
	public void modifyPJ(Projects project);
	
	public void removePJ(int PJ_NUM);
}
