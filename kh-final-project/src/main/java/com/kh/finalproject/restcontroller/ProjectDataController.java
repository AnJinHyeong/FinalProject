package com.kh.finalproject.restcontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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

@RequestMapping("/project/data")
@RestController
public class ProjectDataController {

	@Autowired
	private SqlSession sqlSession;

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
	

}
