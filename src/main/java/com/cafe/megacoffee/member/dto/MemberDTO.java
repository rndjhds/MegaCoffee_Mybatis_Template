package com.cafe.megacoffee.member.dto;

import com.cafe.megacoffee.member.type.MemberType;
import com.cafe.megacoffee.member.type.PermitStatus;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class MemberDTO {

    private int rnum;
    private String memberId; // 회원 아이디

    private String password; // 비밀번호

    private String username; // 회원이름

    private String email; // 이메일

    private MemberType memberType; // 회원 타입(BUYER, OWNER, ADMIN)

    private PermitStatus permitStatus; // 가맹점주 승인 상태(DENIED, WAIT, ACCESS)

    private int memberPoint; //  회원 포인트

    private String deleteYN; // 삭제 여부

    private Pagination pagination;

    public void changeMemberStatus(MemberType memberType, PermitStatus permitStatus) {
        this.memberType = memberType;
        this.permitStatus = permitStatus;
    }

    public void changeMemberInfo(String password, String username, String email) {
        this.password = password;
        this.username = username;
        this.email = email;
    }

    public void chargePoint(int totalPrice) {
        this.memberPoint = totalPrice / 100 * 3;
    }
}
