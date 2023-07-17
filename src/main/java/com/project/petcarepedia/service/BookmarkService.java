package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.BookmarkDto;
import com.project.petcarepedia.repository.BookmarkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookmarkService {
    @Autowired
    BookmarkMapper bookmarkMapper;

    public int deleteBookmark(BookmarkDto bookmarkDto) {
        return bookmarkMapper.deleteBookmark(bookmarkDto);
    }

    public int delete(String bmid) {
        return bookmarkMapper.delete(bmid);
    }

    public BookmarkDto select(String mid) {
        return bookmarkMapper.select(mid);
    }

    public int checkBookmark(BookmarkDto bookmarkDto) {
        return bookmarkMapper.checkBookmark(bookmarkDto);
    }

    public int insert(BookmarkDto bookmarkDto) {
        return bookmarkMapper.insert(bookmarkDto);
    }
}
