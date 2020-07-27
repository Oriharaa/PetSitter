package com.spring.petsitter;

import java.util.ArrayList;

public interface PetService {
	public int petInsert(PetVO pet);
	public ArrayList<PetVO> selectPet(String id);
}