package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.ReviewReportDto;
import com.project.petcarepedia.repository.ReviewReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewReportService {
    @Autowired
    private ReviewReportMapper reviewReportMapper;

    public int reviewReport(ReviewReportDto reviewReportDto) {
        return reviewReportMapper.reviewReport(reviewReportDto);
    }

    public int reviewReportCheck(ReviewReportDto reviewReportDto) {
        return reviewReportMapper.reviewReportCheck(reviewReportDto);
    }
}
