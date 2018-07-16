package com.kh.hamo.dto;

public class PageMaker {
	
	private int totalcount;//전체개시물 개수
	private int pagenum;//현재 페이지 번호
	private int contentnum=10;//한 페이지에 몇개 보일지
	private int startPage=1;//현재 페이지 블록의 시작페이지
	private int endPage=5;//현재 페이지 블록의 끝페이지
	private boolean prev=false;//이전페이지 화살표
	private boolean next;//다음페이지 화살표
	private int currentblock;//현재 페이지 블록
	private int lastblock;//마지막 페이지 블록
	
	public void prevenext(int pagenum) {
		if(pagenum>0 && pagenum<6) {		//첫페이지
			setPrev(false);
			setNext(true);
		}else if(getLastblock()==getCurrentblock()) {	//마지막페이지
			setPrev(true);
			setNext(false);
		}else {						//그 외의 경우 화살표가 모두보인다 
			setPrev(true);
			setNext(true);
		}
	}
	
	public int calcpage(int totalcount, int contentnum) {		//전체 페이지 수를 계산하는 함수
		
		// 125 (총 게시글 수)/ 10(한페이지에 보여줄 갯수) -> 12.5
		// 13페이지
		int totalpage = totalcount / contentnum;
		if(totalcount%contentnum>0) { // 나머지가 생기면 1++
			totalpage++;
		}
		return totalpage;
	}
	
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int currentblock) {
		this.startPage = (currentblock*5)-4;
		//1/ 1 2 3 4 5    [  (1*5)-4 = 1  ]      1이 시작페이지
		//2/ 6 7 8 9 10		[  (2*5)-4 = 6  ]   6이 시작페이지
		//3/ 11 12 13
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int getlastblock, int getcurrentblock) {
		if(getlastblock == getcurrentblock) {//마지막 페이지 블록이랑 현재 페이지 블록이 같을 경우
			this.endPage = calcpage(getTotalcount(), getContentnum());	// 마지막페이지는 13페이지
		}else {
			this.endPage = getStartPage()+4;	//그게 아닌경우 전부 시작페이지를 구하고 + 4
		}
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getCurrentblock() {
		return currentblock;
	}
	public void setCurrentblock(int pagenum) {
		//페이지 번호를 통해서 구한다.
		//페이지번호 / 페이지 그룹안의 페이지 개수
		//1p 1 / 5 => 0.2 (int 형으로 선언해서 0으로 된다.) 0+1= 페이지블록 1
		//3p 3 / 5 =>0.xx 0+1= 페이지블록 1
		//8p 8 / 5 =>1.6 1+1= 페이지블록 2
		this.currentblock = pagenum/5;
		if(pagenum%5>0) {
			this.currentblock++;
		}
	}
	public int getLastblock() {
		return lastblock;
	}
	public void setLastblock(int totalcount) {
		//10 , 5 => 10 * 5 => 50 게시물수 10개 * 5페이지면 각각의 페이지블록이 가지는 게시물 수는 총 50개
		//125 / 50
		// 3
		this.lastblock = totalcount / (5*this.contentnum);
		if(totalcount %(5*this.contentnum)>0) {
			this.lastblock++;
		}
	}

	
}
