package com.cafe.megacoffee.config.oauth;

import com.cafe.megacoffee.config.auth.PrincipalDetails;
import com.cafe.megacoffee.config.oauth.provider.FaceBookUserInfo;
import com.cafe.megacoffee.config.oauth.provider.GoogleUserInfo;
import com.cafe.megacoffee.config.oauth.provider.NaverUserInfo;
import com.cafe.megacoffee.config.oauth.provider.OAuth2UserInfo;
import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.member.repository.MemberMapper;
import com.cafe.megacoffee.member.type.MemberType;
import com.cafe.megacoffee.member.type.PermitStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final MemberMapper memberMapper;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        System.out.println("getClientRegistration : " + userRequest.getClientRegistration()); // registrationId로 어떤 OAuth로 로그인했는지 확인
        System.out.println("getAccessToken : " + userRequest.getAccessToken());
        System.out.println(userRequest.getClientRegistration().getRegistrationId().equals("naver"));
        OAuth2User oAuth2User = super.loadUser(userRequest);
        // 구글로그인 버튼 클릭 -> 구글 로그인 창 -> 로그인 완료 -> code를 리턴(OAuth-Client 라이브러리) -> AccessToken요청
        // userRequest 정보 -> loadUser메서드 호출 -> 구글로부터 회원 프로필을 받아준다.
        System.out.println("getAttributes : " + oAuth2User);

        OAuth2UserInfo oAuth2UserInfo = null;
        if (userRequest.getClientRegistration().getRegistrationId().equals("google")) {
            System.out.println("구글 로그인 요청");
            oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
        } else if (userRequest.getClientRegistration().getRegistrationId().equals("facebook")) {
            System.out.println("페이스북 로그인 요청");
            oAuth2UserInfo = new FaceBookUserInfo(oAuth2User.getAttributes());
        } else if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
            System.out.println("네이버 로그인 요청");
            oAuth2UserInfo = new NaverUserInfo((Map) oAuth2User.getAttributes().get("response"));
        } else {
            System.out.println("우리는 구글과 페이스북만 지원한다.");
        }

        String provider = oAuth2UserInfo.getProvider();
        String memberId = oAuth2UserInfo.getProviderId();
        String email = oAuth2UserInfo.getEmail();
        String username = oAuth2UserInfo.getName();
        String password = bCryptPasswordEncoder.encode("SNS 로그인");

       MemberDTO member = memberMapper.findRegistraionMemberById(memberId);
        if (member == null) {
            System.out.println("SNS 로그인이 최초입니다.");
            member = MemberDTO.builder()
                    .memberId(memberId)
                    .username(username)
                    .password(password)
                    .email(email)
                    .memberType(MemberType.BUYER)
                    .permitStatus(PermitStatus.DENIED)
                    .provider(provider)
                    .build();
            try {
                memberMapper.createMember(member);
            } catch (SQLIntegrityConstraintViolationException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("SNS 로그인을 이미 한적이 있습니다. 당신은 자동회원가입이 되어 있습니다.");
        }

        // 회원가입을 강제로 진행해볼 예정
        return new PrincipalDetails(member, oAuth2User.getAttributes());
    }
}

