package cn.util;

public class Test {
	public static void main(String[] args) {
        Pager pager=new Pager(1,5,3423);
        System.out.print(pager.toString());
        for(int i=1;i<=pager.getTotalpagesize()+10;i++)
        {
        	pager.setCurrentpage(i);
        	System.out.print(i+"("+pager.getStartIndex()+"==="+pager.getEndIndex()+")"+"\n");
        }
        
	}
}
