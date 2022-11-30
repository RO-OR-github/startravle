package com.dyd.startravle;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BoardMapper implements RowMapper<Board> {

    @Override
    public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
        //DB의 타입인  rs를 자바의 타입인 bd로 매핑함
        Board bd = new Board();
        bd.setSeq(rs.getInt("seq"));
        bd.setName(rs.getString("name"));
        bd.setTitle(rs.getString("title"));
        bd.setContent(rs.getString("content"));
        bd.setPassword(rs.getString("password"));
        bd.setWritetime(rs.getDate("writetime"));

        return bd;
    }


}
