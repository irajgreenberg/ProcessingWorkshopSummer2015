///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////INFO//

//   I N F O
/*

 * ID# : 276981
 * Lab : Skyline
 *
 * @author Aaron Cadle
 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.
 *
 */

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SETUP//

//   S E T U P
void setup()
{
  size(1244, 640);
  background(255);
  frameRate(30);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////COLOR_PALETTE//

//   C O L O R   P A L E T T E
color metroBlue = color (79, 180, 200);
color metroRed = color (240, 59, 94);
color metroGreen = color (166, 184, 40);
color metroYellow = color (239, 162, 46);
color metroPurple = color(83,84,138);

color metroBlue_d = color (0, 173, 239);
color metroGreen_d = color (83, 158, 57);

color black = color (0, 0, 0);

float opacity = 130;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////CLOCK//

//   C L O C K
int minutes = 4;
String minutes_string = "04";
int hours = 6;
String hours_string = "06";
String ampm = "AM";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VARIABLE_INDEX//

//   V A R I A B L E   I N D E X
//   Name      Datatype Description
//
//   a         float    Locates the y coordinate of Grass and the inverse of the height of Grass.
//   b         float    Half the width of the screen.
//   c         float    X coordinate of Sun.
//   d         float    Y coordinate of Sun.
//   e         float    X coordinate of corner of Blue_Buildings.
//   f         float    Y coordinate of corner of Blue_Buildings.
//   g         float    Height of the elliptical pathway that Blue_Buildings'_Shadow takes.
//   h         float    Width of the elliptical pathway that Blue_Buildings'_Shadow takes.
//   i         float    X coordinate of a shadow's corner.
//   j         float    Y coordinate of a shadow's corner.

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////DRAW//

//   D R A W
void draw()
{
  int time = (frameCount%360);
  float cycle = 180;

  minutes = (frameCount%(60/(1440/360)))*(1440/360);
  if (minutes == 0)
  {
    hours += 1;
    if (hours == 12)
    {
      if (ampm == "AM")
      {
        ampm = "PM";
      }
      else if (ampm == "PM")
      {
        ampm = "AM";
      }
    }
    else if (hours == 13)
    {
      hours = 1;
    }
  }

  if (minutes < 10)
  {
    minutes_string = "0" + str(minutes);
  }
  else if (minutes >= 10)
  {
    minutes_string = str(minutes);
  }

  if (hours < 10)
  {
    hours_string = "0" + str(hours);
  }
  else if (hours >= 10)
  {
    hours_string = str(hours);
  }

  float a = ((17*height)/24);
  float b = (width/2);
  float c = ((width/cycle)*time);
  float d = (height-sqrt( ((sq(b)*sq(a)) - (sq(a)*sq(c-b)))/sq(b) ))-(height-a);
  //////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS///
  fill(metroPurple);
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Sky_2////01//
  rect(0, 0, width, height);
  //////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS///
  smooth();
  noStroke();
  
  if ((time >= 26)&&(time <= 154))
  {
    opacity = 255;
  }
  else if ((time >= 155)&&(time <= 205))
  {
    opacity -= 5;
  }
  else if ((time >= 206)&&(time <= 334))
  {
    opacity = 0;
  }
  else if ((time >= 335)||(time <= 25))
  {
    opacity += 5;
  }
  fill(metroBlue_d,opacity);
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Sky////02//
  rect(0, 0, width, height);
  //////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS///
  fill(metroYellow);
  pushMatrix();
  translate(0,-(5*height)/48);
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Sun////03//
  ellipse(c, d, 200, 200);
  //////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS///
  fill(metroGreen);
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Grass////04//
  rect(0, a, 1244, height-a+(5*height)/48);
  //////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS///
  fill(metroRed);
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Red_Buildings////05//
  beginShape();
  vertex(0, a);

  vertex(0, 348);
  vertex(20, 348);
  vertex(20, 331);
  vertex(45, 331);
  vertex(45, 348);
  vertex(65, 348);
  vertex(65, 330);
  vertex(85, 330);
  vertex(85, 320);
  vertex(115, 320);
  vertex(115, 293);
  vertex(125, 283);
  vertex(125, 233);
  vertex(145, 190);
  vertex(165, 170);
  vertex(165, 133);
  vertex(169, 117);
  vertex(173, 133);
  vertex(173, 170);
  vertex(193, 190);
  vertex(213, 233);
  vertex(213, 283);
  vertex(223, 293);
  vertex(223, 320);
  vertex(253, 320);
  vertex(253, 330);
  vertex(273, 330);
  vertex(273, 366);
  vertex(293, 366);
  vertex(293, 233);
  vertex(313, 233);
  vertex(313, 220);
  vertex(362, 220);
  vertex(362, 233);
  vertex(382, 233);
  vertex(382, 348);
  vertex(407, 348);
  vertex(407, 210);
  vertex(475, 130);
  vertex(475, 348);
  vertex(480, 348);
  vertex(480, 130);
  vertex(548, 210);
  vertex(548, 280);
  vertex(578, 295);
  vertex(578, 348);
  vertex(583, 348);
  vertex(583, 295);
  vertex(613, 280);
  vertex(613, 210);
  vertex(623, 200);
  vertex(653, 200);
  vertex(653, 348);
  vertex(658, 348);
  vertex(658, 200);
  vertex(688, 200);
  vertex(698, 210);
  vertex(698, 280);
  vertex(728, 295);
  vertex(728, 366);
  vertex(749, 366);
  vertex(749, 346);
  vertex(946, 346);
  vertex(946, 326);
  vertex(749, 326);
  vertex(749, 133);
  vertex(1223, 133);
  vertex(1223, 326);
  vertex(1026, 326);
  vertex(1026, 346);
  vertex(1223, 346);
  vertex(1223, 366);
  vertex(1244, 366);

  vertex(width, a);
  endShape();
  //////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS///
  fill(255);
  PFont Billboard;
  Billboard = loadFont("SegoeUI-Light-48.vlw");
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Billboard////06//
  textFont(Billboard, 48);
  text("Metro City", 749+10, 133+48);
  textFont(Billboard, 96);
  text(hours_string + " " + minutes_string, 749+10, 133+48+96);
  text(ampm, 749+10+(48*5), 133+48+96);
  //////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS//////////////SETTINGS///
  fill(black, (255*1)/2);

  float[] E = new float[73];
  E[0] = 0;
  E[1] = 20;
  E[2] = 20;
  E[3] = 45;
  E[4] = 45;
  E[5] = 65;
  E[6] = 65;
  E[7] = 85;
  E[8] = 85;
  E[9] = 115;
  E[10] = 115;
  E[11] = 125;
  E[12] = 125;
  E[13] = 145;
  E[14] = 165;
  E[15] = 165;
  E[16] = 169;
  E[17] = 173;
  E[18] = 173;
  E[19] = 193;
  E[20] = 213;
  E[21] = 213;
  E[22] = 223;
  E[23] = 223;
  E[24] = 253;
  E[25] = 253;
  E[26] = 273;
  E[27] = 273;
  E[28] = 293;
  E[29] = 293;
  E[30] = 313;
  E[31] = 313;
  E[32] = 362;
  E[33] = 362;
  E[34] = 382;
  E[35] = 382;
  E[36] = 407;
  E[37] = 407;
  E[38] = 475;
  E[39] = 475;
  E[40] = 480;
  E[41] = 480;
  E[42] = 548;
  E[43] = 548;
  E[44] = 578;
  E[45] = 578;
  E[46] = 583;
  E[47] = 583;
  E[48] = 613;
  E[49] = 613;
  E[50] = 623;
  E[51] = 653;
  E[52] = 653;
  E[53] = 658;
  E[54] = 658;
  E[55] = 688;
  E[56] = 698;
  E[57] = 698;
  E[58] = 728;
  E[59] = 728;
  E[60] = 749;
  E[61] = 749;
  E[62] = 946;
  E[63] = 946;
  E[64] = 749;
  E[65] = 749;
  E[66] = 1223;
  E[67] = 1223;
  E[68] = 1026;
  E[69] = 1026;
  E[70] = 1223;
  E[71] = 1223;
  E[72] = 1244;

  float[] G = new float[73];
  G[0] = a-348;
  G[1] = a-348;
  G[2] = a-331;
  G[3] = a-331;
  G[4] = a-348;
  G[5] = a-348;
  G[6] = a-330;
  G[7] = a-330;
  G[8] = a-320;
  G[9] = a-320;
  G[10] = a-293;
  G[11] = a-283;
  G[12] = a-233;
  G[13] = a-190;
  G[14] = a-170;
  G[15] = a-133;
  G[16] = a-117;
  G[17] = a-133;
  G[18] = a-170;
  G[19] = a-190;
  G[20] = a-233;
  G[21] = a-283;
  G[22] = a-293;
  G[23] = a-320;
  G[24] = a-320;
  G[25] = a-330;
  G[26] = a-330;
  G[27] = a-366;
  G[28] = a-366;
  G[29] = a-233;
  G[30] = a-233;
  G[31] = a-220;
  G[32] = a-220;
  G[33] = a-233;
  G[34] = a-233;
  G[35] = a-348;
  G[36] = a-348;
  G[37] = a-210;
  G[38] = a-130;
  G[39] = a-348;
  G[40] = a-348;
  G[41] = a-130;
  G[42] = a-210;
  G[43] = a-280;
  G[44] = a-295;
  G[45] = a-348;
  G[46] = a-348;
  G[47] = a-295;
  G[48] = a-280;
  G[49] = a-210;
  G[50] = a-200;
  G[51] = a-200;
  G[52] = a-348;
  G[53] = a-348;
  G[54] = a-200;
  G[55] = a-200;
  G[56] = a-210;
  G[57] = a-280;
  G[58] = a-295;
  G[59] = a-366;
  G[60] = a-366;
  G[61] = a-346;
  G[62] = a-346;
  G[63] = a-326;
  G[64] = a-326;
  G[65] = a-133;
  G[66] = a-133;
  G[67] = a-326;
  G[68] = a-326;
  G[69] = a-346;
  G[70] = a-346;
  G[71] = a-366;
  G[72] = a-366;

  float[] H = new float[73];
  for (int z=0; z < 73; z++)
  {
    H[z]= (b*G[z])/a;
  }

  float[] I = new float[73];
  for (int z=0; z < 73; z++)
  {
    I[z]= (H[z]-(((2*H[z])/cycle)*time))+E[z];
  }

  float[] J = new float[73];
  for (int z=0; z < 73; z++)
  {
    J[z]= sqrt( (sq(G[z]) * (sq(H[z])-sq(I[z]-E[z])))/sq(H[z]))+a;
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////Red_Buildings'_Shadow////07//
  beginShape();
  vertex(0, a);

  vertex(I[0], J[0]);
  vertex(I[1], J[1]);
  vertex(I[2], J[2]);
  vertex(I[3], J[3]);
  vertex(I[4], J[4]);
  vertex(I[5], J[5]);
  vertex(I[6], J[6]);
  vertex(I[7], J[7]);
  vertex(I[8], J[8]);
  vertex(I[9], J[9]);
  vertex(I[10], J[10]);
  vertex(I[11], J[11]);
  vertex(I[12], J[12]);
  vertex(I[13], J[13]);
  vertex(I[14], J[14]);
  vertex(I[15], J[15]);
  vertex(I[16], J[16]);
  vertex(I[17], J[17]);
  vertex(I[18], J[18]);
  vertex(I[19], J[19]);
  vertex(I[20], J[20]);
  vertex(I[21], J[21]);
  vertex(I[22], J[22]);
  vertex(I[23], J[23]);
  vertex(I[24], J[24]);
  vertex(I[25], J[25]);
  vertex(I[26], J[26]);
  vertex(I[27], J[27]);
  vertex(I[28], J[28]);
  vertex(I[29], J[29]);
  vertex(I[30], J[30]);
  vertex(I[31], J[31]);
  vertex(I[32], J[32]);
  vertex(I[33], J[33]);
  vertex(I[34], J[34]);
  vertex(I[35], J[35]);
  vertex(I[36], J[36]);
  vertex(I[37], J[37]);
  vertex(I[38], J[38]);
  vertex(I[39], J[39]);
  vertex(I[40], J[40]);
  vertex(I[41], J[41]);
  vertex(I[42], J[42]);
  vertex(I[43], J[43]);
  vertex(I[44], J[44]);
  vertex(I[45], J[45]);
  vertex(I[46], J[46]);
  vertex(I[47], J[47]);
  vertex(I[48], J[48]);
  vertex(I[49], J[49]);
  vertex(I[50], J[50]);
  vertex(I[51], J[51]);
  vertex(I[52], J[52]);
  vertex(I[53], J[53]);
  vertex(I[54], J[54]);
  vertex(I[55], J[55]);
  vertex(I[56], J[56]);
  vertex(I[57], J[57]);
  vertex(I[58], J[58]);
  vertex(I[59], J[59]);
  vertex(I[60], J[60]);
  vertex(I[61], J[61]);
  vertex(I[62], J[62]);
  vertex(I[63], J[63]);
  vertex(I[64], J[64]);
  vertex(I[65], J[65]);
  vertex(I[66], J[66]);
  vertex(I[67], J[67]);
  vertex(I[68], J[68]);
  vertex(I[69], J[69]);
  vertex(I[70], J[70]);
  vertex(I[71], J[71]);
  vertex(I[72], J[72]);

  vertex(width, a);
  endShape();

  popMatrix();
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TABLE_OF_CONTENTS//

//   T A B L E   O F   C O N T E N T S
//01 Sky_2
//02 Sky
//03 Sun
//04 Grass
//05 Red_Buildings
//06 Billboard
//07 Red_Buildings'_Shadow

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

