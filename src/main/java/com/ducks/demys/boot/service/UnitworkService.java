package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.UnitworkRepository;
import com.ducks.demys.boot.vo.Unitwork;

@Service
public class UnitworkService {
	
	private UnitworkRepository unitworkRepository;
	
	public UnitworkService(UnitworkRepository unitworkRepository) {
		this.unitworkRepository= unitworkRepository;
	}
	
	public List<Unitwork> getUnitworkListByPJ_NUM(int PJ_NUM){
		return unitworkRepository.getUnitworkListByPJ_NUM(PJ_NUM);
	}
	
	public List<Unitwork> getUnitworkListByMEMBER_NUM(int MEMBER_NUM){
		return unitworkRepository.getUnitworkListByMEMBER_NUM(MEMBER_NUM);
	}

	
	public Unitwork getUnitworkByUW_NUM(int UW_NUM) {
		return unitworkRepository.getUnitworkByUW_NUM(UW_NUM);
	}
	
	public void registUnitwork(Unitwork unitwork) {
		unitwork.setUW_NUM(unitworkRepository.selectUnitworkSequenceNextValue());
		unitworkRepository.registUnitwork(unitwork);
	}
	
	public void modifyUnitwork(Unitwork unitwork) {
		unitworkRepository.modifyUnitwork(unitwork);
	}
	
	public void removeUnitwork(int UW_NUM) {
		unitworkRepository.removeUnitwork(UW_NUM);
	}
}
