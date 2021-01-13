package com.spring.foodie.model;

public class BoardCommentVO {
	
	
	private String board_commentNo;
	
	private String fk_email;
	private String name;
	private String content;
	private String regDate;
	private String likecnt;
	private String cntcomments;
	private String fk_boardno;
	private String depthno;
	private String groupno;
	
	
	
	public BoardCommentVO(String board_commentNo, String fk_email, String name, String content, String regDate,
		String likecnt, String cntcomments, String fk_boardno, String depthno, String groupno) {
		
		this.board_commentNo = board_commentNo;
		this.fk_email = fk_email;
		this.name = name;
		this.content = content;
		this.regDate = regDate;
		this.likecnt = likecnt;
		this.cntcomments = cntcomments;
		this.fk_boardno = fk_boardno;
		this.depthno = depthno;
		this.groupno = groupno;
	}
	
	
	
	public String getBoard_commentNo() {
		return board_commentNo;
	}
	public void setBoard_commentNo(String board_commentNo) {
		this.board_commentNo = board_commentNo;
	}
	public String getFk_email() {
		return fk_email;
	}
	public void setFk_email(String fk_email) {
		this.fk_email = fk_email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(String likecnt) {
		this.likecnt = likecnt;
	}
	public String getCntcomments() {
		return cntcomments;
	}
	public void setCntcomments(String cntcomments) {
		this.cntcomments = cntcomments;
	}
	public String getFk_boardno() {
		return fk_boardno;
	}
	public void setFk_boardno(String fk_boardno) {
		this.fk_boardno = fk_boardno;
	}
	public String getDepthno() {
		return depthno;
	}
	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}
	public String getGroupno() {
		return groupno;
	}
	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}

	
	
	
}
