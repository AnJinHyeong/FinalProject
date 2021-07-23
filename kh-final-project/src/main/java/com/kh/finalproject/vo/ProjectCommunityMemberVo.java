package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ProjectCommunityMemberVo {
	
	private int projectCommunityNo;
	private String projectCommunityContent;
	private Date projectCommunityDate;
	
	private int projectNo;
	private int memberNo;
	
	private String memberNick;
	
}
