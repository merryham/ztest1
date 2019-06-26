package org.zerock.domain;


import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {
	private Criteria cri;
	private boolean prev, next;
	private int end,start,current,totalCount;
	
	public PageMaker(Criteria cri, int total) {
		
		this.cri = cri;
		this.totalCount = total;
		this.current = cri.getPage();
		int temEnd =  (int)Math.ceil((current/10.0))*10;
		int tempTotal = temEnd * cri.getAmount();
	
		
		
		start=temEnd-9;
		
		prev=start!=1;
		
		if(tempTotal>totalCount) {
			end = (int)Math.ceil((totalCount/(double)cri.getAmount()));
			
		}else {
			
			end = temEnd;
		}
		
		next=tempTotal<totalCount;
		
	}
	
	
	
	
	
}
