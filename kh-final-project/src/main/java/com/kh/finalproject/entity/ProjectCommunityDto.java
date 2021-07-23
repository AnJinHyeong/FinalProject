package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ProjectCommunityDto {

	private int projectCommunityNo;
	private String projectCommunityContent;
	private Date projectCommunityDate;
	
	private int projectNo;
	private int memberNo;
	
}
