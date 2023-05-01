package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Issue;

@Mapper
public interface IssueRepository {

	public List<Issue> getIssueList();
	
	public Issue getIssueByISSUE_NUM(int ISSUE_NUM);
	
	public void registIssue(Issue issue);
	
	public void modifyIssue(Issue issue);
	
	public void removeIssue(int ISSUE_NUM);
	
}