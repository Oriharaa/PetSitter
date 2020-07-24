package com.spring.mapper;

import java.util.ArrayList;

import com.spring.petsitter.PetVO;

public interface PetMapper {
	public int insertPet(PetVO pet);
	
	
	public ArrayList<PetVO> selectPet(String id);

}
