package com.escape.exiter.board.service;

import java.util.List;

import com.escape.exiter.board.domain.BoardCommand;
import com.escape.exiter.board.domain.BoardDomain;

public interface BoardService {
	void addBoard(BoardDomain board);
	List<BoardCommand> boardInfoByUid();
}
