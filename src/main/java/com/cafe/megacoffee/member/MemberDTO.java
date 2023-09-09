package com.cafe.megacoffee.member;

import com.cafe.megacoffee.member.type.MemberType;
import com.cafe.megacoffee.member.type.PermitStatus;

public class MemberDTO {

    private String memberId; // 회원 아이디

    private String password; // 비밀번호

    private String username; // 회원이름

    private String email; // 이메일

    private MemberType memberType; // 회원 타입(BUYER, OWNER, ADMIN)

    private PermitStatus permitStatus; // 가맹점주 승인 상태(DENIED, WAIT, ACCESS)

    private int memberPoint; //  회원 포인트

    private String deleteYN; // 삭제 여부

    public String getMemberId() {
        return memberId;
    }

    private void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getPassword() {
        return password;
    }

    private void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    private void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    private void setEmail(String email) {
        this.email = email;
    }

    public MemberType getMemberType() {
        return memberType;
    }

    private void setMemberType(MemberType memberType) {
        this.memberType = memberType;
    }

    public PermitStatus getPermitStatus() {
        return permitStatus;
    }

    private void setPermitStatus(PermitStatus permitStatus) {
        this.permitStatus = permitStatus;
    }

    public int getMemberPoint() {
        return memberPoint;
    }

    public void setMemberPoint(int memberPoint) {
        this.memberPoint = memberPoint;
    }

    public String getDeleteYN() {
        return deleteYN;
    }

    private void setDeleteYN(String deleteYN) {
        this.deleteYN = deleteYN;
    }

    public void changeMemberStatus(MemberType memberType, PermitStatus permitStatus){
        this.memberType = memberType;
        this.permitStatus = permitStatus;
    }

    public void changeMemberInfo(String password, String username, String email) {
        this.password = password;
        this.username = username;
        this.email = email;
    }

    public void chargePoint(int totalPrice) {
        this.memberPoint = totalPrice/100*3;
    }
}
