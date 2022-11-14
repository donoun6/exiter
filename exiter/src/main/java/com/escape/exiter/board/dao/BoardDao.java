package com.escape.exiter.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.board.domain.BoardCommand;
import com.escape.exiter.board.domain.BoardDomain;

@Repository
public class BoardDao {
	private JdbcTemplate jdbcTemplate;
	
//	JDBC Data
	public BoardDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
//	게시글 등록
	public void addBoard(BoardDomain board) {
		String sql = "INSERT INTO Board (uid,bTitle,bDef,bCategory) "
				+ "VALUES (?,?,?,?)";
		jdbcTemplate.update(sql,board.getUid(),board.getBTtitle(),board.getBDef(),board.getBCategory());
//		System.out.println("[게시글 등록]\n" + board.toString() + "\n");
	}
	
//	게시글 정보
	public List<BoardCommand> boardInfoByUid() {
		String sql ="SELECT * FROM Board b INNER JOIN User u ON b.uid = u.uid ORDER BY b.bid DESC";
		return jdbcTemplate.query(sql, new RowMapper<BoardCommand>() {

			@Override
			public BoardCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardCommand board = new BoardCommand();
				board.setBid(rs.getLong("bid"));
				board.setBTitle(rs.getString("bTitle"));
				board.setBDef(rs.getString("bDef"));
				board.setBCategory(rs.getString("bCategory"));
				board.setRegDate(rs.getDate("regDate"));
				board.setUid(rs.getLong("uid"));
				board.setUserId(rs.getString("userId"));
				board.setUPasswd(rs.getString("uPasswd"));
				board.setUName(rs.getString("uName"));
				board.setUPhone(rs.getString("uPhone"));
				board.setUGrade(rs.getString("uGrade"));
				board.setUType(rs.getString("uType").charAt(0));
				board.setUCheck(rs.getBoolean("uCheck"));
//				System.out.println("[게시글 정보]\n" + board.toString() + "\n");
				return board;
			}
			
		});
	}
}
