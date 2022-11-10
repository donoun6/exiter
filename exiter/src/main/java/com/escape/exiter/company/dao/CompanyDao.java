package com.escape.exiter.company.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.domain.CompanyCommand;
import com.escape.exiter.company.domain.CompanyReservation;
import com.escape.exiter.company.domain.CompanyTheme;
import com.escape.exiter.company.domain.CompanyThemeCommand;

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
//		System.out.println("[사업자 회원 등록]\n" + company.toString() + "\n");
	}

//	아이디 중복 확인
	public boolean checkUser(String comId) {
		try {
			
		String sql = "SELECT comId FROM Company WHERE comId = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Boolean>() {

			@Override
			public Boolean mapRow(ResultSet rs, int rowNum) throws SQLException {
				if(rs.getString("comId").contentEquals(comId)) {
//					System.out.println("[중복된 아이디]"+ "\n");
					return true;
				}
				return null;
			}
		},comId);
	}catch (IncorrectResultSizeDataAccessException error) {
//		System.out.println("[중복되지 않은 아이디]"+ "\n");
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
//					System.out.println("[중복된 사업자등록번호]"+ "\n");
					return true;
				}
				return null;
			}
		},comNum);
	}catch (IncorrectResultSizeDataAccessException error) {
//		System.out.println("[중복되지 않은 사업자등록번호]"+ "\n");
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
//						System.out.println("[로그인 : 정보 확인]"+ "\n");
						return true;
					}
					return null;
				}
			},comId);
		} catch (NullPointerException error) {
//			System.out.println("[로그인 : 잘못된 정보]"+ "\n");
			return false;
		} catch (IncorrectResultSizeDataAccessException error) {
//			System.out.println("[로그인 : 잘못된 정보]"+ "\n");
			return false;
		}
	}
	
//	사업자 정보 id
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
//				System.out.println("[사업자 정보]\n" + company.toString() + "\n");
				return company;
			}
		},comId);
	}
	
//	사업자 정보 cid
	public Company companyInfo(long cid) {
		String sql = "SELECT * FROM Company WHERE cid = ?";
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
//				System.out.println("[사업자 정보]\n" + company.toString() + "\n");
				return company;
			}
		},cid);
	}
	
	
// ====================	Company Theme Dao
//	테마 등록
	public void addTheme(CompanyThemeCommand companyTheme) {
		String sql = "INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, "
				+ "tTime, tDef, tImage)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";	
		jdbcTemplate.update(sql, companyTheme.getCid(), companyTheme.getTName(), 
				companyTheme.getTCategory(), companyTheme.getTLevel(), companyTheme.getTNum(),
				companyTheme.getTTime(), companyTheme.getTDef(), companyTheme.getTImage());
//		System.out.println("[사업자 테마 등록]\n" + companyTheme.toString() + "\n");
	}
	
	
//	tid 가져오기
	public Long getTid(String tName) {
		String sql = "SELECT tid FROM Theme WHERE tName = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				CompanyTheme company = new CompanyTheme();
				company.setTid(rs.getLong("tid"));
//				System.out.println("[해당 테마 이름의 Tid]\n" + rs.getLong("tid") + "\n");
				return rs.getLong("tid");
			}
		},tName);
	}
	
	
//	인원별 가격
	public void addThemePrice(Long tid,int tpNum,int tPrice) {
		String sql = "INSERT INTO ThemePrice (tid ,tpNum ,tPrice)"
				+ "VALUES (?, ?, ?)";	
		jdbcTemplate.update(sql, tid, tpNum, tPrice);
//		System.out.println("[테마 tid:"+ tid +"에 인원별 가격 등록]\n" + tpNum + "인 가격 : "+ tPrice + "\n");
	}
	
//	예약시간 등록
	public void addThemeReservationTime(Long tid,String trTime) {
		String sql = "INSERT INTO ThemeReservationTime (tid, trTime)"
				+ "VALUES (?, ?)";	
		jdbcTemplate.update(sql, tid, trTime);
//		System.out.println("[테마 tid:"+ tid +"에 예약시간 등록]\n" + trTime + "\n");
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
					company.setTDef(rs.getString("tDef"));
					company.setTTime(rs.getInt("tTime"));
					company.setTImage(rs.getString("tImage"));
					company.setRegDate(rs.getDate("regDate"));
//					System.out.println("[테마 정보]\n" + company.toString() + "\n");
					return company;
				}
			},cid);
	}
	
