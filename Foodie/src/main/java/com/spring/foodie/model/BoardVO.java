package com.spring.foodie.model;

import org.springframework.web.multipart.MultipartFile;

//=== #52. VO 생성하기
//    먼저, 오라클에서 tbl_board 테이블을 생성해야 한다.
public class BoardVO {

	private String boardno;          // 글번호 
	private String title;            // 글 제목
	private String pwd;              // 글 암호 
	private String fk_email;         // fk 이메일
	private String content;          // 내용 
	private String regDate;          // 읽은 수
	private String likecnt;          // 좋아요 수 
	private String cntcomments;      // 댓글수
	private String readcount;        // 글삭제여부   1:사용가능한 글,  0:삭제된글 
	private String status;           // 삭제여부
	private String fileName;         // 파일이름
	private String orgFileName;      // 원래 파일 이름
	
	
	
	
	public String getBoardno() {
		return boardno;
	}
	public void setBoardno(String boardno) {
		this.boardno = boardno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFk_email() {
		return fk_email;
	}
	public void setFk_email(String fk_email) {
		this.fk_email = fk_email;
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
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	
	
	
	public BoardVO(String boardno, String title, String pwd, String fk_email, String content, String regDate,
			String likecnt, String cntcomments, String readcount, String status, String fileName, String orgFileName) {
		this.boardno = boardno;
		this.title = title;
		this.pwd = pwd;
		this.fk_email = fk_email;
		this.content = content;
		this.regDate = regDate;
		this.likecnt = likecnt;
		this.cntcomments = cntcomments;
		this.readcount = readcount;
		this.status = status;
		this.fileName = fileName;
		this.orgFileName = orgFileName;
	}
	
	
	
	
	
}
