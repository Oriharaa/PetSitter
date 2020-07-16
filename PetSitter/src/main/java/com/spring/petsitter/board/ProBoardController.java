package com.spring.petsitter.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;




@Controller
public class ProBoardController {
	
	@Autowired
	private ProBoardService proboardService;	
	
	
	
	@RequestMapping("/proboard.bo") 
	public String getBoardlist(Model model, @RequestParam(value="page", required=false, 
			defaultValue="1") int page) { 
		int limit=6;
		
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd");
		//System.out.println("page1 = " + page);
		int listcount=proboardService.getProListCount();
		
		int startrow = (page-1)*6+1;
		int endrow = startrow+limit-1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		//System.out.println("startrow" + hashmap.get("startrow"));
		List<ProBoardVO> boardlist = proboardService.getProBoardList(hashmap); // 다른 타입 2개를 전달해야하므로
		//System.out.println(boardlist.get(0).getPRO_SUBJECT());
		System.out.println("boardlist.get(0).getPRO_ORG_FILE() : "+boardlist.get(0).getPRO_ORG_FILE());
		System.out.println("boardlist.get(0).getPRO_UP_FILE() : "+boardlist.get(0).getPRO_UP_FILE());
		boardlist.get(0).getPRO_ORG_FILE().equals("N");
		for(int i = 0; i < boardlist.size(); i++) {
		boardlist.get(i).setREAL_DATE(new_Format.format(boardlist.get(i).getPRO_DATE()));
		}
		
		//System.out.println("날짜 계산" + boardlist.get(0).getPRO_DATE());
		//System.out.println("날짜 계산" + boardlist.get(0).getREAL_DATE());
		
		//총 페이지 수
   		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		return "board/proboard";
	}
	

