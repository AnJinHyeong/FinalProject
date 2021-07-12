package com.kh.finalproject.entity;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CategoryDto {
	private int categoryNo;
	private String categoryTheme;
	private int categorySuper;
}
