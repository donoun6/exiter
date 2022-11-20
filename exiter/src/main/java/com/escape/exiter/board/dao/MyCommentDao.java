package com.escape.exiter.board.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.escape.exiter.board.domain.MyComment;

@Repository
public class MyCommentDao {

	private JdbcTemplate jdbcTemplate;
	
	public MyCommentDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	/**
	 * uid로 작성한 댓글 조회 (내림차순)
	 * @param uid
	 * @return
	 */
	public List<MyComment> findMyCommentsByUid(long uid) {
		String sql = "SELECT bc.*, b.bTitle, b.bCategory FROM BoardComment bc INNER JOIN Board b ON bc.bid = b.bid WHERE bc.uid = ? ORDER BY regDate desc";
		return jdbcTemplate.query(sql, new MyCommentRowMapper(), uid);
	}
	
	/**
	 * 댓글 삭제
	 * @param bcid
	 */
	public void deleteCommentByBcid(long bcid) {
		String sql = "DELETE FROM BoardComment WHERE bcid = ?";
		jdbcTemplate.update(sql, bcid);
	}
}
