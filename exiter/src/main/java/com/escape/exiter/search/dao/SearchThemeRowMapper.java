package com.escape.exiter.search.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.escape.exiter.search.domain.SearchThemeCom;

public class SearchThemeRowMapper implements RowMapper<SearchThemeCom> {

	@Override
	public SearchThemeCom mapRow(ResultSet rs, int rowNum) throws SQLException {
		SearchThemeCom stc = new SearchThemeCom();
		stc.setComName(rs.getString("comName") + " - " + rs.getString("comPocus"));
		stc.setTName(rs.getString("tName"));
		stc.setTImage(rs.getString("tImage"));
		return stc;
	}

}
