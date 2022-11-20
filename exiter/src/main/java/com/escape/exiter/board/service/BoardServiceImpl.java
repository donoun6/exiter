package com.escape.exiter.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.board.dao.BoardDao;
import com.escape.exiter.board.domain.BoardCommand;
import com.escape.exiter.board.domain.BoardCommentCommand;
import com.escape.exiter.board.domain.BoardCommentDomain;
import com.escape.exiter.board.domain.BoardDomain;
import com.escape.exiter.company.domain.Company;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDao boardDao;
	
	@Override
	public void addBoard(BoardDomain board) {
		boardDao.addBoard(board);
	}

	@Override
	public List<BoardCommand> boardInfoByCategory(String category) {
		return boardDao.boardInfoByCategory(category);
	}
	
	@Override
	public List<BoardCommand> QnaInfoByCid(long cid) {
		return boardDao.QnaInfoByCid(cid);
	}
	
	@Override
	public long getBoardCountByCategory(String category) {
		return boardDao.getBoardCountByCategory(category);
	}

	@Override
	public List<BoardCommand> boardInfoByBid(long bid) {
		return boardDao.boardInfoByBid(bid);
	}

	@Override
	public void addBoardComment(BoardCommentDomain board) {
		boardDao.addBoardComment(board);
	}
	@Override
	public void addQnaComment(BoardCommentDomain board) {
		boardDao.addQnaComment(board);
	}
	
	@Override
	public List<BoardCommentCommand> boardComentByBid(long bid) {
		return boardDao.boardComentByBid(bid);
	}
	
	@Override
	public List<BoardCommentCommand> qnaComentByBid(long bid) {
		return boardDao.qnaComentByBid(bid);
	}

	
	@Override
	public long getCommentCountByBid(long bid) {
		return boardDao.getCommentCountByBid(bid);
	}

	@Override
	public List<Long> getCidByUid(long uid) {
		return boardDao.getCidByUid(uid);
	}

}
