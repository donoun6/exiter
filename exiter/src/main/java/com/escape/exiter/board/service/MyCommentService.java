package com.escape.exiter.board.service;

import java.util.List;

import com.escape.exiter.board.domain.MyComment;

public interface MyCommentService {
	List<MyComment> getMyCommentsByUid(long uid);
	void deleteCommentByBcid(long bcid);
}
