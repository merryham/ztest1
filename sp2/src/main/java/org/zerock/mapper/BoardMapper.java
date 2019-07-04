package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	public void insert(BoardVO vo);
	
	public BoardVO select(Integer bno);
	
	public int update(BoardVO vo);
	
	@Delete("delete from tbl_board2 where bno = #{bno}")
	public int delete(Integer bno);
	
	@Select("select *from tbl_board2 where bno > 0 order by bno desc")
	public List<BoardVO> selectAll();
	
	public List<BoardVO> selectPage(Criteria cri);
	
	public int selectPageCount(Criteria cri);
	
	public List<BoardVO> serach(@Param("map") Map<String, String> map);
	
	@Update("update tbl_board2 set replycnt = replycnt + #{amount} where bno = #{bno}")
	public int updateReplyCont(
			@Param("bno") Integer bno,
			@Param("amount") int amount);
}


// 