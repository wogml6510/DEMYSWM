package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.Budget_DetailRepository;
import com.ducks.demys.boot.vo.Budget_Detail;

@Service
public class Budget_DetailService {
	
	private Budget_DetailRepository budget_DetailRepository;
	
	public Budget_DetailService(Budget_DetailRepository budget_DetailRepository) {
		this.budget_DetailRepository= budget_DetailRepository;
	}
	
	public List<Budget_Detail> getBuddtListByBUD_NUM(int BUD_NUM){
		return budget_DetailRepository.getBuddtListByBUD_NUM(BUD_NUM);
	}
	
	public Budget_Detail getBuddtByBUDDT_NUM(int BUDDT_NUM) {
		return budget_DetailRepository.getBuddtByBUDDT_NUM(BUDDT_NUM);
	}
	
	public void registBUDDT(Budget_Detail buddt) {
		buddt.setBUDDT_NUM(budget_DetailRepository.selectBuddtSequenceNextValue());
		budget_DetailRepository.registBUDDT(buddt);
	}
	
	public void modifyBUDDT(Budget_Detail buddt) {
		budget_DetailRepository.modifyBUDDT(buddt);
	}
	
	public void removeBUDDT(int BUDDT_NUM) {
		budget_DetailRepository.removeBUDDT(BUDDT_NUM);
	}
}
