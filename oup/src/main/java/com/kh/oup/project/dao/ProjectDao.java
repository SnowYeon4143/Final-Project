package com.kh.oup.project.dao;

import java.util.List;

import com.kh.oup.common.PageVo;
import com.kh.oup.project.vo.DeptVo;
import com.kh.oup.project.vo.PrjOder;
import com.kh.oup.project.vo.ProjectGroupVo;
import com.kh.oup.project.vo.ProjectVo;
import com.kh.oup.project.vo.TeamVo;

public interface ProjectDao {

	List<DeptVo> getDeptList();

	List<TeamVo> getTeamList(String departCode);

	List<ProjectGroupVo> getEmpList(String teamCode);

	int getPrjCnt();

	List<ProjectVo> getPrjList(PageVo pvo);

	int getSearchPrjCnt(String search);

	List<ProjectVo> getSearchPrjList(PageVo pvo);

	int getDelPrj(int projectNo);

	ProjectVo getPrj(int projectNo);

	List<ProjectGroupVo> getPrjGroup(int projectNo);

	int enrollPrj(ProjectVo vo);

	int editPrj(ProjectVo vo);

	List<ProjectGroupVo>  getGroupList();

	int enrollPg(List<ProjectGroupVo> glist);

	int getPrjNo();

	int delPg(int projectNo);

	List<PrjOder> selectOlist(int projectNo);

	List<Integer> selectSaleList(int projectNo);

	
}
