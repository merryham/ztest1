package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.zerock.domain.BoardVO;

public interface BoardMapper {

	public void insert(BoardVO vo);
	
	public List<BoardVO> select();
	
	public BoardVO readlist(Integer bno);
	
	public int update(BoardVO vo);
	
	@Delete("delete from tbl_board2 where bno =#{bno}")
	public int delete(Integer bno);
}
