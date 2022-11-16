package com.escape.exiter.board.service;

import java.util.List;

import com.escape.exiter.board.domain.BoardCommand;
import com.escape.exiter.board.domain.BoardCommentCommand;
import com.escape.exiter.board.domain.BoardCommentDomain;
import com.escape.exiter.board.domain.BoardDomain;

public interface BoardService {
	void addBoard(BoardDomain board);
	List<BoardCommand> boardInfoByCategory(String category);
	long getBoardCountByCategory(String category);
	List<BoardCommand> boardInfoByBid(long bid);
	void addBoardComment(BoardCommentDomain board);
	List<BoardCommentCommand> boardComentByBid(long bid);
	long getCommentCountByBid(long bid);
}
