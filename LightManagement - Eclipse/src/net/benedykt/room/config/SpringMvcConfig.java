package net.benedykt.room.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import net.benedykt.room.dao.RoomDAO;
import net.benedykt.room.dao.RoomDAOImpl;


@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "net.benedykt.room")
public class SpringMvcConfig {
	
	@Bean
	public DataSource getDataSource() {	
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");

		dataSource.setUrl("jdbc:mysql://localhost:3306/light_management");
		dataSource.setUsername("root");
		dataSource.setPassword("Passw0rd");
		
		return dataSource;
	}
	
	
	@Bean
	public ViewResolver getViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		
		return resolver;
	}

	
	@Bean
	public RoomDAO getRoomDAO() {
		return new RoomDAOImpl(getDataSource());
	}

}
