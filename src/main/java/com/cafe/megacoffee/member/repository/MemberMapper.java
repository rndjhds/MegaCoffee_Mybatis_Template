package com.cafe.megacoffee.member.repository;

import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.member.type.MemberType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Mapper
public interface MemberMapper {
    public int createMember(MemberDTO memberDTO) throws SQLIntegrityConstraintViolationException;

    public int hasMemberById(String memberId);

    public MemberDTO findMemberByIdWithPassword(MemberDTO memberDTO) throws IllegalArgumentException;

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
