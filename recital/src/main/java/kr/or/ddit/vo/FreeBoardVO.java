package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class FreeBoardVO {
	private int rnum; // 행번호 추가
	private String freeNo;
	private String userNo;
	private String freeTitle;
	private String freeWriter;
	private String freeContent;
	private int freeCnt;
	private String freeDate;
	private String delYn;

	
	
}
