package com.cafe.megacoffee.member.service;

import com.cafe.megacoffee.member.dto.MemberDTO;

import java.util.List;

public interface MemberService {

    public int createMember(MemberDTO memberDTO);

    public boolean hasMemberById(String memberId);

    public MemberDTO findMemberByIdWithPassword(MemberDTO memberDTO);

    public List<MemberDTO> findAllMember(MemberDTO memberDTO);

    public int findAllMemberCount(MemberDTO memberDTO);

    public List<MemberDTO> findPermitStatusWaitMember(MemberDTO memberDTO);

    public int findPermitStatusWaitMemberCount(MemberDTO memberDTO);

    public int updatePermitStatus(MemberDTO memberDTO);

    public List<MemberDTO> findMemberStatusByManager();

    public MemberDTO findMemberById(String memberId);

    public int updateMember(MemberDTO memberDTO);

    public int deleteMember(String memberId);
}
