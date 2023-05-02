package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.ProjectsRepository;
import com.ducks.demys.boot.vo.Projects;

@Service
public class ProjectsService {
	
	private ProjectsRepository projectsRepository;
	
	public ProjectsService(ProjectsRepository projectsRepository) {
		this.projectsRepository= projectsRepository;
	}
	
	public List<Projects> getPJList(){
		return projectsRepository.getPJList();
	}
	public List<Projects> getPJListByMEMBER_NUM(int MEMBER_NUM){
		return projectsRepository.getPJListByMEMBER_NUM(MEMBER_NUM);
	}

	public Projects getPJByPJ_NUM(int PJ_NUM){
		return projectsRepository.getPJByPJ_NUM(PJ_NUM);
	}
	
	public void registPJ(Projects project) {
		project.setPJ_NUM(projectsRepository.selectPJSequenceNextValue());
		projectsRepository.registPJ(project);
	}
	
	public void modifyPJ(Projects project) {
		projectsRepository.modifyPJ(project);
	}
	
	public void removePJ(int PJ_NUM) {
		projectsRepository.removePJ(PJ_NUM);
	}
}
