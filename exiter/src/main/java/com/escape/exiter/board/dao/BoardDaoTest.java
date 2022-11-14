package com.escape.exiter.board.dao;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.escape.exiter.board.domain.BoardDomain;
import com.escape.exiter.config.DataSourceConfig;

public class BoardDaoTest {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataSourceConfig.class);
		BoardDao dao = context.getBean("boardDao", BoardDao.class);
		BoardDomain board = new BoardDomain();
////	add board test	
//		board.setUid(1);
//		board.setBTtitle("타이틀");
//		board.setBDef("내용");
//		board.setBCategory("카테고리");
//		dao.addBoard(board);
		
//	boardInfo test
//		dao.boardInfoByUid();
		context.close();
	}
}
