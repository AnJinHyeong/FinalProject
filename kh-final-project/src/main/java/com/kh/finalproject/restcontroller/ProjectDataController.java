package com.kh.finalproject.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.kh.finalproject.entity.ItemDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.ItemDao;

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

}
