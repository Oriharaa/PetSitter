package com.spring.petsitter;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PetsitterMapper;
import com.spring.petsitter.board.ReviewBoardVO;
import com.spring.mapper.ReservationMapper;

@Service("petsitterService")
public class PetsitterServiceImpl implements PetsitterService{

	@Autowired
	private SqlSession sqlSession;
	
	
	
	@Override
	public int petsitterNicknameCheck(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterNicknameCheck(petsitter);
		return res;
	}

	@Override
	public int reflyUpdate(ReviewBoardVO vo) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res =petsitterMapper.reflyUpdate(vo);
		return res;
	}

	@Override
	public int petsitterUpdate(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterUpdate(petsitter);
		return res;
	}

	@Override
	public int petsitterSchedule(PetsitterScheduleVO petsitterSchedule) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterSchedule(petsitterSchedule);
		
		return res;
	}

	@Override
	public int petsitterInsert(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.insertPetsitter(petsitter);
		return res;
	}

	@Override
	public int petsitterCheck(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterCheck(petsitter);
		return res;
	}

	@Override
	public ArrayList<PetsitterVO> petsitterList() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		ArrayList<PetsitterVO> petsitter_list = petsitterMapper.petsitterList();
		return petsitter_list;
	}

	@Override
	public PetsitterVO selectPetsitter(String id) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		PetsitterVO vo = new PetsitterVO();
		vo = petsitterMapper.selectPetsitter(id);
		return vo;
	}

	@Override
	public int petsitterApproval(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		int res = petsitterMapper.petsitterApproval(petsitter);
		return res;
	}

	@Override
	public int petsitterRefusal(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		int res = petsitterMapper.petsitterRefusal(petsitter);
		return res;
	}

	// 방문 펫시터 목록
	@Override
	public List<PetsitterVO> petsitterList_Bang() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_Bang();
		return petsitter_list;
	}

	// 위탁 펫시터 목록
	@Override
	public List<PetsitterVO> petsitterList_We() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We();
	public List<PetsitterVO> petsitterList_We(String btn1, String btn2, String btn3, String btn4, 
											  String btn_a, String btn_b, String btn_c, String btn_g, String btn_type) {
		ReservationMapper reservationMapper = sqlSession.getMapper(ReservationMapper.class);
		List<PetsitterVO> petsitter_list = reservationMapper.petsitterList_We(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
		return petsitter_list;
	}
	
	// 리뷰 등록 후 펫시터 평점 수정
	@Override
	public void petsitterscoreupdate(String id, double score) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		petsitterMapper.petsitterscoreupdate(id, score);
	}
	
}
