package com.cafe.megacoffee.member.service;

import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.member.repository.MemberMapper;
import com.cafe.megacoffee.member.type.MemberType;
import com.cafe.megacoffee.member.type.PermitStatus;
import com.cafe.megacoffee.util.mailsender.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;
    private final MailService mailService;

    @Value("${email.sender}")
    private String sender;

    @Override
    public int createMember(MemberDTO memberDTO) {
        memberDTO.changeMemberStatus(MemberType.BUYER, PermitStatus.DENIED);

        int result = 0;
        try {
            result = memberMapper.createMember(memberDTO);
            mailService.createEmail(memberDTO, sender);
        } catch (SQLIntegrityConstraintViolationException e) {
            log.debug("SQL구문 오류 발생");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean hasMemberById(String memberId) {
        int result = memberMapper.hasMemberById(memberId);
        if (result == 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public MemberDTO findMemberByIdWithPassword(MemberDTO memberDTO) {
        MemberDTO findMember = null;

        try {
            findMember = memberMapper.findMemberByIdWithPassword(memberDTO);
        } catch (IllegalArgumentException e) {
            log.debug("회원 유형 또는 승인여부가 등록되지 않은 데이터입니다.");
            e.printStackTrace();
        } catch (Exception e) {
            log.debug("찾는 회원이 없습니다.");
        }
        return findMember;
    }

    @Override
    public List<MemberDTO> findAllMember(MemberDTO memberDTO) {
        return memberMapper.findAllMember(memberDTO);
    }

    @Override
    public int findAllMemberCount(MemberDTO memberDTO) {
        return memberMapper.findAllMemberCount(memberDTO);
    }

    @Override
    public List<MemberDTO> findPermitStatusWaitMember(MemberDTO memberDTO) {
        return memberMapper.findPermitStatusWaitMember(memberDTO);
    }

    @Override
    public int findPermitStatusWaitMemberCount(MemberDTO memberDTO) {
        return memberMapper.findPermitStatusWaitMemberCount(memberDTO);
    }

    @Override
    public int updatePermitStatus(MemberDTO memberDTO) {
        return memberMapper.updatePermitStatus(memberDTO);
    }

    @Override
    public List<MemberDTO> findMemberStatusByManager() {
        return memberMapper.findMemberStatusByManager();
    }

    @Override
    public MemberDTO findMemberById(String memberId) {
        return memberMapper.findMemberById(memberId);
    }

    @Override
    public int updateMember(MemberDTO memberDTO) {
        return memberMapper.updateMember(memberDTO);
    }

    @Override
    public int deleteMember(String memberId) {
        return memberMapper.deleteMember(memberId);
    }
}
