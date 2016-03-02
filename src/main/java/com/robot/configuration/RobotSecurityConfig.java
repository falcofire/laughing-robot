package com.robot.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.*;

@Configuration
@EnableWebSecurity
public class RobotSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	RobotLoginSuccessHandler robotLoginSuccessHandler;
	RobotLogoutSuccessHandler robotLogoutSuccessHandler;
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
		http
		.csrf().disable()
        .authorizeRequests()
            .antMatchers("/images/**").permitAll() 
            .anyRequest().authenticated()
            .antMatchers("/", "/home").access("hasRole('USER')")
            .antMatchers("/admin/**").access("hasRole('ADMIN')")
            .and().formLogin().loginPage("/login").successHandler(robotLoginSuccessHandler)
            .usernameParameter("username").passwordParameter("password")
            .and().exceptionHandling().accessDeniedPage("/Access_Denied")
            .and()
        .formLogin()
            .loginPage("/login")
            .usernameParameter("username")
            .passwordParameter("password")
            .permitAll()
            .and()
        .logout()
        	.and().logout().logoutUrl("/login?logout").addLogoutHandler(robotLogoutSuccessHandler)
            .permitAll();
    }
	
	@Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
            .inMemoryAuthentication()
                .withUser("user").password("password").roles("USER")
                .and()
                .withUser("admin").password("password").roles("ADMIN","USER");
    }
}