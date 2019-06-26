package org.zerock.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@Log4j
public class BoardMapperTests {

	@Autowired
	BoardMapper mapper;


	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();

		vo.setTitle("1231231");
		vo.setContent("JTW");
		vo.setWriter("user121");

		mapper.insert(vo);
	}

	@Test
	public void testlist() {

		BoardVO vo = mapper.select(8);

		log.info(vo);
	}
	@Test
	public void testupdate() {
		BoardVO vo = mapper.select(18);
		vo.setTitle("�닔�젙�맂�젣紐�");
		vo.setContent("�닔�젙�맂�궡�슜");
		
		int count = mapper.update(vo);
		log.info("update count" + count);
		
	}
	@Test
	public void testdelete() {
		int count = mapper.delete(19);
		log.info("delete count" + count);
	}

	

}
