package kr.or.ddit.service.admin.inter;

import java.util.List;

import kr.or.ddit.vo.CommonVO;

public interface IAdminCommonService {
	public List<CommonVO> getBankList();
	public List<CommonVO> getComDetailList(String comNo);
}