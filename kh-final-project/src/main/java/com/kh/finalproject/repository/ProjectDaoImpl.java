package com.kh.finalproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.service.SearchService;
import com.kh.finalproject.vo.IndexProjectVo;
import com.kh.finalproject.vo.ProjectAdminSearchKeywordVo;
import com.kh.finalproject.vo.ProjectAdminSearchVo;
import com.kh.finalproject.vo.ProjectAmountGiveVo;
import com.kh.finalproject.vo.ProjectCategoryVo;
import com.kh.finalproject.vo.ProjectImageVo;
import com.kh.finalproject.vo.ProjectProgressVo;
import com.kh.finalproject.vo.ProjectSponsorVo;
import com.kh.finalproject.vo.ProjectVo;
import com.kh.finalproject.vo.SearchVo;

@Repository
public class ProjectDaoImpl implements ProjectDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ProjectCategoryVo projectCategoryVo) {
		sqlSession.insert("project.insert", projectCategoryVo);
	}

	@Override
	public List<ProjectDto> list(int memberNo) {
		List<ProjectDto> projectDto = sqlSession.selectList("project.list", memberNo);
		return projectDto;
	}

	@Override
	public ProjectDto get(ProjectDto projectDto) {
		return sqlSession.selectOne("project.get",projectDto);
	}
	
	@Override
	public ProjectVo getProjectVoByProjectNo(int projectNo) {
		return sqlSession.selectOne("project.getProjectVoByProjectNo", projectNo);
	}
	
	public void insertBySequence(ProjectCategoryVo projectCategoryVo) {
		sqlSession.insert("project.insertBySequence", projectCategoryVo);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("project.sequence");
	}

	@Override
	public boolean projectDefaultUpdate(ProjectDto projectDto) {
		int count = sqlSession.update("project.projectDefaultUpdate",projectDto);
		return count > 0;
	}
	
	@Override
	public boolean projectFundingUpdate(ProjectDto projectDto) {
		int count = sqlSession.update("project.projectFundingUpdate",projectDto);
		return count > 0;
	}

	@Override
	public String projectEndDatePlus7(int projectNo) {
		return sqlSession.selectOne("project.projectEndDatePlus7",projectNo);
	}

	@Override
	public String projectEndDatePlus14(int projectNo) {
		return sqlSession.selectOne("project.projectEndDatePlus14",projectNo);
	}

	@Override
	public ProjectDto workingProject(int memberNo) {
		return sqlSession.selectOne("project.workingProject",memberNo);
	}

	@Override
	public boolean projectMemberUpdate(ProjectDto projectDto) {
		int count = sqlSession.update("project.projectMemberUpdate",projectDto);
		return count > 0;
	}
	
	@Override
	public boolean projectStoryUpdate(ProjectDto projectDto) {
		return sqlSession.update("project.projectStoryUpdate",projectDto) > 0;
	}

	@Override
	public boolean projectApprovalUpdate2(int projectNo) {
		int count = sqlSession.update("project.projectApprovalUpdate2",projectNo);
		return count > 0;
	}
	
	@Override
	public boolean projectApprovalUpdate1(int projectNo) {
		int count = sqlSession.update("project.projectApprovalUpdate1",projectNo);
		return count > 0;
	}
	
	@Override
	public int calculateProjectProgress(int projectNo) {
		ProjectProgressVo target = sqlSession.selectOne("project.getProjectProgress", projectNo);
		boolean default1 = target.getCategoryNo() != null;
		boolean default2 = target.getProjectTitle() != null && target.getProjectTitle() != "";
		boolean default3 = target.getProjectSummary() != null && target.getProjectSummary() != "";
		boolean default4 = false;
		if(target.getIFCount() != null) {
			default4 = target.getIFCount() > 0;
		}

		boolean funding1 = target.getProjectTargetAmount() != null && target.getProjectTargetAmount() != 0;
		boolean funding2 = target.getProjectStartDate() != null && target.getProjectEndDate() != null;
	
		boolean gift = false;
		if(target.getGCount() != null) {
			gift = target.getGCount() > 0;
		}
		boolean item = false;
		if(target.getICount() != null) {
			item = target.getICount() > 0;
		}
		
		boolean story = target.getProjectContent() != null && !target.getProjectContent().equals("");
		
		boolean member1 = target.getMemberInfoNick() != null && target.getMemberInfoNick() != "";
		boolean member2 = target.getMemberInfoContent() != null && target.getMemberInfoContent() != "";

		int result = 0;
		if(default1) result += 5;
		if(default2) result += 5;
		if(default3) result += 5;
		if(default4) result += 5;
		
		if(funding1) result += 10;
		if(funding2) result += 10;
		
		if(gift) result += 10;
		if(item) result += 10;
		
		if(story) result += 20;
		
		result += 6;
		if(member1) result += 7;
		if(member2) result += 7;
		
		return result;
	}

	@Override
	public ProjectDto getByProjectNo(int projectNo) {
		return sqlSession.selectOne("project.getByProjectNo",projectNo);
	}

	@Override
	public boolean projectDelete(ProjectDto projectDto) {
		int count = sqlSession.delete("project.projectDelete",projectDto);
		return count > 0;
	}

	@Override
	public List<IndexProjectVo> indexProjectMain() {
		return sqlSession.selectList("project.indexProjectMain");
	}
	
	@Override
	public void setPercent(ProjectDto projectDto) {
		sqlSession.update("project.setPercent", projectDto);
	}

	@Override
	public List<IndexProjectVo> indexProjectMain2() {
		return sqlSession.selectList("project.indexProjectMain2");
	}	
	
	@Override
	public List<IndexProjectVo> indexProjectMain3() {
		return sqlSession.selectList("project.indexProjectMain3");
	}
	
	@Autowired
	private SearchService searchService;
	
	@Override
	public List<IndexProjectVo> projectSearch(SearchVo searchVo) {
		
		searchService.getString(searchVo);
		
		return sqlSession.selectList("project.projectSearch", searchVo);
	}

	@Override
	public int projectSearchCount(SearchVo searchVo) {
		
		searchService.getString(searchVo);
		
		if(sqlSession.selectOne("project.projectSearchCount", searchVo) == null) {
			return 0;
		}
		return sqlSession.selectOne("project.projectSearchCount", searchVo);
	}

	@Override
	public List<IndexProjectVo> projectCategorySearch(SearchVo searchVo) {
		
		searchService.getString(searchVo);
		
		return sqlSession.selectList("project.projectCategorySearch", searchVo);
	}

	@Override
	public int projectCategorySearchCount(SearchVo searchVo) {
		
		searchService.getString(searchVo);
		
		if(sqlSession.selectOne("project.projectCategorySearchCount", searchVo) == null) {
			return 0;
		}
		return sqlSession.selectOne("project.projectCategorySearchCount", searchVo);
	}

	@Override
	public List<IndexProjectVo> projectSearchAll(SearchVo searchVo) {
		
		searchService.getString(searchVo);
		
		return sqlSession.selectList("project.projectSearchAll", searchVo);
	}

	@Override
	public List<IndexProjectVo> projectCategorySearchAll(SearchVo searchVo) {
		
		searchService.getString(searchVo);
		
		return sqlSession.selectList("project.projectCategorySearchAll", searchVo);
	}

	@Override
	public List<IndexProjectVo> projectList(SearchVo searchVo) {
		
		searchService.getString(searchVo);
		
		return sqlSession.selectList("project.projectList", searchVo);
	}

	@Override
	public boolean projectLikeUp(int projectNo) {
		int count = sqlSession.update("project.projectLikeUp", projectNo);
		return count > 0;
	}

	@Override
	public boolean projectLikeDown(int projectNo) {
		int count = sqlSession.update("project.projectLikeDown", projectNo);
		return count > 0;
	}
	
	@Override
	public List<SponsorDto> projectSponsorByProjectNo(int projectNo) {
		return sqlSession.selectList("project.projectSponsorByProjectNo", projectNo);
	}
	

	@Override
	public ProjectSponsorVo getSponsorSelect(int sponsorNo) {
		return sqlSession.selectOne("project.getSponsorSelect", sponsorNo);
  }
	
	@Override
	public List<ProjectDto> proList(int memberNo) {
		List<ProjectDto> projectDto = sqlSession.selectList("project.proList", memberNo);
		return projectDto;
	}

	@Override
	public List<ProjectDto> proList2(int memberNo) {
		List<ProjectDto> projectDto = sqlSession.selectList("project.proList2", memberNo);
		return projectDto;
	}
	
	@Override
	public List<ProjectImageVo> proListWithImageNo(int memberNo) {
		return sqlSession.selectList("project.proListWithImageNo", memberNo);
	}

	@Override
	public List<ProjectImageVo> proList2WithImageNo(int memberNo) {
		return sqlSession.selectList("project.proList2WithImageNo", memberNo);
	}
	
	@Override
	public List<ProjectAmountGiveVo> getProjectAmountGiveVoList() {
		return sqlSession.selectList("project.getProjectAmountGiveVoList");
	}

	@Override
	public void setProjectAmountGiveY(int projectNo) {
		sqlSession.update("project.setProjectAmountGiveY", projectNo);
	}

	@Override
	public List<ProjectCategoryVo> getProjectByCategoryNo(int categoryNo) {
		return sqlSession.selectList("project.getProjectByCategoryNo", categoryNo);
	}
  
	@Override
	public List<ProjectAdminSearchVo> projectAdminSelect1() {
		return sqlSession.selectList("project.projectAdminSelect1");
	}
	@Override
	public List<ProjectAdminSearchVo> projectAdminSelect2(ProjectAdminSearchKeywordVo projectAdminSearchKeywordVo) {
		return sqlSession.selectList("project.projectAdminSelect2", projectAdminSearchKeywordVo);
	}
	@Override
	public List<ProjectAdminSearchVo> projectAdminSelect3(ProjectAdminSearchKeywordVo projectAdminSearchKeywordVo) {
		return sqlSession.selectList("project.projectAdminSelect3", projectAdminSearchKeywordVo);
	}
	@Override
	public List<ProjectAdminSearchVo> projectAdminSelect4(ProjectAdminSearchKeywordVo projectAdminSearchKeywordVo) {
		return sqlSession.selectList("project.projectAdminSelect4", projectAdminSearchKeywordVo);
	}

	@Override
	public ProjectAdminSearchVo projectAdminSelectOne(int projectNo) {
		return sqlSession.selectOne("project.projectAdminSelectOne", projectNo);
	}

	@Override
	public boolean adminProjectState1(int projectNo) {
		int count = sqlSession.update("project.adminProjectState1", projectNo);
		return count > 0;
	}

	@Override
	public boolean adminProjectState3(int projectNo) {
		int count = sqlSession.update("project.adminProjectState3", projectNo);
		return count > 0;
	}

	@Override
	public boolean adminProjectStateX(int projectNo) {
		int count = sqlSession.update("project.adminProjectStateX", projectNo);
		return count > 0;
	}

	@Override
	public void updateProjectCategory(ProjectDto projectDto) {
		sqlSession.update("project.updateProjectCategory", projectDto);
	}

	@Override
	public void updateProjectStopCauses(int projectNo, String stopCauses) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectNo", projectNo);
		map.put("stopCauses", stopCauses);
		sqlSession.update("project.updateProjectStopCauses", map);
	}


}
