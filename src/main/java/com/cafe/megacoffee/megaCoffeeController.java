package com.cafe.megacoffee;

import com.cafe.megacoffee.config.auth.PrincipalDetails;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class megaCoffeeController {

    private final HttpSession session;

    @GetMapping("/")
    public String getIndePage(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        if(principalDetails != null) {
            session.setAttribute("member", principalDetails.getMemberDTO());
        }
        return "/index";
    }
}
