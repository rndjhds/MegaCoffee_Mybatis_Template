package com.cafe.megacoffee.config.auth;

import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.member.repository.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
public class PrincipalDetailService implements UserDetailsService {

    private final MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // loadUserByUsername이 자동으로 UserDetails을 만들고 그 값을 Authentication으로 감싼 다음 시큐리티 session으로 감싸준다.
        MemberDTO member = memberMapper.findRegistraionMemberById(username);
        if (member != null) {
            return new PrincipalDetails(member);
        }
        return null;
    }
}
