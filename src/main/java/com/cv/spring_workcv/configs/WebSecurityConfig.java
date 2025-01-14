package com.cv.spring_workcv.configs;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {


    @Autowired
    private DataSource dataSource;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        return bCryptPasswordEncoder;
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/static/admin/**");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select username, password,enable from user where username=?")
                .authoritiesByUsernameQuery("select u.username as username, r.role_name as role from user u inner join role r on r.id = u.role_id where username =?")
                .passwordEncoder(passwordEncoder());
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable().
                authorizeRequests()
                .and().formLogin().loginPage(
                "/admin/login")
                .usernameParameter("username")
                .passwordParameter("password").failureUrl("/admin/login?msg=err").loginProcessingUrl("/admin/login")
                .defaultSuccessUrl("/admin/index", true).and()
                .logout().logoutUrl("/admin/logout").logoutSuccessUrl("/admin/login").invalidateHttpSession(true)
                .deleteCookies("JSESSIONID").and().exceptionHandling()
                .accessDeniedPage("/error").and();
        http.authorizeRequests().antMatchers("/", "/logout").permitAll();

        http.authorizeRequests().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/employee/**").access("hasRole('ROLE_EMPLOYEE')");

        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

        // Cấu hình cho Login Form.
        http.authorizeRequests().and().formLogin()

                .defaultSuccessUrl("/home")
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutSuccessful")
                .deleteCookies("JSESSIONID");
        http.authorizeRequests().and() 
                .rememberMe().tokenRepository(this.persistentTokenRepository()) //
                .tokenValiditySeconds(1 * 24 * 60 * 60); // 24h

    }
    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        InMemoryTokenRepositoryImpl memory = new InMemoryTokenRepositoryImpl();
        return memory;
    }

}