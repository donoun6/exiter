package com.escape.exiter.config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
@ComponentScan(basePackages = "com.escape.exiter")
public class DataSourceConfig {
	
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		//mysql db
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/exit?serverTimezone=Asia/Seoul");
		ds.setUsername("exit");
		ds.setPassword("exit");
		ds.setInitialSize(2);	// 커넥션 풀 초기화시 생성할 초기 커넥션 개수(기본값 10)
		ds.setMaxActive(10);	// 풀에서 가져올 수 있는 최대 커넥션 개수(기본값 100)
		ds.setMaxIdle(10);		// 풀에 유지할 수 있는 최대 커넥션 수(기본값은 MaxActive와 동일)
		return ds;
	}
	
	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager txManager = new DataSourceTransactionManager();
		txManager.setDataSource(dataSource());
		return txManager;
	}
	
	@Bean
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource());
	}
}
