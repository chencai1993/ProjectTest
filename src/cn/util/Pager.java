package cn.util;


public class Pager {
	private int currentpage = 1;
	private int pagesize = 10;
	private int totalrecordsize=-1;
	private int totalpagesize=0;

	public int getStartIndex()  // 获取记录索引开始值
	{
		int result=pagesize*(currentpage-1);
		if(currentpage>totalpagesize || result>totalrecordsize)return -1;
		else return result;
		
	}
	public int getEndIndex()   // 获取记录的结束索引
	{
		int result=getStartIndex()+pagesize-1;
		return result>=totalrecordsize? totalrecordsize-1 : result;
	}
	public Pager() {
		super();
	}

	public Pager(int currentpage, int pagesize, int totalrecordsize) {
		super();
		this.currentpage = currentpage;
		this.pagesize = pagesize;
		this.totalrecordsize = totalrecordsize;
		this.totalpagesize=(int) Math.ceil((totalrecordsize*1.0/pagesize));
	}
	public Pager(int currentpage, int pagesize, int totalrecordsize,
			int totalpagesize) {
		super();
		this.currentpage = currentpage;
		this.pagesize = pagesize;
		this.totalrecordsize = totalrecordsize;
		this.totalpagesize = totalpagesize;
	}

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
		this.totalpagesize=(int) Math.ceil((totalrecordsize*1.0/pagesize));
	}

	public int getTotalrecordsize() {
		return totalrecordsize;
	}

	public void setTotalrecordsize(int totalrecordsize) {
		this.totalrecordsize = totalrecordsize;
		this.totalpagesize=(int) Math.ceil((totalrecordsize*1.0/pagesize));
	}

	public int getTotalpagesize() {
		return this.totalpagesize;
	}

	public void setTotalpagesize(int totalpagesize) {
		this.totalpagesize = totalpagesize;
	}
	@Override
	public String toString() {
		return "Pager [currentpage=" + currentpage + ", pagesize=" + pagesize
				+ ", totalrecordsize=" + totalrecordsize + ", totalpagesize="
				+ totalpagesize + "]"+"\n";
	}

}
