package com.escape.exiter.company.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.domain.CompanyCommand;
import com.escape.exiter.company.domain.CompanyTheme;
import com.escape.exiter.company.domain.CompanyThemeCommand;
import com.escape.exiter.user.dao.UserRowMapper;
import com.escape.exiter.user.domain.User;

@Repository
public class CompanyDao {
	private JdbcTemplate jdbcTemplate;
	
//	JDBC Data
	public CompanyDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

// ====================	Company SignUp Dao
//	사업자 회원 등록
	public void addUser(CompanyCommand company) {
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
					System.out.println("[중복된 아이디]"+ "\n");
					return true;
				}
				return null;
			}
		},comId);
	}catch (IncorrectResultSizeDataAccessException error) {
		System.out.println("[중복되지 않은 아이디]"+ "\n");
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
					System.out.println("[중복된 사업자등록번호]"+ "\n");
					return true;
				}
				return null;
			}
		},comNum);
	}catch (IncorrectResultSizeDataAccessException error) {
		System.out.println("[중복되지 않은 사업자등록번호]"+ "\n");
	    return false;
	}
  }


// ====================	Company Login Dao
//	로그인 검사
	public boolean login(String comId,String comPasswd) {
		try {
			String sql = "SELECT comPasswd,cid FROM Company WHERE comId = ?";
			return jdbcTemplate.queryForObject(sql, new RowMapper<Boolean>() {

				@Override
				public Boolean mapRow(ResultSet rs, int rowNum) throws SQLException {
					if(rs.getString("comPasswd").contentEquals(comPasswd)) {
						System.out.println("[로그인 : 정보 확인]"+ "\n");
						return true;
					}
					return null;
				}
			},comId);
		} catch (NullPointerException error) {
			System.out.println("[로그인 : 잘못된 정보]"+ "\n");
			return false;
		} catch (IncorrectResultSizeDataAccessException error) {
			System.out.println("[로그인 : 잘못된 정보]"+ "\n");
			return false;
		}
	}
	
//	사업자 정보
	public Company companyInfo(String comId) {
		String sql = "SELECT * FROM Company WHERE comId = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Company>() {

			@Override
			public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
				Company company = new Company();
				company.setCid(rs.getLong("cid"));
				company.setComId(rs.getString("comId"));
				company.setComPasswd(rs.getString("comPasswd"));
				company.setComTel(rs.getString("comTel"));
				company.setComAddress1(rs.getString("comAddress1"));
				company.setComAddress2(rs.getString("comAddress2"));
				company.setComAddress3(rs.getString("comAddress3"));
				company.setComAddress4(rs.getString("comAddress4"));
				company.setComNum(rs.getString("comNum"));
				company.setComName(rs.getString("comName"));
				company.setComPocus(rs.getString("comPocus"));
				company.setRegDate(rs.getDate("regDate"));
				System.out.println("[사업자 정보]\n" + company.toString() + "\n");
				return company;
			}
		},comId);
	}
	
	
// ====================	Company Theme Dao
//	테마 등록
	public void addTheme(CompanyThemeCommand companyTheme) {
		String sql = "INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, "
				+ "tPrice, tDef, tTime, tImage)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? )";	
		jdbcTemplate.update(sql, companyTheme.getCid(), companyTheme.getTName(), 
				companyTheme.getTCategory(), companyTheme.getTLevel(), companyTheme.getTNum(),
				companyTheme.getTPrice(), companyTheme.getTDef(), companyTheme.getTTime(), 
				companyTheme.getTImage());
		System.out.println("[사업자 테마 등록]\n" + companyTheme.toString() + "\n");
	}
	
//	테마 정보
	public List<CompanyTheme> themeInfo(long cid) {

			String sql = "SELECT * FROM Theme t INNER JOIN Company c ON t.cid = c.cid WHERE c.cid = ?";
			return jdbcTemplate.query(sql, new RowMapper<CompanyTheme>() {

				@Override
				public CompanyTheme mapRow(ResultSet rs, int rowNum) throws SQLException {
					CompanyTheme company = new CompanyTheme();
					company.setTid(rs.getLong("tid"));
					company.setCid(rs.getLong("cid"));
					company.setTName(rs.getString("tName"));
					company.setTCategory(rs.getString("tCategory"));
					company.setTLevel(rs.getInt("tLevel"));
					company.setTNum(rs.getInt("tNum"));
					company.setTPrice(rs.getInt("tPrice"));
					company.setTDef(rs.getString("tDef"));
					company.setTTime(rs.getInt("tTime"));
					company.setTImage(rs.getString("tImage"));
					company.setRegDate(rs.getDate("regDate"));
					System.out.println("[테마 정보]\n" + company.toString() + "\n");
					return company;
				}
			},cid);
	}
}
