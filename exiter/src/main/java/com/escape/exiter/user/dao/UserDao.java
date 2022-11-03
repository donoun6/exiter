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
	public long findUserCountByUserId(String userId) {
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
	
	public long checkUser(String userId, String uPasswd) {
		String sql = "SELECT Count(*) as cnt FROM User WHERE userId = ? and uPasswd = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cnt");
			}
			
		}, userId, uPasswd);
	}
	
	/**
	 * 유저아이디로 탈퇴유무 확인
	 * @param userId
	 * @return
	 */
	public Boolean checkDeleteUser(String userId) {
		String sql = "SELECT uCheck FROM User WHERE userId = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Boolean>() {

			@Override
			public Boolean mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getBoolean("uCheck");
			}
			
		}, userId);
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
	
	/**
	 * 이름, 전화번호로 아이디 찾기
	 * @param uName
	 * @param uPhone
	 * @return
	 */
	public String findUserIdByUNameAndUPhone(String uName, String uPhone) {
		String sql = "SELECT userId FROM User WHERE uName = ? and uPhone = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new RowMapper<String>() {

				@Override
				public String mapRow(ResultSet rs, int rowNum) throws SQLException {
					String userId = rs.getString("userId");
					return userId;
				}
				
			}, uName, uPhone);
		} catch(Exception e) {
			return "";
		}
	}
	
	/**
	 * 유저아이디, 이름, 전화번호로 회원 존재 확인
	 * @param userId
	 * @param uName
	 * @param uPhone
	 * @return
	 */
	public long checkUserForFindPw(String userId, String uName, String uPhone) {
		String sql = "SELECT Count(*) as cnt FROM User WHERE userId = ? and uName = ? and uPhone = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cnt");
			}
			
		}, userId, uName, uPhone);
	}
	
	/**
	 * 비밀번호 변경하기
	 * @param userId
	 * @param uPasswd
	 */
	public void changePasswd(String userId, String uPasswd) {
		String sql = "UPDATE User SET uPasswd = ? WHERE userId = ?";
		jdbcTemplate.update(sql, uPasswd, userId);
	}
	
	/**
	 * 유저아이디로 비밀번호 찾기
	 * @param userId
	 * @return
	 */
	public String findUPasswdByUserId(String userId) {
		String sql = "SELECT uPasswd FROM User WHERE userId = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("uPasswd");
			}
			
		}, userId);
	}
	
	/**
	 * 회원정보 변경하기
	 * @param userId
	 * @param uPasswd
	 * @param uPhone
	 */
	public void updateUserInfo(String userId, String uPasswd, String uPhone) {
		String sql = "UPDATE User SET uPasswd = ?, uPhone = ? WHERE userId = ?";
		jdbcTemplate.update(sql, uPasswd, uPhone, userId);
	}
	
	/**
	 * 회원 탈퇴 (uCheck를 true로 변경)
	 * @param userId
	 */
	public void deleteUser(String userId) {
		String sql = "UPDATE User SET uCheck = true WHERE userId = ?";
		jdbcTemplate.update(sql, userId);
	}
	
	/**
	 * 회원 등급 조정
	 * @param uid
	 * @param uGrade
	 */
	public void updateUGrade(long uid, String uGrade) {
		String sql = "UPDATE User SET uGrade = ? WHERE uid = ?";
		jdbcTemplate.update(sql, uGrade, uid);
	}
	
	/**
	 * 회원 등급 조회
	 * @param uid
	 * @return
	 */
	public String findUGradeByUid(long uid) {
		String sql = "SELECT uGrade FROM User WHERE uid = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("uGrade");
			}
			
		}, uid);
	}
}
