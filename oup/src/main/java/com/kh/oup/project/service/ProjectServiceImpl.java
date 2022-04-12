package com.kh.oup.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oup.common.PageVo;
import com.kh.oup.project.dao.ProjectDao;
import com.kh.oup.project.vo.DeptVo;
import com.kh.oup.project.vo.PrjOder;
import com.kh.oup.project.vo.ProjectGroupVo;
import com.kh.oup.project.vo.ProjectVo;
import com.kh.oup.project.vo.TeamVo;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao dao;
	
	
	@Override
	public List<DeptVo> selectDeptList() {
		
		return dao.getDeptList();
	}


	@Override
	public List<TeamVo> selectTeamList(String departCode) {
		
		return dao.getTeamList(departCode);
	}


	@Override
	public List<ProjectGroupVo> selectEmpList(String teamCode) {
		
		return dao.getEmpList(teamCode);
	}

	
	//조회-----------------------------------
	//페이징
	@Override 
	public int getPrjCnt() {
		return dao.getPrjCnt();
	}
	//조회
	@Override
	public List<ProjectVo> getPrjList(PageVo pvo) {
		return dao.getPrjList(pvo);
	}
	//검색 페이징
	@Override
	public int getSearchPrjCnt(String search) {
		return dao.getSearchPrjCnt(search);
	}
	//검색 조회
	@Override
	public List<ProjectVo> getSearchPrjList(PageVo pvo) {
		return dao.getSearchPrjList(pvo);
	}

	
	
	//삭제------------------------------------
	@Override
	public int delPrj(int projectNo) {
		return dao.getDelPrj(projectNo);
	}

	//특정 prj 가져오기
	@Override
	public ProjectVo selectPrj(int projectNo) {
		return dao.getPrj(projectNo);
	}

	//그룹가져오기(projecNo)
	@Override
	public List<ProjectGroupVo> selectPrjgroup(int projectNo) {
		return dao.getPrjGroup(projectNo);
	
	}

	//프로젝트 등록
	@Override
	public int enrollPrj(ProjectVo vo) {
		
		
		String c1 = vo.getProjectContents1().replace("<br>", "\r\n");
		String c2 = vo.getProjectContents2().replace("<br>", "\r\n");
		String c3 = vo.getProjectContents3().replace("<br>", "\r\n");
		String c4 = vo.getProjectContents4().replace("<br>", "\r\n");
		
		vo.setProjectContents1(c1);
		vo.setProjectContents2(c2);
		vo.setProjectContents3(c3);
		vo.setProjectContents4(c4);
		
		int result = dao.enrollPrj(vo);
		return result;
	}

	//프로젝트 수정
	@Override
	public int editPrj(ProjectVo vo) {
		int result = dao.editPrj(vo);
		
		String c1 = vo.getProjectContents1().replace("<br>", "\r\n");
		String c2 = vo.getProjectContents2().replace("<br>", "\r\n");
		String c3 = vo.getProjectContents3().replace("<br>", "\r\n");
		String c4 = vo.getProjectContents4().replace("<br>", "\r\n");
		
		vo.setProjectContents1(c1);
		vo.setProjectContents2(c2);
		vo.setProjectContents3(c3);
		vo.setProjectContents4(c4);
		
		return result;
	}

	//그룹 전체 조회
	@Override
	public List<ProjectGroupVo> getGroupList() {
		return dao.getGroupList();
	}

	//empNo[] -> 프로젝트 그룹 등록
 	@Override
	public int enrollPg(int[] employeeNo, int projectNo) {

		
 		List<ProjectGroupVo> glist = new ArrayList<ProjectGroupVo>();
 		ProjectGroupVo gvo = null;
		for(int i = 0; i < employeeNo.length; i++) {
			if(i==0) {
				gvo = new ProjectGroupVo();
				gvo.setEmployeeNo(employeeNo[i]);
				gvo.setGroupPosition("L");
				gvo.setProjectNo(projectNo);
				
				glist.add(gvo);
				
			}else if(i>0) {
				gvo = new ProjectGroupVo();
				gvo.setEmployeeNo(employeeNo[i]);
				gvo.setGroupPosition("F");
				gvo.setProjectNo(projectNo);
				
				glist.add(gvo);
			}
		}
		
		return dao.enrollPg(glist);
	}


	@Override
	public int getPrjNo() {
		return dao.getPrjNo();
	}


	@Override
	public int delPg(int projectNo) {
		return dao.delPg(projectNo);
	}


	@Override
	public List<PrjOder> selectOlist(int projectNo) {
		return dao.selectOlist(projectNo);
	}


	@Override
	public List<Integer> selectSaleList(int projectNo) {
		return dao.selectSaleList(projectNo);
	}


}
