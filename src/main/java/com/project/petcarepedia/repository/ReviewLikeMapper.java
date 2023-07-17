package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.ReviewLikeDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewLikeMapper {

    int likesDownID(ReviewLikeDto reviewLikeDto);

    int likesDown(ReviewLikeDto reviewLikeDto);

    int likesUpID(ReviewLikeDto reviewLikeDto);

    int likesUp(ReviewLikeDto reviewLikeDto);

    int idCheck(ReviewLikeDto reviewLikeDto);
}
