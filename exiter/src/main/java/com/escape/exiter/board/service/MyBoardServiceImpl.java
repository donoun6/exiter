package com.escape.exiter.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.board.dao.MyBoardDao;
import com.escape.exiter.board.domain.MyBoard;

@Service
public class MyBoardServiceImpl implements MyBoardService {

	@Autowired
	MyBoardDao myBoardDao;
	
	@Autowired
	BoardService boardService;

	@Override
	public List<MyBoard> getBoardNotQnaByUid(long uid) {
		List<MyBoard> mbList = myBoardDao.findBoardNotQnaByUid(uid);
		
		for(MyBoard mb : mbList) {
			int bcCnt = (int) boardService.getCommentCountByBid(mb.getBid());
			mb.setBcCnt(bcCnt);
		}
		
		return mbList;
	}

	@Override
	public List<MyBoard> getBoardQnaByUid(long uid) {
		List<MyBoard> mbList = myBoardDao.findBoardQnaByUid(uid);
		
		// 각 게시글의 댓글수 조회
		for(MyBoard mb : mbList) {
			int bcCnt = (int) boardService.getCommentCountByBid(mb.getBid());
			mb.setBcCnt(bcCnt);
		}
		
		return mbList;
	}

	@Override
	public void updateBcCheck(int bcCheck, long bid) {
		myBoardDao.updateBcCheck(bcCheck, bid);
	}

	@Override
	public int getBcCheck(long bid) {
		return myBoardDao.findBcCheck(bid);
	}
}
