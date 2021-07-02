package poly.service;

import java.util.List;

import poly.dto.BoardDTO;

public interface IBoardService {

	List<BoardDTO> getBoardList();

	List<BoardDTO> getnewPost();

	int insertPost(BoardDTO pDTO);

	BoardDTO getBoardDetail(BoardDTO pDTO);

	List<BoardDTO> geteditPost();
	
	int updatePost(BoardDTO pDTO);

	int deletePost(BoardDTO pDTO);

}
