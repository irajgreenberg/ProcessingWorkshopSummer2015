/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Skyline
 *
 * @authors Aaron Cadle and DiVonte Gorham. 
 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.
 *
 */
 
void setup()
{
  color topColor = color(0, 0, 100);
  color bottomColor = color(255, 248, 10);
  float gradeFactor;
  
  size(1244, 640);
  background(topColor);
  //NOTE GRADIENT CODE BELOW CAN BE LEFT OUT IF DESIRED
//  loadPixels();
//  for (int i = 0;i<pixels.length; i++)
//  {
//    float r= red(pixels[i]);
//    float g= green(pixels[i]);
//    float b= blue(pixels[i]);
//
//    float r2 = red(bottomColor);
//    float g2 = green(bottomColor);
//    float b2 = blue(bottomColor);
//
//    r = r * (pixels.length - i) / pixels.length + ((r2 * i) / pixels.length);
//    g = g * (pixels.length - i) / pixels.length + ((g2 * i) / pixels.length);
//    b = b * (pixels.length - i) / pixels.length + ((b2 * i) / pixels.length);
//    pixels[i] = color(r, g, b);
//  }
//  updatePixels();
}


//Original Source Photo URL:
 //http://med.uth.tmc.edu/administration/dean/artwall/auction/images/FangHoustonSkyline.JPG
 //Found on January 29,2012 on the webpage:
 //http://med.uth.tmc.edu/administration/dean/artwall/auction/auction-2009-bid.html
void draw()
 { 
   //building11
     fill(#49353E);
     beginShape();
       vertex(1180,height);
       vertex(1173,height-311);
       vertex(1167,height-324);
       vertex(1180,height-325);
       vertex(1180,height-331);
       vertex(1202,height-334);
       vertex(1226,height-332);
       vertex(1224,height-326);
       vertex(1258,height);
     endShape();
   //building10
     fill(#0C1439);
     beginShape();
       vertex(1113,height);
       vertex(1101,height-303);
       vertex(1098,height-306);
       vertex(1099,height-325);
       vertex(1094,height-326);
       vertex(1101,height-346);
       vertex(1106,height-351);
       vertex(1109,height-368);
       vertex(1158,height-371);
       vertex(1158,height-356);
       vertex(1167,height-337);
       vertex(1167,height-324);
       vertex(1173,height-311);
       vertex(1180,height);
     endShape();
   //building9
     fill(#262128);
     beginShape();
       vertex(959,height);
       vertex(959,height-10);
       vertex(977,height-10);
       vertex(977,height-259);
       vertex(974,height-260);
       vertex(974,height-261);
       vertex(991,height-264);
       vertex(1052,height-263);
       vertex(1056,height-260);
       vertex(1067,height-260);
       vertex(1070,height-264);
       vertex(1069,height-301);
       vertex(1087,height-306);
       vertex(1101,height-303);
       vertex(1113,height);
     endShape();
   //building8
     fill(#1E5393);
     beginShape();
       vertex(753,height);
       vertex(742,height-479);
       vertex(776,height-479);
       vertex(776,height-483);
       vertex(787,height-485);
       vertex(814,height-478);
       vertex(828,height-467);
       vertex(844,height);
     endShape();
   //building7
     fill(#302938);
     beginShape();
       vertex(679,height);
       vertex(679,height-246);
       vertex(659,height-246);
       vertex(659,height-251);
       vertex(652,height-255);
       vertex(652,height-265);
       vertex(652,height-268);
       vertex(652,height-339);
       vertex(659,height-339);
       vertex(659,height-370);
       vertex(709,height-373);
       vertex(709,height-381);
       vertex(733,height-381);
       vertex(775,height-366);
       vertex(780,height-142);
       vertex(843,height-143);
       vertex(838,height-364);
       vertex(884,height-362);
       vertex(900,height-355);
       vertex(902,height-213);
       vertex(930,height-201);
       vertex(930,height-191);
       vertex(922,height-191);
       vertex(922,height-185);
       vertex(933,height-186);
       vertex(933,height-142);
       vertex(959,height-134);
       vertex(959,height);
     endShape();
   //building6
     fill(#2A2737);
     beginShape();
       vertex(487,height);
       vertex(487,height-221);
       vertex(525,height-222);
       vertex(525,height-237);
       vertex(528,height-237);
       vertex(529,height-311);
       vertex(538,height-323);
       vertex(538,height-337);
       vertex(546,height-351);
       vertex(546,height-363);
       vertex(551,height-378);
       vertex(555,height-379);
       vertex(555,height-392);
       vertex(559,height-403);
       vertex(563,height-403);
       vertex(563,height-418);
       vertex(568,height-430);
       vertex(572,height-430);
       vertex(572,height-444);
       vertex(576,height-445);
       vertex(576,height-451);
       vertex(577,height-451);
       vertex(579,height-447);
       vertex(604,height-440);
       vertex(605,height-434);
       vertex(608,height-434);
       vertex(612,height-421);
       vertex(612,height-408);
       vertex(615,height-408);
       vertex(622,height-394);
       vertex(622,height-383);
       vertex(625,height-383);
       vertex(631,height-370);
       vertex(631,height-268);
       vertex(652,height-265);
       vertex(652,height-255);
       vertex(659,height-251);
       vertex(659,height-246);
       vertex(679,height-246);
       vertex(679,height);
     endShape();
   //building5
     fill(#07060c);
     beginShape();
       vertex(291,height);
       vertex(293,height-210);
       vertex(302,height-212);
       vertex(302,height-226);
       vertex(309,height-232);
       vertex(309,height-239);
       vertex(311,height-239);
       vertex(311,height-232);
       vertex(318,height-223);
       vertex(319,height-258);
       vertex(352,height-309);
       vertex(456,height-316);
       vertex(483,height-256);
       vertex(487,height);
     endShape();
   //building4
     fill(#533F58);
     beginShape();
       vertex(226,height);
       vertex(231,height-269);
       vertex(235,height-270);
       vertex(235,height-276);
       vertex(239,height-280);
       vertex(276,height-281);
       vertex(286,height-266);
       vertex(286,height-260);
       vertex(290,height-260);
       vertex(291,height);
     endShape();
   //building3
     fill(#212B4C);
     beginShape();
       vertex(57,height);
       vertex(70,height-280);
       vertex(98,height-280);
       vertex(102,height-559);
       vertex(157,height-569);
       vertex(192,height-559);
       vertex(186,height-307);
       vertex(209,height-304);
       vertex(215,height-298);
       vertex(232,height-298);
       vertex(226,height);
     endShape(); 
   //building2
     fill(#5c4b47);
     beginShape();
       vertex(39,height);
       vertex(39,height-170);
       vertex(55,height-170);
       vertex(55,height-296);
       vertex(45,height-295);
       vertex(43,height-297);
       vertex(43,height-300);
       vertex(50,height-305);
       vertex(62,height-305);
       vertex(67,height-302);
       vertex(67,height-298);
       vertex(64,height-296);
       vertex(58,height-295);
       vertex(60,height-240);
       vertex(85,height-240);
       vertex(87,height-167);
       vertex(123,height-167);
       vertex(128,height);
     endShape();
   //building1
     fill(#0b0a0f);
     beginShape();
       vertex(0,height-314);
       vertex(27,height-309);
       vertex(27,height-302);
       vertex(39,height-302);
       vertex(39,height);
       vertex(0,height);
     endShape();
   //freewayArea
     fill(#120808);
     ellipse(width/2,height+170,width*4,height);
 }
