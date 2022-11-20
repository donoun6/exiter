package com.escape.exiter.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.board.dao.MyCommentDao;
import com.escape.exiter.board.domain.MyComment;

@Service
public class MyCommentServiceImpl implements MyCommentService {
	
	@Autowired
	MyCommentDao myComDao;
	
	@Autowired
	BoardService boardService;

	@Override
	public List<MyComment> getMyCommentsByUid(long uid) {
		List<MyComment> mcList = myComDao.findMyCommentsByUid(uid);
		
		// 각 게시글의 댓글수 조회
		for(MyComment mc : mcList) {
			int bcCnt = (int) boardService.getCommentCountByBid(mc.getBid());
			mc.setBcCnt(bcCnt);
		}
		
		return mcList;
	}

	@Override
	public void deleteCommentByBcid(long bcid) {
		myComDao.deleteCommentByBcid(bcid);
	}
	
	
}
