//© A+ Computer Science  -  www.apluscompsci.com

//if else if test key A

import static java.lang.System.*;

class GradeCheck
{
  private int grade;

  public GradeCheck(int g){
    setGrade(g);
  }

  public void setGrade(int g){
    grade=g;
  }

  public char getLet(){
     if(grade>=90)
       return 'A';
     else if(grade>=80)
       return 'B';
     else if(grade>=75)
       return 'C';
     else if(grade>=70)
       return 'D';
     else return 'F';
  }
}

public class IfElseIfTestKEYA
{
   public static void main( String args[] ) throws Exception
   {
		System.out.print("IF/ELSE/IF TEST 1A KEY\n\n");   
			
		System.out.print("\n#1 - ");
		int a = 950;
		if(a<700)
		   out.println("go");
		else
		   out.println("stop");



		System.out.print("\n#2 - ");
		int b = 350;
		if(b<700)
		   out.println("go");
		else
		   out.println("stop");


		System.out.print("\n#3 - no output");
		String c = "abc";
		if(c.equals("ABC"))
		   out.println("same");


		System.out.print("\n#4 - ");
		String d = "abc";
		if(d.equals("ABC"));
		   out.println("same");



		System.out.print("\n#5 - ");
		int e=3;
		if(e>=5)
		   out.print("same");
		else
		   out.print("notsame");
		out.print("done");




		System.out.print("\n#6 - ");
		int f=7;
		if(f>=5)
		   out.print("same");
		else
		   out.print("notsame");
		out.print("done");



		System.out.print("\n#7 - ");
		int g=5;
		if(g==5)
		out.print("same");
		else out.print("notsame");
		out.print("done");



		System.out.print("\n#8 - error");
/*
		int h=4;
		if(h>=12);
		   out.print("1");
		else
		   out.println("2");

		out.println("\n\n");
*/


		System.out.print("\n#9 - ");
		int i = 4;
		if(i<=22){
		   out.print("1");
		}
		out.println("2");



		System.out.print("\n#10 - ");
		int j = 4;
		if(j<=2)
		   out.print("1");
		else
		   out.print("2");


		System.out.print("\n#11 - ");
		int k=4;
		if(k>=2)
		   out.print("1");
		   if(k>=7)
		      out.print("2");
		else
		   out.print("3");




		System.out.print("\n#12 - ");
		int m=4;
		if(m>=2){
		   out.print("1");
		   if(m>=7)
		      out.print("2");
		   else
		      out.print("3");
		}




		System.out.print("\n#13 - ");
		int n=9;
		if(n>=2)
		   out.print("1");
		   if(n>=7)
		      out.print("2");
		else
		   out.print("3");




		System.out.print("\n#14 - ");
		int p = 4;
		if(p>=2){
		   out.print("1");
		   if(p>=7)
		      out.print("2");
		}
		else
		   out.print("3");



		System.out.print("\n#15 - ");
		int q=4;
		if(q>=2){
		   if(q<=7)
		      out.print("2");
		}
		else
		   out.print("3");
		System.out.print("4");



		System.out.print("\n#16 - ");
		int r=9;
		if(r>=2)
		   if (r>=7)
		      out.print("2");
		if(r<2)
		    out.print("3");
		out.print("4");



		System.out.print("\n#17 - ");
		int s=9;
		if(s>=2)
		   if(s>=7)
		      out.print("2");
		else
		   out.print("3");




		System.out.print("\n#18 - ");
		int t=5;
		if(t>=2){
		   if(t>=7)
		      out.print("2");
		else
		   out.print("3");
		}



		System.out.print("\n#19 - ");
		int u=100, v=88;
		if(u>90)
		   if(v>95)
		      out.print("def");
		   else
		      out.print("xyz");
		else
		   out.print("ghi");
		out.print("fun");




		System.out.print("\n#20 - ");
		int w=100, x=88;
		if(w>90)
		   if(x>80)
		      out.print("def");
		   else
		      out.print("xyz");
		else
		   out.print("ghi");
		out.print("fun");

		out.println("\n\n");



		System.out.print("\n#21 - ");
		String st_A = "abc";
		String st_B = "ABC";
		out.println(st_A.compareTo(st_B));


		System.out.print("\n#22 - ");
		String st_C = "abc";
		String st_D = "ABC";
		out.println(st_D.compareTo(st_C));



		System.out.print("\n#23 - ");
		String st_E = "ABC";
		String st_G = "ABC";
		out.println(st_E.compareTo(st_G));


		System.out.print("\n#24 - ");
		String st_H = "abcabc";
		st_H=st_H.replaceAll("a","-");
		out.println(st_H);


		System.out.print("\n#25 - ");
		String sOne = "abc";
		String sTwo = "ABC";
		if(sOne.compareTo(sTwo)==0)
		   out.print("equal");
		else if(sOne.compareTo(sTwo)>0)
		   out.print("bigger");
		else if(sOne.compareTo(sTwo)<0)
		   out.print("smaller");



		System.out.print("\n#26 - ");
		String sThree = "ABC";
		String sFour = "abc";
		if(sThree.compareTo(sFour)==0)
		   out.print("equal");
		else if(sThree.compareTo(sFour)>0)
		   out.print("bigger");
		else if(sThree.compareTo(sFour)<0)
		   out.print("smaller");


		System.out.print("\n#27 - ");
		String sFive = "abc";
		String sSix = "abc";
		if(sFive.compareTo(sSix)==0)
		   out.print("equal");
		else if(sFive.compareTo(sSix)>0)
		   out.print("bigger");
		else if(sFive.compareTo(sSix)<0)
		   out.print("smaller");



		System.out.print("\n#28 - ");
		String sSeven = "abc";
		String sEight = "abc";
		if(sSeven.charAt(0)==sEight.charAt(0))
		   out.print("equal");
		else if(sSeven.charAt(0)>sEight.charAt(0))
		   out.print("bigger");
		else if(sSeven.charAt(0)<sEight.charAt(0))
		   out.print("smaller");




		System.out.print("\n#29 - ");
		String sNine = "abc";
		String sTen = "ABC";
		if(sNine.charAt(0)==sTen.charAt(0))
		   out.print("equal");
		else if(sNine.charAt(0)>sTen.charAt(0))
		   out.print("bigger");
		else if(sNine.charAt(0)<sTen.charAt(0))
		   out.print("smaller");


		System.out.print("\n#30 - ");
		String one = "ABC";
		String two = "abc";

		if(one.charAt(0)==two.charAt(0))
		   out.print("equal");
		else if(one.charAt(0)>two.charAt(0))
		   out.print("bigger");
		else if(one.charAt(0)<two.charAt(0))
		   out.print("smaller");


		System.out.print("\n#31 - ");
		int numA=100, numB=17;
		if(numA>90) 
		   if(numB>10)
		      out.print("go");
		out.print("nogo");


		System.out.print("\n#32 - ");
		int numE=100, numF=10;
		if(numE>90) 
		   if(numF>10)
		      out.print("go");
		   else
		      out.print("run");
		else
		   out.print("fly");
		out.print("nogo");



		System.out.print("\n#33 - ");
		int numG=100, numH=11;
		if(numG>90){ 
		   if(numH>10)
		      out.print("go");
		}else
		   out.print("run");
		out.print("nogo");



		System.out.print("\n#34 - ");
		int numJ = 101;
		switch(numJ)
		{
		   case 11 : out.print("one"); break;
		   case 21 : out.print("two"); break;
		   case 98 : out.print("three"); break;
		   case 101 : out.print("four"); break;
		   case 111 : out.print("five"); break;
		   case 121 : out.print("six"); break;
		}
		
			
		

		System.out.print("\n#35 - ");
		int numK = 101;
		switch(numK)
		{
		   case 11 : out.print("one"); break;
		   case 21 : out.print("two");
		   case 98 : out.print("three"); break;
		   case 101 : out.print("four");
		   case 111 : out.print("five"); break;
		   case 121 : out.print("six"); 
		}
		
		
		
		
		
		System.out.print("\n#36 - ");				
		int numM = 11;
		switch(numM)
		{
		   case 11 : out.print("one");
		   case 21 : out.print("two");
		   case 98 : out.print("three"); break;
		   case 101 : out.print("four");
		   case 111 : out.print("five"); break;
		   case 121 : out.print("six"); 
		}


		System.out.print("\n#37 - ");
		int numN = 100, numO = 88;
		if(numN>90) 
		   if(numO>90)
		      out.print("def");
		   else if(numO>80)
		      out.print("xyz");
		   else
		      out.print("ghi");
		out.print("fun");
		
		
		
		
		System.out.print("\n#38 - ");		
		int numP = 100, numQ = 84;
		if(numP>90) 
		   if(numQ>90)
		      out.print("def");
		   else if(numQ>85)
		      out.print("xyz");
		   else if(numQ>80)
		      out.print("ghi");
		out.print("fun");


		System.out.print("\n#39 - ");	
		
		
		System.out.print("\n#40 - ");			
		//code in the main of another class
		GradeCheck check;
		check = new GradeCheck(67);
		out.println(check.getLet()); //line 1

   }
}

