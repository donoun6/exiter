package com.escape.exiter.board.controller;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CheckDeleteCommand {
	private List<Long> deleteList;
}
