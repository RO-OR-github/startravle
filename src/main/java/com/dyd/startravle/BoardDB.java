package com.dyd.startravle;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class BoardDB {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource datasource) {
        this.jdbcTemplate = new JdbcTemplate(datasource);
    }

    public void create(Board bd) {
        String sql = "INSERT INTO board (NAME,TITLE,CONTENT,PASSWORD) VALUES (?, ?, ?, ?)";

        jdbcTemplate.update(sql, bd.getName(), bd.getTitle(), bd.getContent(), bd.getPassword());
    }

    public Board select(int seq){
        String sql =  "select * from board where seq=?";

        Board bd = jdbcTemplate.queryForObject(sql, new BoardMapper(), seq);
        System.out.println("select 값 : " +  bd);

        return bd;
    }

    public List<Board> select() {
        String sql =  "select * from board";

        List<Board> bd = jdbcTemplate.query(sql, new BoardMapper());
        System.out.println("select 값 : " +  bd);

        return bd;
    }

    public void update(Board bd) {
        String sql = "update board set name=?, title=?, content=?, password=?, where seq=?";
        jdbcTemplate.update(sql, bd.getName(), bd.getTitle(), bd.getContent(), bd.getPassword());

    }

    public int delete(int seq) {
        String sql = "delete from board where seq=?";
        return jdbcTemplate.update(sql, seq);
    }
}
