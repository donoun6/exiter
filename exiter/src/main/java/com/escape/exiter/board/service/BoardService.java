package com.escape.exiter.board.service;

import java.util.List;

import com.escape.exiter.board.domain.BoardCommand;
import com.escape.exiter.board.domain.BoardCommentCommand;
import com.escape.exiter.board.domain.BoardCommentDomain;
import com.escape.exiter.board.domain.BoardDomain;

public interface BoardService {
	void addBoard(BoardDomain board);
	List<BoardCommand> boardInfoByCategory(String category);
	List<BoardCommand> QnaInfoByCid(long cid);
	long getBoardCountByCategory(String category);
	List<BoardCommand> boardInfoByBid(long bid);
	void addBoardComment(BoardCommentDomain board);
	void addQnaComment(BoardCommentDomain board);
	List<BoardCommentCommand> boardComentByBid(long bid);
	List<BoardCommentCommand> qnaComentByBid(long bid);
	long getCommentCountByBid(long bid);
	List<Long> getCidByUid(long uid);
	void deleteBoard(String bid);
	void deleteBoardComment(String bcid);
}
