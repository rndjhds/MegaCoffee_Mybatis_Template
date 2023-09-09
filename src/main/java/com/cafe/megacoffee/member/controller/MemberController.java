package com.cafe.megacoffee.member.controller;

import com.cafe.megacoffee.member.MemberDTO;
import com.cafe.megacoffee.member.service.MemberService;
import com.cafe.megacoffee.member.type.MemberType;
import com.cafe.megacoffee.member.type.PermitStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

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
}
