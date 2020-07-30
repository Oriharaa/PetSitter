package com.spring.petsitter;

<<<<<<< HEAD
public interface PetService {
	public int petInsert(PetVO pet);

=======
import java.util.ArrayList;

public interface PetService {
	public int petInsert(PetVO pet);
	public ArrayList<PetVO> selectPet(String id);
	public PetVO selectPet2(String id, String name);
	public void updatePet(PetVO petvo);
	public void deletePet(String id, String name);
>>>>>>> Hong
}
