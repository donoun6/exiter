package com.escape.exiter.board.dao;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.escape.exiter.board.domain.BoardCommentDomain;
import com.escape.exiter.board.domain.BoardDomain;
import com.escape.exiter.config.DataSourceConfig;

public class BoardDaoTest {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataSourceConfig.class);
		BoardDao dao = context.getBean("boardDao", BoardDao.class);
		BoardDomain board = new BoardDomain();
		BoardCommentDomain boardComment = new BoardCommentDomain();
		
////	add board test	
//		board.setUid(1);
//		board.setBTtitle("타이틀");
//		board.setBDef("내용");
//		board.setBCategory("자유게시판");
//		dao.addBoard(board);
		
//	boardInfo test
//		dao.boardInfoByUid();
		
//	boardComment test
//		boardComment.setUid(1);
//		boardComment.setBid(1);
//		boardComment.setBcDef("테스트");
//		dao.addBoardComment(boardComment);
//		dao.boardComentByBid(1);
		
//		System.out.println(dao.getCommentCountByBid(1));
//		System.out.println((dao.getBoardCountByCategory("공지사항")/10)+1);
		
		context.close();
	}
}
