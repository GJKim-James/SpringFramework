package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;

@Mapper("BoardMapper")
public interface IBoardMapper {

	List<BoardDTO> getBoardList();

	List<BoardDTO> getnewPost();

	int insertPost(BoardDTO pDTO);

	BoardDTO getBoardDetail(BoardDTO pDTO);
	
	List<BoardDTO> geteditPost();

	int updatePost(BoardDTO pDTO);

	int deletePost(BoardDTO pDTO);

}
