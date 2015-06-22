from Myro import *
init("/dev/tty.IPRE6-296028-DevB")
def makeTone(leftLight, centerLight, rightLight):
    if leftLight>64600 and centerLight>64600 and rightLight>64600:
        beep(1, 523.25)
    elif leftLight>64600 and centerLight>64600 and rightLight<=64600:
        beep(1, 587.33)
    elif leftLight>64600 and centerLight<=64600 and rightLight>64600:
        beep(1, 659.26)
    elif leftLight>64600 and centerLight<=64600 and rightLight<=64600:
        beep(1, 987.77)
    elif centerLight>64600 and rightLight>64600:
        beep(1, 698.46)
    elif centerLight>64600 and rightLight<=64600:
        beep(1, 880)
    elif rightLight>64600:
        beep(1, 783.99)
    else:
        beep(1, 1046.50)

for seconds in timer(20):
    makeTone(getLight("left"), getLight("center"), getLight("right"))

        
        