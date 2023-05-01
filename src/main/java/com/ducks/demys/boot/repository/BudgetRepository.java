package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Budget;

@Mapper
public interface BudgetRepository {

	public List<Budget> getBudgetList();
	
	public Budget getBudgetByBudget_NUM(int BUDGET_NUM);
	
	public void registBudget(Budget budget);
	
	public void modifyBudget(Budget budget);
	
	public void removeBudget(int BUDGET_NUM);
}
