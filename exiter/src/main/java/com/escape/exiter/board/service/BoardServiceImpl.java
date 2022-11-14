package com.escape.exiter.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.board.dao.BoardDao;
import com.escape.exiter.board.domain.BoardCommand;
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
	public List<BoardCommand> boardInfoByUid() {
		return boardDao.boardInfoByUid();
	}

}
