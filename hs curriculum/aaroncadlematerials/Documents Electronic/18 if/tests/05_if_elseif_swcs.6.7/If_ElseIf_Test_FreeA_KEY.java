//© A+ Computer Science  -  www.apluscompsci.com

//if else if test key

import static java.lang.System.*;

class CompareNums
{
   private int one,two;

   public CompareNums(int n1, int n2)
   {
      setNums(n1,n2);
   }	              
 
   public void setNums(int n1, int n2)
   {
		one=n1;
		two=n2;
   }	              
   
	//returns true of one == two
	//returns false if one != two
   public boolean compare()
   {  
		if(one==two)
		   return true;
		return false;
   }

	//returns one and two are equals if ==
  	//returns one and two are not equal is !=
   public String toString()
   {  
		if(compare())
			return one + " and " + two + " are equal.";
	  	return one + " and " + two + " are not equal.";
	}
}

public class If_ElseIf_Test_FreeA_KEY
{
   public static void main(String args[])
   {
		//code in the main of another class
		CompareNums test = new CompareNums(32,32);
		System.out.println(test);
		
		test.setNums(15,8);
		System.out.println(test);
   }
}