//	테마 가격 삭제
	public void deleteThemePrice(Long tid) {
		String sql = "DELETE FROM ThemePrice WHERE tid = ?";
		jdbcTemplate.update(sql, tid);
//		System.out.println("[테마 가격 삭제]");
	}
	
//	테마 예약시간 삭제
	public void deleteThemeReservationTime(Long tid) {
		String sql = "DELETE FROM ThemeReservationTime WHERE tid = ?";
		jdbcTemplate.update(sql, tid);
//		System.out.println("[테마 예약시간 삭제]");
	}
	
//	테마 삭제
	public void deleteTheme(Long tid) {
		String sql = "DELETE FROM Theme WHERE tid = ?";
		jdbcTemplate.update(sql, tid);
//		System.out.println("[테마 삭제]");
	}
	
	
// ====================	Company Information Dao
//	사업자 회원 정보 변경
	public void updateCompanyInfo(CompanyCommand company) {
		String sql = " UPDATE Company SET comPasswd = ?,comTel = ?,comAddress1 = ?,comAddress2 = ?,comAddress3 = ?,comAddress4 = ?,comName = ?,comPocus = ? WHERE comId = ?";
		jdbcTemplate.update(sql, company.getComPasswd(), 
				(company.getComTel1() + "-" + company.getComTel2() + "-" + company.getComTel3()), 
				company.getComAddress1(), company.getComAddress2(), company.getComAddress3(), 
				company.getComAddress4(), company.getComName(), company.getComPocus(),company.getComId());
//		System.out.println("[사업자 회원 정보 변경]\n" + company.toString() + "\n");
	}
	
	// ====================	Company Reservation Dao
//		cid로 해당 사업자에 등록된 테마예약정보 들고오기
	public List<CompanyReservation> getReservationInfo(long cid) {
		String sql = "SELECT * FROM Reservation r INNER JOIN theme t ON r.tid = t.tid INNER JOIN User u ON r.uid = u.uid WHERE r.cid = ? ORDER BY rid DESC LIMIT 10";
		return jdbcTemplate.query(sql, new RowMapper<CompanyReservation>() {

			@Override
			public CompanyReservation mapRow(ResultSet rs, int rowNum) throws SQLException {
				CompanyReservation companyReservation = new CompanyReservation();
				companyReservation.setRid(rs.getLong("rid"));
				companyReservation.setUid(rs.getLong("uid"));
				companyReservation.setCid(rs.getLong("cid"));
				companyReservation.setTid(rs.getLong("tid"));
				companyReservation.setRPrice(rs.getString("rPrice"));
				companyReservation.setRDate(rs.getString("rDate"));
				companyReservation.setRTime(rs.getString("rTime"));
				companyReservation.setRNum(rs.getInt("rNum"));
				companyReservation.setRegDate(rs.getString("regDate"));
				companyReservation.setTName(rs.getString("tName"));
				companyReservation.setTCategory(rs.getString("tCategory"));
				companyReservation.setTLevel(rs.getInt("tLevel"));
				companyReservation.setTNum(rs.getInt("tNum"));
				companyReservation.setTDef(rs.getString("tDef"));
				companyReservation.setTTime(rs.getInt("tTime"));
				companyReservation.setTImage(rs.getString("tImage"));
				companyReservation.setUserId(rs.getString("userId"));
				companyReservation.setUName(rs.getString("uName"));
				companyReservation.setUPhone(rs.getString("uphone"));
				companyReservation.setUType(rs.getString("uType").charAt(0));
//				System.out.println("[예약정보]\n"+ companyReservation.toString() +"\n");
				return companyReservation;
			}
			
		},cid);
	}

