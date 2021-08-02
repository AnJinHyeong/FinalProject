package com.kh.finalproject.projectTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.SponsorDao;
import com.kh.finalproject.vo.ProjectAmountGiveVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class ProjectAmountGiveTest01 {

	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private SponsorDao sponsorDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Test
	public void test() {
		
		for(ProjectAmountGiveVo projectAmountGiveVo : projectDao.getProjectAmountGiveVoList()) {
			int projectNo = projectAmountGiveVo.getProjectNo();
			if(projectAmountGiveVo.getProjectPercent() < 100) {
				// 프로젝트 달성도 100% 미만 후원자들에게 포인트 지급
				for(ProjectAmountGiveVo projectAmountGiveVo2 : sponsorDao.getSponsorAmountListByProjectNo(projectNo)) {
					memberDao.addPoint(SponsorDto.builder()
							.memberNo(projectAmountGiveVo2.getSponsorMemberNo())
							.sponsorAmount(projectAmountGiveVo2.getSponsorAmount())
							.build());
				}
				projectDao.setProjectAmountGiveY(projectAmountGiveVo.getProjectNo());
			}
			else {
				// 프로젝트 달성도 100% 이상 제작자에게 포인트 지급
				memberDao.addPoint(SponsorDto.builder()
										.memberNo(projectAmountGiveVo.getMemberNo())
										.sponsorAmount(sponsorDao.currentAmount(projectNo))
										.build());
				projectDao.setProjectAmountGiveY(projectAmountGiveVo.getProjectNo());
			}
		}
		
	}
	
	
}
