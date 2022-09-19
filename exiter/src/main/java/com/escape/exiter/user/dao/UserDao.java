package com.escape.exiter.user.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.user.domain.User;

@Repository
public class UserDao {
	private JdbcTemplate jdbcTemplate;
	
	public UserDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	/**
	 * user 추가하기
	 * @param user
	 */
	public void addUser(User user) {
		String sql = "INSERT INTO User (userId, uPasswd, uName, uPhone) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sql, user.getUserId(), user.getUPasswd(), user.getUName(), user.getUPhone());
	}
	
	/**
	 * userId로 user 찾기
	 * @param userId
	 * @return
	 */
	public User findUserByUserId(String userId) {
		String sql = "SELECT * FROM User WHERE userId = ?";
		return jdbcTemplate.queryForObject(sql, new UserRowMapper(), userId);
	}
	
	/**
	 * userId 유효성 검사
	 * @param userId
	 * @return
	 */
	public long findUserCountByIserId(String userId) {
		String sql = "SELECT COUNT(*) as cnt FROM User WHERE userId = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cnt");
			}
			
		}, userId);
	}
	
	/**
	 * uid로 user 찾기
	 * @param uid
	 * @return
	 */
	public User findUserByUid(long uid) {
		String sql = "SELECT * FROM User WHERE uid = ?";
		return jdbcTemplate.queryForObject(sql, new UserRowMapper(), uid);
	}
	
	/**
	 * 회원 존재 유무 확인하기
	 * @param userId
	 * @param passwd
	 * @return
	 */
	public boolean isValidUser(String userId, String uPasswd) {
		String sql = "SELECT * FROM User WHERE userId = ? and uPasswd = ?";
		List<User> list = jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = null;
				if(rowNum > 0) {
					user = new User();
					user.setUserId(rs.getString("userId"));
					user.setUPasswd(rs.getString("passwd"));
				}
				return user;
			}
		}, userId, uPasswd);
		
		if(list.size() == 0) {
			return false;
		}
		return true;
	}
}
