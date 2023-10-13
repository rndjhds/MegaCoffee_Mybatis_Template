package com.cafe.megacoffee.member.controller;

import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.member.service.MemberService;
import com.cafe.megacoffee.member.type.MemberType;
import com.cafe.megacoffee.member.type.PermitStatus;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/loginForm")
    public String buyerLoginView() {
        return "member/login";
    }

    @GetMapping("/save")
    public String saveView() {
        return "member/register";
    }

    @PostMapping("/save")
    @ResponseBody
    public int save(@RequestBody MemberDTO memberDTO) {
        String password = memberDTO.getPassword();
        String encodePassword = bCryptPasswordEncoder.encode(password);
        memberDTO.setPassword(encodePassword);
        memberDTO.setProvider(null);
        return memberService.createMember(memberDTO);
    }

    @PostMapping("/checkId")
    @ResponseBody
    public boolean checkId(@RequestParam("memberId") String id) {
        return memberService.hasMemberById(id);
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/manager")
    public String managerView() {
        return "/member/managerLogin";
    }

    @PostMapping("/managerLogin")
    @ResponseBody
    public boolean managerLogin(@RequestBody MemberDTO memberDTO, HttpSession session) {

        boolean result = false;
        try {
            MemberDTO findMember = memberService.findMemberByIdWithPassword(memberDTO);

            if (findMember.getMemberType() == MemberType.MANAGER && findMember.getPermitStatus() == PermitStatus.ACCESS) {
                session.setAttribute("member", findMember);
                result = true;
            }

        }catch (NullPointerException e) {
            result = false;
        } catch (Exception e) {
            result = false;
        }

        return result;
    }

    @PostMapping("/adminLogin")
    @ResponseBody
    public boolean adminLogin(@RequestBody MemberDTO memberDTO, HttpSession session) {

        boolean result = false;
        try {
            MemberDTO findMember = memberService.findMemberByIdWithPassword(memberDTO);

            if (findMember.getMemberType() == MemberType.ADMIN && findMember.getPermitStatus() == PermitStatus.ACCESS) {
                session.setAttribute("member", findMember);
                result = true;
            }
        } catch (NullPointerException e) {
            result = false;
        } catch (Exception e) {
            result = false;
        }

        return result;
    }

    @GetMapping("/admin")
    public String adminLoginView() {
        return "/member/adminLogin";
    }

    @GetMapping("/memberList")
    public String memberList() {
        return "/member/memberList";
    }

    @PostMapping("/findAllMember")
    @ResponseBody
    public Map<String, Object> findAllMember(MemberDTO memberDTO, Pagination pagination) {
        memberDTO.setPagination(pagination);
        List<MemberDTO> members = memberService.findAllMember(memberDTO);
        int resultTotalCount = memberService.findAllMemberCount(memberDTO);

        Map<String, Object> map = new HashMap<>();
        map.put("data", members);
        map.put("recordsFiltered", resultTotalCount);
        map.put("recordsTotal", resultTotalCount);

        return map;
    }

    @GetMapping("/accessManager")
    public String accessManager() {
        return "/member/accessManager";
    }

    @PostMapping("/findPermitStatusWaitMember")
    @ResponseBody
    public Map<String, Object> findPermitStatusWaitMember(MemberDTO memberDTO, Pagination pagination) {
        memberDTO.setPagination(pagination);
        List<MemberDTO> members = memberService.findPermitStatusWaitMember(memberDTO);
        int resultTotalCount = memberService.findPermitStatusWaitMemberCount(memberDTO);

        Map<String, Object> map = new HashMap<>();
        map.put("data", members);
        map.put("recordsFiltered", resultTotalCount);
        map.put("recordsTotal", resultTotalCount);
        return map;
    }

    @PostMapping("/updatePermitStatusFromWait")
    @ResponseBody
    public int updatePermitStatusFromWait(@RequestParam(value = "memberId", required = false) String memberId) {
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMemberId(memberId);
        memberDTO.setPermitStatus(PermitStatus.ACCESS);
        memberDTO.setMemberType(MemberType.MANAGER);

        return memberService.updatePermitStatus(memberDTO);
    }

    @GetMapping("/updateMember")
    public String updateMember(@RequestParam("member_id") String memberId, Model model) {
        MemberDTO member = memberService.findMemberById(memberId);

        List<MemberType> memberTypes = new ArrayList<>();
        memberTypes.add(MemberType.ADMIN);
        memberTypes.add(MemberType.BUYER);
        memberTypes.add(MemberType.MANAGER);

        List<PermitStatus> permitStatuses = new ArrayList<>();
        permitStatuses.add(PermitStatus.ACCESS);
        permitStatuses.add(PermitStatus.DENIED);
        permitStatuses.add(PermitStatus.WAIT);

        model.addAttribute("member", member);
        model.addAttribute("memberType", memberTypes);
        model.addAttribute("permitStatus", permitStatuses);

        return "/member/updateMember";
    }

    @PostMapping("/updateMember")
    @ResponseBody
    public int updateMember(@RequestBody MemberDTO memberDTO) {
        int result = memberService.updateMember(memberDTO);
        return result;
    }

    @GetMapping("/info")
    public String memberinfo() {
        return "/member/memberInfo";
    }

    @PostMapping("/requestAccessManager")
    @ResponseBody
    public int requestAccessManager(@RequestParam("memberId") String memberId, HttpSession session) {
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.changeMemberStatus(MemberType.BUYER,PermitStatus.WAIT);
        memberDTO.setMemberId(memberId);

        MemberDTO member = (MemberDTO) session.getAttribute("member");
        member.setPermitStatus(memberDTO.getPermitStatus());
        session.setAttribute("member", member);

        return memberService.updatePermitStatus(memberDTO);
    }

    @GetMapping("/deleteMember")
    public String deleteMember() {
        return "/member/deleteMember";
    }

    @PatchMapping("/deleteMember")
    @ResponseBody
    public boolean deleteMember(@RequestParam("memberId") String memberId, HttpSession session) {
        int result = memberService.deleteMember(memberId);
        if(result > 0) {
            session.invalidate();
            return true;
        }
        return false;
    }
}
