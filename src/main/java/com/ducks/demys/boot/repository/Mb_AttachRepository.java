package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Mb_Attach;

@Mapper
public interface Mb_AttachRepository {
	
	public List<Mb_Attach> getMb_AttachListByMB_NUM(int MB_NUM);
	
	public Mb_Attach getMbatByMBAT_NUM(int MBAT_NUM);
	
	public void registMb_Attach(Mb_Attach mbat);
		
	public void removeMb_Attach(int MBAT_NUM);
}
