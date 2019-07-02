package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;

	
	@Override
	public void register(ReplyVO vo) {
		
		mapper.insert(vo);
		
	}

	@Override
	public ReplyVO get(Integer key) {
		return mapper.select(key);
	}

	@Override
	public int modify(ReplyVO vo) {
		return 0;
	}

	@Override
	public int remove(Integer key) {
		return 0;
	}

	@Override
	public List<ReplyVO> getList(Criteria cri) {
		
		return null;
	}

	@Override
	public int getListCount(Criteria cri) {
		return 0;
	}

	@Override
	public List<ReplyVO> getSimpleList(Integer bno) {
		// TODO Auto-generated method stub
		return mapper.list(bno);
	}

}
