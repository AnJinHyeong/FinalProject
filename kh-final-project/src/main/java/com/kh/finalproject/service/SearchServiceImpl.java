package com.kh.finalproject.service;

import org.springframework.stereotype.Service;

import com.kh.finalproject.vo.SearchVo;

@Service
public class SearchServiceImpl implements SearchService {

	@Override
	public void getString(SearchVo searchVo) {
		if(searchVo.getProjectOrder() == 1) {
			searchVo.setProjectOrderString("project_percent");
		}
		else if(searchVo.getProjectOrder() == 2) {
			searchVo.setProjectOrderString("project_regist_date");
		}
		else if(searchVo.getProjectOrder() == 3) {
			searchVo.setProjectOrderString("project_like_count");
		}
		
		if(searchVo.getProjectState() == 1) {
			searchVo.setProjectStateString("");
		}
		else if(searchVo.getProjectState() == 2) {
			searchVo.setProjectStateString("and sysdate between project_start_date and project_end_date");
		}
		else if(searchVo.getProjectState() == 3) {
			searchVo.setProjectStateString("and sysdate < project_start_date");
		}
		else if(searchVo.getProjectState() == 4) {
			searchVo.setProjectStateString("and sysdate > project_end_date");
		}
	}

}
