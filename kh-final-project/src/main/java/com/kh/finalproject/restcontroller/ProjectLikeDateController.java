package com.kh.finalproject.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.ProjectLikeDto;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.ProjectLikeDao;

@RestController
@RequestMapping("/projectLike")
public class ProjectLikeDateController {

	@Autowired
	private ProjectLikeDao projectLikeDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@PostMapping("/{projectNo}/projectLikeConfirm")
	public int projectLikeConfirm(
			@PathVariable int projectNo,
			HttpSession session) {
		int memberNo = (int)session.getAttribute("memberNo");
		ProjectLikeDto projectLikeDto = ProjectLikeDto.builder()
				.likeMemberNo(memberNo)
				.likeProjectNo(projectNo)
				.build();
		
		int count = projectLikeDao.confirm(projectLikeDto);
		return count;
	}
	
	
	@GetMapping("/{projectNo}/projectLikeAdd")
	public void projectLikeAdd(
			HttpSession session,
			@PathVariable int projectNo) {
		int memberNo = (int)session.getAttribute("memberNo");
		ProjectLikeDto projectLikeDto = ProjectLikeDto.builder()
				.likeMemberNo(memberNo)
				.likeProjectNo(projectNo)
				.build();
		
		projectDao.projectLikeUp(projectNo);
		
		projectLikeDao.add(projectLikeDto);
	}
	
	@GetMapping("/{projectNo}/projectLikeDelete")
	public void projectLikeDelete(
			HttpSession session,
			@PathVariable int projectNo) {
		int memberNo = (int)session.getAttribute("memberNo");
		ProjectLikeDto projectLikeDto = ProjectLikeDto.builder()
				.likeMemberNo(memberNo)
				.likeProjectNo(projectNo)
				.build();
		
		projectDao.projectLikeDown(projectNo);
		
		projectLikeDao.delete(projectLikeDto);
	}
	
	
	
}
