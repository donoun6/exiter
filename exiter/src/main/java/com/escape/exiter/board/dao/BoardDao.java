package com.escape.exiter.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.board.domain.BoardCommand;
import com.escape.exiter.board.domain.BoardCommentCommand;
import com.escape.exiter.board.domain.BoardCommentDomain;
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
	public List<BoardCommand> boardInfoByCategory(String category) {
		String sql ="SELECT * FROM Board b INNER JOIN User u ON b.uid = u.uid WHERE b.bCategory = ? ORDER BY b.bid DESC";
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
			
		},category);
	}
	
//	카테고리별 게시물 개수
	public long getBoardCountByCategory(String category) {
		String sql = "SELECT count(*) as cnt FROM Board WHERE bCategory = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cnt");
			}
		},category);
	}
	
//	게시글 정보 bid로 가져오기
	public List<BoardCommand> boardInfoByBid(long bid) {
		String sql ="SELECT * FROM Board b INNER JOIN User u ON b.uid = u.uid WHERE b.bid = ?";
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
			
		},bid);
	}
	
//	댓글 등록
	public void addBoardComment(BoardCommentDomain board) {
		String sql = "INSERT INTO BoardComment (uid,bid,bcDef) "
				+ "VALUES(?,?,?)";
		jdbcTemplate.update(sql,board.getUid(),board.getBid(),board.getBcDef());
//		System.out.println("[댓글 등록]\n" + board.toString() + "\n");
	}
	
//	댓글 정보 bid로 가져오기
	public List<BoardCommentCommand> boardComentByBid(long bid) {
		String sql ="SELECT * FROM BoardComment bc INNER JOIN Board b INNER JOIN User u ON bc.bid = b.bid AND bc.uid = u.uid WHERE bc.bid = ?";
		return jdbcTemplate.query(sql, new RowMapper<BoardCommentCommand>() {

			@Override
			public BoardCommentCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardCommentCommand board = new BoardCommentCommand();
				board.setBcid(rs.getLong("bcid"));
				board.setBcDef(rs.getString("bcDef"));
				board.setRegDate(rs.getDate("regDate"));
				board.setBid(rs.getLong("bid"));
				board.setBTitle(rs.getString("bTitle"));
				board.setBDef(rs.getString("bDef"));
				board.setBCategory(rs.getString("bCategory"));
				board.setUid(rs.getLong("uid"));
				board.setUserId(rs.getString("userId"));
				board.setUPasswd(rs.getString("uPasswd"));
				board.setUName(rs.getString("uName"));
				board.setUPhone(rs.getString("uPhone"));
				board.setUGrade(rs.getString("uGrade"));
				board.setUType(rs.getString("uType").charAt(0));
				board.setUCheck(rs.getBoolean("uCheck"));
//				System.out.println("[댓글 정보]\n" + board.toString() + "\n");
				return board;
			}
		},bid);
	}
	
//	댓글 갯수 가져오기
	public long getCommentCountByBid(long bid) {
		String sql = "SELECT count(*) as cnt FROM BoardComment bc INNER JOIN Board b ON bc.bid = b.bid WHERE b.bid = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cnt");
			}
		},bid);
	}
	
	public List<Long> getCidByUid(long uid) {
		String sql =  "SELECT DISTINCT cid FROM Reservation WHERE uid = ?";
		return jdbcTemplate.query(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cid");
			}
			
		},uid);
	}
}
