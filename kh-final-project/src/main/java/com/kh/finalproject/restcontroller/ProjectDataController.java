package com.kh.finalproject.restcontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.GiftDto;
import com.kh.finalproject.entity.ItemDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.GiftDao;
import com.kh.finalproject.repository.ItemDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.SponsorDao;
import com.kh.finalproject.vo.IndexProjectVo;
import com.kh.finalproject.vo.ProjectAdminSearchKeywordVo;
import com.kh.finalproject.vo.ProjectAdminSearchVo;
import com.kh.finalproject.vo.ProjectCategoryVo;
import com.kh.finalproject.vo.ProjectInformationVo;
import com.kh.finalproject.vo.ProjectSponsorVo;
import com.kh.finalproject.vo.ProjectVo;
import com.kh.finalproject.vo.SearchVo;
import com.kh.finalproject.vo.SponsorListVo;
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
		ProjectVo projectVo = projectDao.getProjectVoByProjectNo(projectNo);
		int currentMemberNo = (int)session.getAttribute("memberNo");
		int sumSponsorAmountByOne = sponsorDao.sponsorAmountByProjectNoAndMemberNo(SponsorVo.builder()
											.memberNo(currentMemberNo)
											.projectNo(projectNo)
											.build());
		int sumCurrentAmountByAll = sponsorDao.currentAmount(projectNo);
		
		return ProjectInformationVo.builder()
				.projectNo(projectNo)
				.projectTitle(projectVo.getProjectTitle())
				.projectTargetAmount(projectVo.getProjectTargetAmount())
				.projectPercent(projectVo.getProjectPercent())
				.projectState(projectVo.getProjectState())
				.projectStartDate(projectVo.getProjectStartDate())
				.projectEndDate(projectVo.getProjectEndDate())
				.memberNo(projectVo.getMemberNo())
				.categoryNo(projectVo.getCategoryNo())
				.memberInfoNick(projectVo.getMemberInfoNick())
				.sumSponsorAmountByOne(sumSponsorAmountByOne)
				.sumCurrentAmountByAll(sumCurrentAmountByAll)
				.build();
	}

	@GetMapping("/index/indexProjectMain")
	public List<IndexProjectVo> indexProjectMain(){
		return projectDao.indexProjectMain();
	}
	
	@GetMapping("/index/indexProjectMain2")
	public List<IndexProjectVo> indexProjectMain2(){
		return projectDao.indexProjectMain2();
	}
	
	@GetMapping("/index/indexProjectMain3")
	public List<IndexProjectVo> indexProjectMain3(){
		return projectDao.indexProjectMain3();
	}

	
	@PostMapping("/sponsorListByProjectNo/{index}")
	public List<SponsorListVo> sponsorListByProjectNo(HttpSession session, @RequestParam int projectNo, @PathVariable int index){
		int memberNo = (int)session.getAttribute("memberNo");
		if(index == 2) {
			return sponsorDao.sponsorCanceledListByProjectNo(SponsorDto.builder()
					.projectNo(projectNo)
					.memberNo(memberNo)
					.build());
		}
		else {
			return sponsorDao.sponsorListByProjectNo(SponsorDto.builder()
					.projectNo(projectNo)
					.memberNo(memberNo)
					.build());
		}
		
	}
	
	@PostMapping("/projectSearch")
	public List<IndexProjectVo> projectSearch(@ModelAttribute SearchVo searchVo){
		return projectDao.projectSearch(searchVo);
	}
	
	@PostMapping("/projectCategorySearch")
	public List<IndexProjectVo> projectCategorySearch(@ModelAttribute SearchVo searchVo){
		return projectDao.projectCategorySearch(searchVo);
	}
	
	@PostMapping("/projectSearchAll")
	public List<IndexProjectVo> projectSearchAll(@ModelAttribute SearchVo searchVo){
		return projectDao.projectSearchAll(searchVo);
	}
	
	@PostMapping("/projectCategorySearchAll")
	public List<IndexProjectVo> projectCategorySearchAll(@ModelAttribute SearchVo searchVo){
		return projectDao.projectCategorySearchAll(searchVo);
	}
	
	@PostMapping("/projectList")
	public List<IndexProjectVo> projectList(@ModelAttribute SearchVo searchVo){
		return projectDao.projectList(searchVo);
	}

	@PostMapping("/getSponsorSelect")
	public ProjectSponsorVo getSponsorSelect(@RequestParam int sponsorNo){
		return projectDao.getSponsorSelect(sponsorNo);
	}
	
	@PostMapping("/getProjectByCategoryNo")
	public List<ProjectCategoryVo> getProjectByCategoryNo(@RequestParam int categoryNo) {
		return projectDao.getProjectByCategoryNo(categoryNo);
	}
	
	@PostMapping("/projectAdminSearch")
	public List<ProjectAdminSearchVo> projectAdminSearch(
			@RequestParam String keyword,
			@RequestParam String projectState,
			@RequestParam String searchType) {
		ProjectAdminSearchKeywordVo searchData = ProjectAdminSearchKeywordVo.builder()
				.searchType(searchType)
				.projectState(projectState)
				.keyword(keyword)
				.build();
		
		int length1;
		int length2;
		int length3;
		if(searchType.equals("null")) {
			length1 = 0;
		}
		else{
			length1 = 1;
		}
		if(projectState.equals("null")) {
			length2 = 0;
		}
		else{
			length2 = 1;
		}
		if((keyword == null || keyword.equals(""))) {
			length3 = 0;
		}
		else{
			length3 = 1;
		}
		
		if(length1 == 1 && length2 == 1 && length3 == 1) {
			List<ProjectAdminSearchVo> projectAdminSearchVo = projectDao.projectAdminSelect2(searchData);
			return projectAdminSearchVo;
		}
		else if(length1 == 0 && length2 == 1 && length3 == 0) {
			List<ProjectAdminSearchVo> projectAdminSearchVo = projectDao.projectAdminSelect3(searchData);
			return projectAdminSearchVo;
		}
		else if(length1 == 1 && length2 == 0 && length3 == 1) {
			List<ProjectAdminSearchVo> projectAdminSearchVo = projectDao.projectAdminSelect4(searchData);
			return projectAdminSearchVo;
		}
		else {
			List<ProjectAdminSearchVo> projectAdminSearchVo = projectDao.projectAdminSelect1();
			return projectAdminSearchVo;
		}
				
	}
	
	@PostMapping("/projectAdminSelectOne")
	public ProjectAdminSearchVo projectAdminSelectOne(@RequestParam int projectNo) {
		return projectDao.projectAdminSelectOne(projectNo);
	}
	@GetMapping("/adminProjectState1")
	public void adminProjectState1(@RequestParam int projectNo) {
		projectDao.adminProjectState1(projectNo);
	}
	@GetMapping("/adminProjectState3")
	public void adminProjectState3(@RequestParam int projectNo) {
		projectDao.adminProjectState3(projectNo);
	}
	@GetMapping("/adminProjectStateX")
	public void adminProjectStateX(@RequestParam int projectNo) {
		projectDao.adminProjectStateX(projectNo);
	}
	
	@PostMapping("/updateProjectStopCauses")
	public void updateProjectStopCauses(@RequestParam String stopCauses, @RequestParam int projectNo) {
		projectDao.updateProjectStopCauses(projectNo, stopCauses);
	}
}
