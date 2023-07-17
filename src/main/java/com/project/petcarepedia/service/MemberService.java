package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.MemberDto;
import com.project.petcarepedia.dto.SessionDto;
import com.project.petcarepedia.repository.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    MemberMapper memberMapper;

    public SessionDto login(MemberDto memberDto) { return memberMapper.login(memberDto); }
    public int join(MemberDto memberDto) { return memberMapper.join(memberDto); }
    public int delete(MemberDto memberDto) { return memberMapper.delete(memberDto); }
    public List<MemberDto> list(PageDto pageDto) { return memberMapper.list(pageDto); }
    public MemberDto content(String mid) { return memberMapper.content(mid); }
    public int checkId(String mid) { return memberMapper.checkId(mid); }
    public int checkMail(String email) { return memberMapper.checkMail(email); }
    public int update(MemberDto memberDto) { return memberMapper.update(memberDto); }
    public String find(MemberDto memberDto) { return memberMapper.find(memberDto); }
    public int updatePass(MemberDto memberDto) { return memberMapper.updatePass(memberDto); }
    public List<MemberDto> search(String mid) { return memberMapper.search(mid); }
    public int checkPass(MemberDto memberDto) { return memberMapper.checkPass(memberDto); }
}
