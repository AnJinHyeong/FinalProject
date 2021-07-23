package com.kh.finalproject.restcontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.GiftDto;
import com.kh.finalproject.entity.ItemDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.GiftDao;
import com.kh.finalproject.repository.ItemDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.SponsorDao;
import com.kh.finalproject.vo.ProjectInformationVo;
import com.kh.finalproject.vo.SponsorVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/project/data")
@RestController
@Slf4j
public class ProjectDataController {

	@Autowired
	private CategoryDao categoryDao;

	@PostMapping("/categoryApproveCheck")
	public String approveCheck(@RequestParam int categoryNo) {
		String result = categoryDao.approveCheck(categoryNo);
		return result;
	}

	@Autowired
	private ItemDao itemDao;

	@GetMapping("/selectedItemList")
	public List<ItemDto> selectedItemList(@RequestParam(value = "selectedItems[]") List<String> selectedItems) {
		List<ItemDto> selectedItemList = new ArrayList<>();
		for (int i = 0; i < selectedItems.size(); i++) {
			ItemDto itemDto = itemDao.get(Integer.parseInt(selectedItems.get(i)));
			selectedItemList.add(itemDto);
		}
		return selectedItemList;
	}
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private GiftDao giftDao;
	
	@PostMapping("/{projectNo}/getProject")
	public ProjectDto getProject(HttpSession session, @PathVariable int projectNo) {
		int memberNo = (int)session.getAttribute("memberNo");
		ProjectDto projectDto = ProjectDto.builder()
				.memberNo(memberNo)
				.projectNo(projectNo)
				.build();
		
		ProjectDto find = projectDao.get(projectDto);
		return find;
	}
	
	@PostMapping("/{projectNo}/getItem")
	public List<ItemDto> getItem(@PathVariable int projectNo){
		List<ItemDto> getItemList = itemDao.list(projectNo);
		return getItemList;
	}
	
	@PostMapping("/{projectNo}/getGift")
	public List<GiftDto> getGift(@PathVariable int projectNo){
		List<GiftDto> getGiftList = giftDao.listByProjectNo(projectNo);
		return getGiftList;
	}
	
	@PostMapping("/progress")
	public int progress(@RequestParam int projectNo){
		return projectDao.calculateProjectProgress(projectNo);
	}
	
	@Autowired
	private SponsorDao sponsorDao;
	
	@PostMapping("/projectInformation")
	public ProjectInformationVo projectInformation(HttpSession session, @RequestParam int projectNo) {
		ProjectDto projectDto = projectDao.getByProjectNo(projectNo);
		int currentMemberNo = (int)session.getAttribute("memberNo");
		int sumSponsorAmountByOne = sponsorDao.sponsorAmountByProjectNoAndMemberNo(SponsorVo.builder()
											.memberNo(currentMemberNo)
											.projectNo(projectNo)
											.build());
		int sumCurrentAmountByAll = sponsorDao.currentAmount(projectNo);
		
		return ProjectInformationVo.builder()
				.projectNo(projectNo)
				.projectTitle(projectDto.getProjectTitle())
				.projectTargetAmount(projectDto.getProjectTargetAmount())
				.projectPercent(projectDto.getProjectPercent())
				.projectState(projectDto.getProjectState())
				.projectStartDateString(String.valueOf(projectDto.getProjectStartDate()))
				.projectEndDateString(String.valueOf(projectDto.getProjectEndDate()))
				.memberNo(projectDto.getMemberNo())
				.categoryNo(projectDto.getCategoryNo())
				.memberInfoNick(projectDto.getMemberInfoNick())
				.sumSponsorAmountByOne(sumSponsorAmountByOne)
				.sumCurrentAmountByAll(sumCurrentAmountByAll)
				.build();
	}

}
