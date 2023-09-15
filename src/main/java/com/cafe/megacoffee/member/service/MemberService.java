package com.cafe.megacoffee.member.service;

import com.cafe.megacoffee.member.dto.MemberDTO;

import java.util.List;

public interface MemberService {

    public int createMember(MemberDTO memberDTO);

    public boolean hasMemberById(String memberId);

    public MemberDTO findMemberById(MemberDTO memberDTO);

    public List<MemberDTO> findAllMember(MemberDTO memberDTO);

    public int findAllMemberCount(MemberDTO memberDTO);
}
