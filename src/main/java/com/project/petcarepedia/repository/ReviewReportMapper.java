package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.ReviewReportDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewReportMapper {
    int reviewReport(ReviewReportDto reviewReportDto);
    int reviewReportCheck(ReviewReportDto reviewReportDto);
}