//	날짜별 예약 테마 정보
	public List<CompanyReservation> getReservationThemeInfo(long cid,String date) {
		String sql = "SELECT DISTINCT r.tid, t.* FROM Reservation r INNER JOIN theme t ON r.tid = t.tid INNER JOIN User u ON r.uid = u.uid WHERE r.cid = ? and r.rDate = ?";
		return jdbcTemplate.query(sql, new RowMapper<CompanyReservation>() {

			@Override
			public CompanyReservation mapRow(ResultSet rs, int rowNum) throws SQLException {
				CompanyReservation companyReservation = new CompanyReservation();
				companyReservation.setTid(rs.getLong("tid"));
				companyReservation.setTName(rs.getString("tName"));
				companyReservation.setTCategory(rs.getString("tCategory"));
				companyReservation.setTLevel(rs.getInt("tLevel"));
				companyReservation.setTNum(rs.getInt("tNum"));
				companyReservation.setTDef(rs.getString("tDef"));
				companyReservation.setTTime(rs.getInt("tTime"));
				companyReservation.setTImage(rs.getString("tImage"));
//				System.out.println("[날짜벌 예약 테마 정보]\n"+ companyReservation.toString() +"\n");
				return companyReservation;
			}
			
		},cid,date);
	}
	
//	날짜별 예약 확인
	public List<CompanyReservation> getReservationInfoByDateAndTid(long cid,String date, long tid) {
		String sql = "SELECT * FROM Reservation r INNER JOIN theme t ON r.tid = t.tid INNER JOIN User u ON r.uid = u.uid WHERE r.cid = ? and r.rDate = ? and r.tid = ? ORDER BY r.tid ASC, case when r.rTime like '%AM%' then 1 when r.rTime like '%PM%' then 2 else 3 end, case when r.rTime like '%12%' then 1 else 2 end ,r.rTime ASC;\r\n"
				+ "";
		return jdbcTemplate.query(sql, new RowMapper<CompanyReservation>() {

			@Override
			public CompanyReservation mapRow(ResultSet rs, int rowNum) throws SQLException {
				CompanyReservation companyReservation = new CompanyReservation();
				companyReservation.setRid(rs.getLong("rid"));
				companyReservation.setUid(rs.getLong("uid"));
				companyReservation.setCid(rs.getLong("cid"));
				companyReservation.setTid(rs.getLong("tid"));
				DecimalFormat decFormat = new DecimalFormat("###,###");
				String tPrice = decFormat.format(rs.getInt("rPrice"));
				companyReservation.setRPrice(tPrice);
				companyReservation.setRDate(rs.getString("rDate"));
				companyReservation.setRTime(rs.getString("rTime"));
				companyReservation.setRNum(rs.getInt("rNum"));
				String regDate = rs.getTimestamp("regDate").toString().substring(0,16);
				companyReservation.setRegDate(regDate);
				companyReservation.setTName(rs.getString("tName"));
				companyReservation.setTCategory(rs.getString("tCategory"));
				companyReservation.setTLevel(rs.getInt("tLevel"));
				companyReservation.setTNum(rs.getInt("tNum"));
				companyReservation.setTDef(rs.getString("tDef"));
				companyReservation.setTTime(rs.getInt("tTime"));
				companyReservation.setTImage(rs.getString("tImage"));
				companyReservation.setUserId(rs.getString("userId"));
				companyReservation.setUName(rs.getString("uName"));
				companyReservation.setUPhone(rs.getString("uphone"));
				companyReservation.setUType(rs.getString("uType").charAt(0));
//				System.out.println("[해당날짜 예약정보]\n"+ companyReservation.toString() +"\n");
				return companyReservation;
			}
			
		},cid,date,tid);
	}
	
//	예약 삭제
	public void deleteReservation(String rid) {
		String sql = "DELETE FROM Reservation WHERE rid = ?";
		jdbcTemplate.update(sql, rid);
//		System.out.println("[테마 가격 삭제]");
	}
	
//	테마별 예약횟수
	public long getReservationCountByTid(long tid) {
		String sql = "SELECT count(*) as cnt FROM Reservation WHERE tid = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cnt");
			}
		},tid);
	}
	
//	해당연도 월별 예약 횟수
	public long getReservationMonthCountByCid(String rDate ,long cid) {
		String sql = "SELECT COUNT(*) as cnt FROM Reservation WHERE rDate LIKE ? and cid = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cnt");
			}
		},"%"+rDate+"%",cid);
	}
	
}
