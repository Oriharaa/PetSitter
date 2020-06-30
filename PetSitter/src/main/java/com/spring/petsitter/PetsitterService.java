package com.spring.petsitter;

import java.util.ArrayList;

public interface PetsitterService {
	public int petsitterInsert(PetsitterVO petsitter);
	public int petsitterCheck(PetsitterVO petsitter);
	public ArrayList<PetsitterVO> petsitterList();
	public PetsitterVO selectPetsitter(PetsitterVO petsitter);
	public int petsitterApproval(PetsitterVO petsitter);
	public int petsitterRefusal(PetsitterVO petsitter);
}
