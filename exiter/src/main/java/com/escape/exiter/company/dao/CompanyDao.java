package com.escape.exiter.company.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.company.domain.CompanySignUpCommand;

@Repository
public class CompanyDao {
	private JdbcTemplate jdbcTemplate;
	
//	JDBC Data
	public CompanyDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

// ====================	Company SignUp Dao
//	사업자 회원 등록
	public void addUser(CompanySignUpCommand company) {
		String sql = "INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, "
				+ "comAddress3, comAddress4, comNum, comName, comPocus)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";	
		jdbcTemplate.update(sql, company.getComId(), company.getComPasswd(), 
				(company.getComTel1() + "-" + company.getComTel2() + "-" + company.getComTel3()), 
				company.getComAddress1(), company.getComAddress2(), company.getComAddress3(), 
				company.getComAddress4(), company.getComNum(), company.getComName(), 
				company.getComPocus());
		System.out.println("[사업자 회원 등록]\n" + company.toString() + "\n");
	}

//	아이디 중복 확인
	public boolean checkUser(String comId) {
		try {
			
		String sql = "SELECT comId FROM Company WHERE comId = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Boolean>() {

			@Override
			public Boolean mapRow(ResultSet rs, int rowNum) throws SQLException {
				if(rs.getString("comId").contentEquals(comId)) {
					System.out.println("[중복된 아이디]");
					return true;
				}
				return null;
			}
		},comId);
	}catch (IncorrectResultSizeDataAccessException error) {
		System.out.println("[중복되지 않은 아이디]");
	    return false;
	}
  }

//	사업자등록번호 중복 확인
	public boolean checkComNum(String comNum) {
		try {
			
		String sql = "SELECT comNum FROM Company WHERE comNum = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Boolean>() {

			@Override
			public Boolean mapRow(ResultSet rs, int rowNum) throws SQLException {
				if(rs.getString("comNum").contentEquals(comNum)) {
					System.out.println("[중복된 사업자등록번호]");
					return true;
				}
				return null;
			}
		},comNum);
	}catch (IncorrectResultSizeDataAccessException error) {
		System.out.println("[중복되지 않은 사업자등록번호]");
	    return false;
	}
  }


// ====================	Company Login Dao
//	로그인 검사
	public boolean login(String comId,String comPasswd) {
		try {
			String sql = "SELECT comPasswd FROM Company WHERE comId = ?";
			return jdbcTemplate.queryForObject(sql, new RowMapper<Boolean>() {

				@Override
				public Boolean mapRow(ResultSet rs, int rowNum) throws SQLException {
					if(rs.getString("comPasswd").contentEquals(comPasswd)) {
						System.out.println("[로그인 : 정보 확인]");
						return true;
					}
					return null;
				}
			},comId);
		} catch (NullPointerException error) {
			System.out.println("[로그인 : 잘못된 정보]");
			return false;
		} catch (IncorrectResultSizeDataAccessException error) {
			System.out.println("[로그인 : 잘못된 정보]");
			return false;
		}
		
	}
}
