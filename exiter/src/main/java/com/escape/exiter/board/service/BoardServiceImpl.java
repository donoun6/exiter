package com.escape.exiter.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.board.dao.BoardDao;
import com.escape.exiter.board.domain.BoardCommand;
import com.escape.exiter.board.domain.BoardCommentCommand;
import com.escape.exiter.board.domain.BoardCommentDomain;
import com.escape.exiter.board.domain.BoardDomain;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDao boardDao;
	
	@Override
	public void addBoard(BoardDomain board) {
		boardDao.addBoard(board);
	}

	@Override
	public List<BoardCommand> boardInfo() {
		return boardDao.boardInfo();
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
	public List<BoardCommentCommand> boardComentByBid(long bid) {
		return boardDao.boardComentByBid(bid);
	}

}
