from Myro import *
init("/dev/tty.Scribbler-DevB")

def rectangle(side1, side2):
    forward(1, side1)
    turnRight(0.9, 0.9)
    forward(1, side2)
    turnRight(0.9, 0.9)
    forward(1, side1)
    turnRight(0.9, 0.9)
    forward(1, side2)
    turnRight(0.9, 0.9)
   
   
rectangle(3, 6)