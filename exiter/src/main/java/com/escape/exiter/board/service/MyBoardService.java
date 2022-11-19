package com.escape.exiter.board.service;

import java.util.List;

import com.escape.exiter.board.domain.MyBoard;

public interface MyBoardService {
	List<MyBoard> getBoardNotQnaByUid(long uid);
	List<MyBoard> getBoardQnaByUid(long uid);
	void updateBcCheck(int bcCheck, long bid);
	int getBcCheck(long bid);
}
