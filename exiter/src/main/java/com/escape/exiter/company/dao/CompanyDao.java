package com.escape.exiter.company.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.escape.exiter.company.domain.CompanyUserCommand;

@Repository
public class CompanyDao {
	private JdbcTemplate jdbcTemplate;
	
//	JDBC Data
	public CompanyDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

//	사업자 회원 등록
	public void addUser(CompanyUserCommand company) {
		String sql = "INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, "
				+ "comAddress3, comAddress4, comNum, comName, comPocus)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";	
		System.out.println("사업자 회원 등록\n" + company.toString() + "\n");
		jdbcTemplate.update(sql, company.getComId(), company.getComPasswd(), 
				(company.getComTel1() + "-" + company.getComTel2() + "-" + company.getComTel3()), 
				company.getComAddress1(), company.getComAddress2(), company.getComAddress3(), 
				company.getComAddress4(), company.getComNum(), company.getComName(), 
				company.getComPocus());
	}
	
//	아이디 중복 확인
	public boolean checkUser(String comId) {
		try {
			
		String sql = "SELECT comId FROM Company WHERE comId = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Boolean>() {

			@Override
			public Boolean mapRow(ResultSet rs, int rowNum) throws SQLException {
				if(rs.getString("comId").contentEquals(comId)) {
					System.out.println("중복된 아이디");
					return true;
				}
				return null;
			}
		},comId);
	}catch (IncorrectResultSizeDataAccessException error) {
		System.out.println("중복되지 않은 아이디");
	    return false;
	}
  }
	
}
