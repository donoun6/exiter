package com.escape.exiter.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.board.domain.BoardDomain;
import com.escape.exiter.board.domain.MyBoard;

@Repository
public class MyBoardDao {
	
	private JdbcTemplate jdbcTemplate;
	
	public MyBoardDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	/**
	 * uid로 QnA아닌 게시글 목록 확인 (날짜 내림차순)
	 * @param uid
	 * @return
	 */
	public List<MyBoard> findBoardNotQnaByUid(long uid) {
		String sql = "SELECT b.*, u.userId, u.uGrade FROM Board b INNER JOIN User u ON b.uid = u.uid WHERE b.uid = ? AND bCategory != 'QnA' ORDER BY regDate desc";
		return jdbcTemplate.query(sql, new MyBoardRowMapper(), uid);
	}
	
	/**
	 * uid로 QnA 게시글 목록 확인 (날짜 내림차순)
	 * @param uid
	 * @return
	 */
	public List<MyBoard> findBoardQnaByUid(long uid) {
		String sql = "SELECT b.*, u.userId, u.uGrade FROM Board b INNER JOIN User u ON b.uid = u.uid WHERE b.uid = ? AND bCategory = 'QnA' ORDER BY regDate desc";
		return jdbcTemplate.query(sql, new MyBoardRowMapper(), uid);
	}
	
	/**
	 * 유저가 확인한 댓글수 업데이트
	 * @param bcCheck
	 * @param bid
	 */
	public void updateBcCheck(int bcCheck, long bid) {
		String sql = "UPDATE Board SET bcCheck = ? WHERE bid = ?";
		jdbcTemplate.update(sql, bcCheck, bid);
	}
	
	public int findBcCheck(long bid) {
		String sql = "SELECT * FROM Board WHERE bid = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Integer>() {

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("bcCheck");
			}
			
		}, bid);
	}
}
