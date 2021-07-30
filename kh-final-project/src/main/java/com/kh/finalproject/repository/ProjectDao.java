package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.vo.IndexProjectVo;
import com.kh.finalproject.vo.ProjectAmountGiveVo;
import com.kh.finalproject.vo.ProjectCategoryVo;
import com.kh.finalproject.vo.ProjectSponsorVo;
import com.kh.finalproject.vo.ProjectVo;
import com.kh.finalproject.vo.SearchVo;

public interface ProjectDao {
	
	//프로젝트 추가
	void insert(ProjectCategoryVo projectCategoryVo);
	List<ProjectDto> proList(int memberNo);
	List<ProjectDto> proList2(int memberNo);
	//회원이 만든 프로젝트 전체 조회
	List<ProjectDto> list(int memberNo);
	//프로젝트 상세 조회(projectNo,memberNo를 이용한)
	ProjectDto get(ProjectDto projectDto);
	//시퀀스를 이용한 프로젝트 생성
	void insertBySequence(ProjectCategoryVo projectCategoryVo);
	//프로젝트 시퀀스 생성
	int sequence();
	//프로젝트 Default 업데이트
	boolean projectDefaultUpdate(ProjectDto projectDto);
	//프로젝트 Funding 업데이트
	boolean projectFundingUpdate(ProjectDto projectDto);
	//endDate에 7 더하기
	String projectEndDatePlus7(int projectNo);
	//endDate에 14 더하기
	String projectEndDatePlus14(int projectNo);
	//작업 진행중인 프로젝트 조회
	ProjectDto workingProject(int memberNo);
	//프로젝트 member(창작자) 업데이트
	boolean projectMemberUpdate(ProjectDto projectDto);
	// 프로젝트 Story 업데이트
	boolean projectStoryUpdate(ProjectDto projectDto);
	// 프로젝트 state 업데이트 1 -> 2
	boolean projectApprovalUpdate2(int projectNo);
	// 프로젝트 state 업데이트 2 -> 1
	boolean projectApprovalUpdate1(int projectNo);
	// 프로젝트 항목 전체 가져와서 달성도 계산
	int calculateProjectProgress(int projectNo);
	//프로젝트 No를 이용한 프로젝트 조회
	ProjectDto getByProjectNo(int projectNo);
	//프로젝트 No를 이용한 프로젝트Vo 조회(Date String타입으로 변환)
	ProjectVo getProjectVoByProjectNo(int projectNo);
	//프로젝트 삭제(memberNo, projectNo 를 이용)
	boolean projectDelete(ProjectDto projectDto);
	//index화면 프로젝트 리스트 
	List<IndexProjectVo> indexProjectMain();
	//index화면 프로젝트 리스트 
	List<IndexProjectVo> indexProjectMain2();
	//index화면 프로젝트 리스트 
	List<IndexProjectVo> indexProjectMain3();
	// 프로젝트 달성도 업데이트
	void setPercent(ProjectDto projectDto);
	// 키워드 검색
	List<IndexProjectVo> projectSearch(SearchVo searchVo);
	// 키워드 검색 갯수
	int projectSearchCount(SearchVo searchVo);
	// 키워드 카테고리 검색
	List<IndexProjectVo> projectCategorySearch(SearchVo searchVo);
	// 키워드 카테고리 검색 갯수
	int projectCategorySearchCount(SearchVo searchVo);
	// 키워드 검색 더보기
	List<IndexProjectVo> projectSearchAll(SearchVo searchVo);
	// 키워드 카테고리 검색 더보기
	List<IndexProjectVo> projectCategorySearchAll(SearchVo searchVo);
	// 필터에 따른 프로젝트 리스트 조회
	List<IndexProjectVo> projectList(SearchVo searchVo);
	//프로젝트 좋아요시 카운트 +1
	boolean projectLikeUp(int projectNo);
	//프로젝트 좋아요시 카운트 -1
	boolean projectLikeDown(int projectNo);
	//프로젝트번호로 후원자 기록 조회
	List<SponsorDto> projectSponsorByProjectNo(int projectNo);
	//프로젝트 후원자 리스트 조회
	ProjectSponsorVo getSponsorSelect(int projectNo);
	// ProjectAmountVo 가져오기
	List<ProjectAmountGiveVo> getProjectAmountGiveVoList();
	// 완료된 프로젝트 포인트 지급 컬럼 업데이트
	void setProjectAmountGiveY(int projectNo);
	
}
