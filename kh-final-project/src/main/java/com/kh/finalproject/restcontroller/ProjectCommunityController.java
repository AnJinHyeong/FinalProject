package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.ProjectCommunityDto;
import com.kh.finalproject.repository.ProjectCommunityDao;

@RestController
@RequestMapping("/projectCommunity")
public class ProjectCommunityController {
	
	@Autowired
	private ProjectCommunityDao projectCommunityDao;
	
	@PostMapping("/{projectNo}/projectCommunityList")
	public List<ProjectCommunityDto> projectCommunityList(
			@PathVariable int projectNo){
		List<ProjectCommunityDto> list = projectCommunityDao.listByProjectNo2(projectNo);
		return list;
	}
	
	
}
