package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService {

	// @Setter(onMethod_ = @Autowired) @AllArgsConstructor를 삽임하면 없어도 된다.
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> listAll() {
		// TODO Auto-generated method stub
		return mapper.select();
	}

	@Override
	public BoardVO get(Integer key) {
		// TODO Auto-generated method stub
		return mapper.readlist(key);
	}

	@Override
	public void register(BoardVO vo) {
			
		mapper.insert(vo);
	}

	@Override
	public int modify(BoardVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int remove(Integer key) {
		// TODO Auto-generated method stub
		return mapper.delete(key);
	}
	
	

}
