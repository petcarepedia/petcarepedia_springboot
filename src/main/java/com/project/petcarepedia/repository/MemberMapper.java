package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.MemberDto;
import com.project.petcarepedia.dto.SessionDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    SessionDto login(MemberDto memberDto);
    int join(MemberDto memberDto);
    int delete(MemberDto memberDto);
    List<MemberDto> mlist(PageDto pageDto);
    List<MemberDto> mslist(PageDto pageDto);
    MemberDto content(String mid);
    int checkId(String mid);
    int checkMail(String email);
    int update(MemberDto memberDto);
    String find(MemberDto memberDto);
    int updatePass(MemberDto memberDto);
    List<MemberDto> search(String mid);
    int checkPass(MemberDto memberDto);
}
