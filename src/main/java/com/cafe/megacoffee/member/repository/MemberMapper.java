package com.cafe.megacoffee.member.repository;

import com.cafe.megacoffee.member.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLIntegrityConstraintViolationException;

@Mapper
public interface MemberMapper {
    public int createMember(MemberDTO memberDTO) throws SQLIntegrityConstraintViolationException;

    public int hasMemberById(String memberId);

    public MemberDTO findMemberById(MemberDTO memberDTO);
}
