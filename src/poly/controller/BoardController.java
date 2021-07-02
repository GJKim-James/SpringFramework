package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.BoardDTO;
import poly.service.IBoardService;

@Controller
public class BoardController {

	@Resource(name = "BoardService")
	IBoardService boardService;

	// 로거
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "board/boardList")
	public String boardList(ModelMap model) {

		log.info("boardList start!!");

		List<BoardDTO> rList = boardService.getBoardList();

		if (rList == null) {
			rList = new ArrayList<>();
		}

		for (BoardDTO rDTO : rList) { // for each 문
			log.info("POST_NO : " + rDTO.getPOST_NO());
		}

		model.addAttribute("rList", rList);

		return "/board/boardList";
	}

	@RequestMapping(value = "board/newPost")
	public String newPost() {

		log.info("newPost start!!");

		return "/board/newPost";
	}

	@RequestMapping(value = "board/doPost")
	public String doPost(HttpServletRequest request, ModelMap model) {

		// 임시로 설정하는 아이디
		String id = "admin";

		// 요청으로부터 받은 파라미터를 변수에 저장
		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");
		log.info("post_title : " + post_title);
		log.info("post_content : " + post_content);

		// 게시자, 게시글 제목, 게시글 내용을 담아 서비스에 전송할 DTO 객체 생성
		BoardDTO pDTO = new BoardDTO();

		pDTO.setREG_ID(id);
		pDTO.setPOST_TITLE(post_title);
		pDTO.setPOST_CONTENT(post_content);

		int res = boardService.insertPost(pDTO);

		String msg;
		String url = "/board/boardList.do";

		if (res > 0) {
			msg = "등록에 성공했습니다.";
		} else {
			msg = "등록에 실패했습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/redirect";
	}

	@RequestMapping(value = "board/boardDetail")
	public String boardDetail(HttpServletRequest request, ModelMap model) {

		log.info("boardDetail start!!");

		String post_no = request.getParameter("no");

		BoardDTO pDTO = new BoardDTO();
		pDTO.setPOST_NO(post_no);

		BoardDTO rDTO = boardService.getBoardDetail(pDTO);

		if (rDTO == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다.");
			model.addAttribute("url", "/board/boardList.do");

			return "/redirect";
		}

		model.addAttribute("rDTO", rDTO);

		return "/board/boardDetail";
	}

	@RequestMapping(value = "board/editPost")
	public String editPost(HttpServletRequest request, ModelMap model) {

		log.info("editPost start!!");

		String post_no = request.getParameter("no");
		log.info(post_no);

		BoardDTO rDTO = new BoardDTO();
		rDTO.setPOST_NO(post_no);

		model.addAttribute("rDTO", rDTO);

		log.info("editPost end!!");

		return "/board/editPost";
	}

	@RequestMapping(value = "board/doEditPost")
	public String doEditPost(HttpServletRequest request, ModelMap model) {

		// 요청으로부터 받은 파라미터를 변수에 저장
		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");
		String post_no = request.getParameter("post_no");
		log.info("post_title : " + post_title);
		log.info("post_content : " + post_content);
		log.info("post_no : " + post_no);

		// 게시글 제목, 게시글 내용, 게시글 번호를 담아 서비스에 전송할 DTO 객체 생성
		BoardDTO pDTO = new BoardDTO();

		pDTO.setPOST_TITLE(post_title);
		pDTO.setPOST_CONTENT(post_content);
		pDTO.setPOST_NO(post_no);

		int res = boardService.updatePost(pDTO);

		String msg;
		String url = "/board/boardList.do";

		if (res > 0) {
			msg = "수정 완료";
		} else {
			msg = "수정 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/redirect";
	}
	
	@RequestMapping(value = "board/deletePost")
	public String deletePost(HttpServletRequest request, ModelMap model) {

		log.info("deletePost start!!");

		String post_no = request.getParameter("no");
		log.info(post_no);

		BoardDTO rDTO = new BoardDTO();
		rDTO.setPOST_NO(post_no);
		
		int res = boardService.deletePost(rDTO);

		String url = "/board/boardList.do";
		
		String msg = "";
		
		if (res > 0) {
			msg = "삭제 완료";
		} else {
			msg = "삭제 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		log.info("deletePost end!!");
		
		return "/redirect";
	}

}
