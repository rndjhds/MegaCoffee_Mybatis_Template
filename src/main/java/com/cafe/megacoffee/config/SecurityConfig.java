package com.cafe.megacoffee.config;

import com.cafe.megacoffee.config.oauth.PrincipalOauth2UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final PrincipalOauth2UserService principalOauth2UserService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/basket/myBasketList", "/basket/createBasket", "/order/creatOrderItem").authenticated()
                .antMatchers("/order/orderManagement").access("hasRole('MANAGER')")
                .antMatchers("/order/orderdItemList").access("hasRole('MANAGER') or hasRole('ADMIN')")
                //.antMatchers("/order/orderdItemList").access("hasRole('ADMIN')")
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .loginPage("/member/loginForm")
                .loginProcessingUrl("/member/login")
                .usernameParameter("memberId")
                .defaultSuccessUrl("/")
                .and()
                .oauth2Login()
                .loginPage("/member/loginForm")
                .userInfoEndpoint() // 구글 로그인이 완료된 뒤의 후처리가 필요함 TIP. 코드X, (엑세스 토큰 + 사용자 프로필 정보O 가져옴)
                .userService(principalOauth2UserService);

        http.logout()
                .logoutUrl("/member/logout") // 로그아웃 URL 지정
                .invalidateHttpSession(true) // 세션 무효화 설정
                .deleteCookies("JSESSIONID"); // 필요에 따라 쿠키도 삭제할 수 있습니다.
    }
}
