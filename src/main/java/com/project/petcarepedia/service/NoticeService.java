package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.NoticeDto;
import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.repository.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    @Autowired
    NoticeMapper noticeMapper;

    public List<NoticeDto> list() {
        return noticeMapper.list();
    }

    public NoticeDto content(String nid) {
        return noticeMapper.content(nid);
    }

    public NoticeDto enter_content(String nid) {
        return noticeMapper.enter_content(nid);
    }

    public int insert(NoticeDto noticeDto) {
        return noticeMapper.insert(noticeDto);
    }

    public int update(NoticeDto noticeDto) {
        return noticeMapper.update(noticeDto);
    }

    public int delete(String nid) {
        return noticeMapper.delete(nid);
    }

    public void updateHits(String nid) {
        noticeMapper.updateHits(nid);
    }

    public int count() {
        return noticeMapper.count();
    }

    public List<NoticeDto> listPage(PageDto pageDto) {
        return noticeMapper.listPage(pageDto);
    }
}
