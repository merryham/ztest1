package org.zerock.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private ReplyService service;
	
	@Test
	public void testTx() {
		
		service.addTest("hong gil dong"); //성공하는 케이스
		service.addTest("동해물과 백두산이 마르고 닳도록 하느님이 보우하사 "
				+ "우리나라 만세"
				+ "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 "
				+ "우리나라 만세"
				+ "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 "
				+ "우리나라 만세");
		
	}
	
	private int[] bnoArr = {7929, 7928 ,7927,7926, 7920};
	
	@Test
	public void testInsert() {
		
		IntStream.rangeClosed(1,10).forEach( i ->{
			ReplyVO vo = new ReplyVO();
			vo.setBno(bnoArr[i%5]);
			vo.setReply("댓글");
			vo.setReplyer("replyer" +i );
			
			mapper.insert(vo);
	});
	}
	@Test
	public void testList() {
		mapper.list(2041).forEach(vo-> log.info(vo));
	}
	
	@Test
	public void testList2() {
		mapper.delete(1101);
	}
}
//