package com.cafe.megacoffee.member.controller;

import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.member.service.MemberService;
import com.cafe.megacoffee.member.type.MemberType;
import com.cafe.megacoffee.member.type.PermitStatus;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/login")
    public String buyerLoginView() {
        return "member/login";
    }

    @PostMapping("/login")
    @ResponseBody
    public boolean login(@RequestBody MemberDTO memberDTO, HttpSession session) {
        MemberDTO findMember = memberService.findMemberById(memberDTO);
        if (findMember != null) {
            session.setAttribute("member", findMember);
            return true;
        } else {
            return false;
        }
    }

    @GetMapping("/save")
    public String saveView() {
        return "member/register";
    }

    @PostMapping("/save")
    @ResponseBody
    public int save(@RequestBody MemberDTO memberDTO) {
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

    @PostMapping("/updatePermitStatusToWait")
    @ResponseBody
    public int updatePermitStatusToWait(@RequestParam(value = "memberId", required = false) String memberId) {
        System.out.println("memberId = " + memberId);
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMemberId(memberId);
        memberDTO.setPermitStatus(PermitStatus.ACCESS);
        memberDTO.setMemberType(MemberType.MANAGER);
        int result = memberService.updatePermitStatusToWait(memberDTO);
        return result;
    }
}