	@RequestMapping(value="/proboard2.bo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ProBoardVO> getBoardlist2(@RequestParam(value="page", required=false, 
			defaultValue="1") int page) { 
		int limit=6;
		//System.out.println("page2 = " + page);
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd");
		
		int listcount=proboardService.getProListCount();
		
		int startrow = (page-1)*6+1; //7
		int endrow = startrow+limit-1; //12
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		//System.out.println("startrow 7 :" + hashmap.get("startrow"));
		//System.out.println("endrow 12 : " + hashmap.get("endrow"));
		List<ProBoardVO> boardlist = proboardService.getProBoardList(hashmap); // 다른 타입 2개를 전달해야하므로
		//System.out.println("boardlist size  : " + boardlist.size());
		//System.out.println("date1: "+boardlist.get(0).getPRO_DATE());
		
		for(int i = 0; i < boardlist.size(); i++) {
		boardlist.get(i).setREAL_DATE(new_Format.format(boardlist.get(i).getPRO_DATE()));
		}
		
		//System.out.println("날짜 계산2" + boardlist.get(0).getPRO_DATE());
		//System.out.println("날짜 계산2" + boardlist.get(0).getREAL_DATE());
		
		//총 페이지 수
   		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		

   		boardlist.get(0).setPage2(page);
   		boardlist.get(0).setListcount2(listcount);
   		boardlist.get(0).setMaxpage2(maxpage);
   		boardlist.get(0).setStartpage2(startpage);
   		boardlist.get(0).setEndpage2(endpage);
   		
   		for(int i = 1; i < boardlist.size(); i++) {
   			boardlist.get(i).setPage2(0);
   	   		boardlist.get(i).setListcount2(0);
   	   		boardlist.get(i).setMaxpage2(0);
   	   		boardlist.get(i).setStartpage2(0);
   	   		boardlist.get(i).setEndpage2(0);
   		}
   		
   		//System.out.println("testpage1 : " + boardlist.get(0).getPage2());
   		//System.out.println("testpage2 : " + boardlist.get(1).getPage2());

		return boardlist;
	}	
	
	@RequestMapping("/proboardwriteform.bo") 
	public String boardInsertForm() {
		
		return "board/proboard_write";
	}

	@RequestMapping("/proboardwrite.bo") 
	public String boardInsert(ProBoardVO vo) throws Exception {
		System.out.println("vo.getId()=" + vo.getMEMBER_ID());
		System.out.println("vo.getFile()=" + vo.getPRO_FILE());
		System.out.println("vo.getFile02()=" + vo.getPRO_FILE02());
		MultipartFile mf = vo.getPRO_FILE();    
		MultipartFile mf2 = vo.getPRO_FILE02();    
		System.out.println("mf=" + mf);
    	String uploadPath = "C:\\Project156\\upload\\";
    	if(vo.getSECRET_CHECK() == null) {
    		vo.setSECRET_CHECK("N");
    	}
        if(mf.getSize() != 0) {            
           		
    		String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
    		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
    		//예외처리 기능 필요함.     
    		
    		//mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename())); 
    		mf.transferTo(new File(uploadPath+storedFileName));
    		vo.setPRO_ORG_FILE(mf.getOriginalFilename());
    		vo.setPRO_UP_FILE(storedFileName);
    		
    		if(mf2.getSize() != 0){
    			String originalFileExtension02 = mf2.getOriginalFilename().substring(mf2.getOriginalFilename().lastIndexOf("."));
        		String storedFileName02 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension02;	
            	
        		mf2.transferTo(new File(uploadPath+storedFileName02));
        		vo.setPRO_ORG_FILE(mf.getOriginalFilename()+","+mf2.getOriginalFilename());
        		vo.setPRO_UP_FILE(storedFileName+","+storedFileName02);
        		//System.out.println("vo.getPRO_ORG_FILE = " + vo.getPRO_ORG_FILE());
        		//System.out.println("vo.getPRO_UP_FILE = " + vo.getPRO_UP_FILE());
            }	
        }else {
        	vo.setPRO_ORG_FILE("N");
        	vo.setPRO_UP_FILE("N");
        }
        
		
		int res = proboardService.proboardInsert(vo);
		System.out.println("sql완료");
		return "redirect:/proboard.bo";
	}
	
	@RequestMapping("/proboarddetail.bo") 
	public String getProDetail(@RequestParam(value="num", required=true) int num, Model model) {
		ProBoardVO vo = proboardService.getProDetail(num);
		System.out.println(num);
		model.addAttribute("vo", vo);
		System.out.println("vo.getMEMBER_NICKNAME() : " + vo.getMEMBER_NICKNAME());
		return "redirect:/proboard.bo";
	}

	
	//파일 다운로드 방식
    @RequestMapping("/profiledownload.bo")
    public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	response.setCharacterEncoding("utf-8");
    	
    	String num = request.getParameter("num");
    	String of = request.getParameter("of"); // 서버에 업로드된 변경된 실제 파일명
        String of2 = request.getParameter("of2"); // 오리지날 파일명
        
        /* //웹사이트 루트디렉토리의 실제 디스크상의 경로 알아내기.
        String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
        String fullPath = uploadPath+"/"+of;
        */
        String uploadPath = "C:\\Project156\\upload\\";  // 직접 경로 지정
        String fullPath = uploadPath + of;
        File downloadFile = new File(fullPath);
        
      //파일 다운로드를 위해 컨테츠 타입을 application/download 설정
        response.setContentType("application/download; charset=UTF-8");
        //파일 사이즈 지정
        response.setContentLength((int)downloadFile.length());
      //다운로드 창을 띄우기 위한 헤더 조작
        response.setHeader("Content-Disposition", "attachment;filename="
                                        + new String(of2.getBytes(), "ISO8859_1"));
        response.setHeader("Content-Transfer-Encoding","binary");
        
        FileInputStream fin = new FileInputStream(downloadFile);
        ServletOutputStream sout = response.getOutputStream();

        byte[] buf = new byte[1024];
        int size = -1;

        while ((size = fin.read(buf, 0, buf.length)) != -1) {
            sout.write(buf, 0, size);
        }
        fin.close();
        sout.close();
    }	
	
	
}
