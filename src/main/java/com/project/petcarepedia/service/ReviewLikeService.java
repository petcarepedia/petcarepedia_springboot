package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.ReviewLikeDto;
import com.project.petcarepedia.repository.ReviewLikeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewLikeService {
    @Autowired
    ReviewLikeMapper reviewLikeMapper;

    public int likesDownID(ReviewLikeDto reviewLikeDto) {
        return reviewLikeMapper.likesDownID(reviewLikeDto);
    }
    public int likesDown(ReviewLikeDto reviewLikeDto) {
        return reviewLikeMapper.likesDown(reviewLikeDto);
    }
    public int likesUpID(ReviewLikeDto reviewLikeDto) {
        return reviewLikeMapper.likesUpID(reviewLikeDto);
    }
    public int likesUp(ReviewLikeDto reviewLikeDto) {
        return reviewLikeMapper.likesUp(reviewLikeDto);
    }
    public int idCheck(ReviewLikeDto reviewLikeDto) {
        return reviewLikeMapper.idCheck(reviewLikeDto);
    }
}
