from Graphics import *
from Myro import *

myWindow = Window("My bouncing ball program", 800, 500)

ball = Circle((400,250), 50)
ball.draw(myWindow)
ball.fill = Color("red")


x=0.00097
y=0.0009
for seconds in timer(15):

    
  if ball.getX()>=750 or ball.getX()<=50:
      x=-x
  
  if ball.getY()>=450 or ball.getY()<=50:
      y=-y   
     
  ball.move(x, y)      
      
      
    
    



