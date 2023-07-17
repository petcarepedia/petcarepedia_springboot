package com.project.petcarepedia.dto;

import lombok.Data;

@Data
public class SessionDto {
    private int loginResult;
    private String mid, name, grade;
}
