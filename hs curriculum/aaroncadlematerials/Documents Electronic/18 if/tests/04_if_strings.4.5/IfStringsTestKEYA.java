//© A+ Computer Science  -  www.apluscompsci.com

//ifs strings test key A

import static java.lang.System.*;

class StringTester
{
  private String sOne, sTwo;
  public StringTester()
  {
    setEm("","");
  }
  public StringTester(String o, String t)
  {
    setEm(o,t);
  }
  public void setEm(String o, String t)
  {
    setOne(o);
    setTwo(t);
  }
  public void setOne(String one){
    sOne=one;
  }
  public void setTwo(String two){
    sTwo=two;
  }
  public String testEm()
  {
    if(sOne.length()==sTwo.length())
       return "equal";
    if(sOne.length()>sTwo.length())
       return "bigger";
    return "smaller";
  }
}


class IfsStringsTestKEYA
{
   public static void main( String args[] ) throws Exception
   {
		System.out.print("IF/STRINGS TEST 1A KEY\n\n");   
			
		System.out.print("\n#1 - 7");
		
		
		
		System.out.print("\n#8 - ");		
		int aNum = 789;
		if(aNum>700)
		   out.println("big");
		if(aNum<700)
		   out.println("little");  
			
	
		System.out.print("\n#9 - ");		
		int bNum = 200;
		if(bNum>700)
		   out.println("big");
		if(bNum<700)
		   out.println("little"); 
		
		
		
		System.out.print("\n#10 - ");		
		String aWord = "abc";
		if(aWord.equals("ABC"))
		   out.println("same");
		
		
		
		System.out.print("\n#11 - ");		
		String bWord = "abc";
		if(bWord.equals("ABC"));
		   out.println("same");
		
		
		
		System.out.print("\n#12 - ");		
		int cNum = 5;
		if(cNum == 5)
		   out.print("same");
		if(cNum != 5)
		   out.print("notsame");
		out.print("done");
				
		
		
		System.out.print("\n#13 - ");										
		int dNum = 7;
		if(dNum == 5)
		   out.print("same");
		if(dNum != 5)
		   out.print("notsame");
		out.print("done");




		System.out.print("\n#14 - ");		
		int eNum = 5;
		if(eNum == 9)
		out.print("same");
		out.print("notsame");
		out.print("done");
		
		
		
		System.out.print("\n#15 - ");		
		int fNum = 4;
		if(fNum >= 12);
		   out.print("1");
		out.println("2");
		
		
		
		System.out.print("\n#16 - ");		
		int gNum = 4;
		if(gNum >= 22){ 
		   out.print("1");  
		}
		out.println("2");
		
		
		
		System.out.print("\n#17 - ");										
		int hNum = 4;
		if(hNum >= 2)   
		   out.print("1");
		if(hNum < 2)  
		   out.print("2");
				
				
				
		System.out.print("\n#18 - ");		
		int iNum = 4;
		if(iNum >= 2)
		   out.print("1");
		   if(iNum >= 7)
		      out.print("2");
		if(iNum > 2)
		   out.print("3"); 
				
		
		
		System.out.print("\n#19 - ");		
		int jNum = 4;
		if(jNum >= 2){
		   out.print("1");
		   if(jNum >= 7)
		      out.print("2");
		   if(jNum < 7)
		      out.print("3"); 
		}
		
		
		
		System.out.print("\n#20 - ");		
		int kNum = 9;
		if(kNum >= 2)
		   out.print("1");
		   if(kNum >= 7)
		      out.print("2");
		if(kNum < 2)
		   out.print("3"); 
		
		
		
		System.out.print("\n#21 - ");		
		int mNum = 4;
		if(mNum >= 2){
		   out.print("1");
		   if(mNum >= 7)
		      out.print("2");
		}
		if(mNum < 2)
		   out.print("3");
				
		
		
		System.out.print("\n#22 - ");		
		int oNum = 4;
		if(oNum >= 2){
		   if(oNum >= 7)
		      out.print("2");
		}
		if(oNum < 2)
		   out.print("3");
		System.out.print("4");
		
		
		
		System.out.print("\n#23 - ");		
		int pNum = 9;
		if(pNum >= 2) 
		   if(pNum >= 7)
		      out.print("2");
		if(pNum < 2)
		    out.print("3");
		out.print("4");
				
		
		
		System.out.print("\n#24 - ");		
		int qNum = 9;
		if(qNum >= 2) 
		   if(qNum >= 7)
		      out.print("2");
		if(qNum < 2)
		   out.print("3");
				
		
		
		System.out.print("\n#25 - ");																				
		int rNum = 5;
		if(rNum >= 2){ 
		   if(rNum >= 7)
		      out.print("2");
		if(rNum > 2)
		   out.print("3");
		}
				
		
		System.out.print("\n#26 - ");	
		int x=100, z=88;
		if(x > 90) 
		   if(z > 95)
		      out.print("def");
		   if(z < 95)
		      out.print("xyz");
		if(x < 90)
		   out.print("ghi");
		out.print("fun");
				
		
		
		System.out.print("\n#27 - ");	
		int a=100, b=88;
		if(a > 90) 
		   if(b > 80)
		      out.print("def");
		   if(b < 80)
		      out.print("xyz");
		if(a < 90)
		   out.print("ghi");
		out.print("fun");

		
		
		System.out.print("\n#28 - ");	
		int c=100, d=88;
		if(c > 90) 
		   if(d > 95)
		      out.print("def");
		if(c < 90)
		   out.print("ghi");
		out.print("fun");


		
		
		
		System.out.print("\n#29 - ");									
		int e=100, f=88;
		if(e > 90){ 
		   if(f > 80)
		      out.print("def");
		}
		if(e < 90)
		   out.print("ghi");
		out.print("fun");




		System.out.print("\n#30 - ");	
		String zWord = "COMPSCI";
		out.println(zWord.charAt(3));



		System.out.print("\n#31 - ");	
		String xWord = "COMPSCI";
		out.println(xWord.substring(0,3));



		System.out.print("\n#32 - ");	
		String cWord = "COMPSCI";
		out.println(cWord.substring(1,4));
		

		System.out.print("\n#33 - ");	
		String dWord = "COMPSCI";
		out.println(dWord.substring(3,5));
		
		
		
		System.out.print("\n#34 - ");	
		String eWord = "abcdefghi";
		out.println(eWord.indexOf('d'));
		
		
		
		System.out.print("\n#35 - ");	
		String fWord = "abcdefghi";
		out.println(fWord.indexOf('x'));
		
		


		System.out.print("\n#36 - ");							
		String gWord = "abcdef";
		out.println(gWord.length());


		System.out.print("\n#37 - ");	
		String s = "abcdef";
		out.println(s.charAt(s.length()-3));

		
		//code in the main of another class
		StringTester it;
		it = new StringTester("ant","alligator");

		System.out.print("\n#39 - ");	
		out.println(it.testEm());   //line 1
		
		System.out.print("\n#40 - ");			
		it.setEm("alligator","ape");
		out.println(it.testEm());   //line 2
   }
}

