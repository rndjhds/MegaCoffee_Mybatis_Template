package com.cafe.megacoffee.member.service;

import com.cafe.megacoffee.member.dto.MemberDTO;

public interface MemberService {

    public int createMember(MemberDTO memberDTO);

    public boolean hasMemberById(String memberId);

    public MemberDTO findMemberById(MemberDTO memberDTO);
}
