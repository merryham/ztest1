package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;

public interface GenericService<VO, K> {
	
	public List<VO> getList(Criteria cri);
	
	public VO get(K key);
	
	public void register(VO vo);
	
	public int modify(VO vo);
	
	public int remove(K key);
}
