/*
@Kuko Visuals
	Don't waits you time. Time is limited, each year we have 365 to have fun in this life are you having fun what are you doing

	1. 23,725 days from day born - retired
	2. 365 days a year
	3. 24:59:59 hours to do something each day

*/

PFont dig, dig2;
Grid gr;	
int r = 75;

void setup() {
	fullScreen();
	//size(1000, 800);
	background(0);
	dig 	= createFont("AndaleMono-48.vlw", 28);
	dig2 	= createFont("AndaleMono-48.vlw", 165);
  gr 		= new Grid();
  smooth();
}


void draw(){
	//background(0);
	fill(0,5);
	rect(-10, -10, width+20, height+20);
	
	//____________ Day Month Year ______________________
	int d 	= day();   
	int m 	= month(); 
	int yar = year();   
	String day 		= nf(d, 2);
	String month 	= nf(m, 2);

	//___________ Time Minutes Seconds ________________
	int hr 	= hour();   
	int mn 	= minute();
	int sc 	= second();  
	String hour 		= nf(hr, 2);
	String minutes 	= nf(mn, 2);
	String seconds 	= nf(sc, 2);
	int mil 	= millis();	
	int milz 	= mil/20 % 250;
	//float mil2 	= mil % 400; //40 % 90
	float mil2 	= mil/40 % 90;
	int secondsInt = Integer.parseInt(seconds.trim());
  
  //_________Objects______________________

	gr.update(secondsInt, milz,mil2);
	//gr.updateMobile();
	gr.time(hour, minutes, seconds,month, day, yar);

	//________ lines ________________________
 	float alpha = 0.0;

 	strokeWeight(5);
 	float x1 = r * cos(alpha);
 	float y1 = r * sin(alpha);

	float	x = width/7;
	float	y = height/4;

  line(0, milz, x, milz);
  line(x*2, milz+y1, x*3,milz+y1);  
  line(x*4, milz+y1, x*5,milz+y1);  
  line(x*6, milz+y1, x*7,milz+y1);  

  line(0, milz+y, x, milz+y);
  //line(x*2, milz+y1+y, x*3,milz+y1+y);  
  //line(x*4, milz+y1+y, x*5,milz+y1+y);  
  line(x*6, milz+y1+y, x*7,milz+y1+y);

  line(0, milz+(y*2), x, milz+(y*2) );
  line(x*2, milz+y1+ (y*2), x*3,milz+y1+ (y*2));  
  line(x*4, milz+y1+ (y*2), x*5,milz+y1+ (y*2));  
  line(x*6, milz+y1+ (y*2), x*7,milz+y1+ (y*2));

  line(0, milz+(y*3), x, milz+(y*3));
  line(x*2, milz+y1+ (y*3), x*3,milz+y1+ (y*3) );  
  line(x*4, milz+y1+ (y*3), x*5,milz+y1+ (y*3) );  
  line(x*6, milz+y1+ (y*3), x*7,milz+y1+ (y*3) );
	alpha += 0.01;

	//______________ Up Grid ________________
  line(x  , -1*milz, x*2, -1*milz);
  line(x*3  , -1*milz, x*4, -1*milz);

}

class Grid {
	float x, y;

	int margin = 200;
	int paddingTop = 30;
	// Time Baby 

	Grid(){
		noFill();
		stroke(255);
	}

	void update(int ss, int mil, float mil2){
		x = width/7;
		y = height/4;
		ellipseMode(CORNER);
	  for (int i = 0; i < width+x; i += x) {
	  	for (int j = 0; j < height+y; j+= y) {
				/*
				strokeWeight(1);
			  rect(i, j, x, y);	
		  	ellipse(i, j, x, y);	
			 	line(ss+mil+j, 0, ss+mil+j, y);
			 	strokeWeight(5);
			  line(0, ss+mil2, i, ss+mil2);
			  */
	  	}
	  }
	}

	void updateMobile(){
		x = width/7;
		y = height/4;
		ellipseMode(CORNER);
	  for (int i = 0; i < width+x; i += x) {
	  	for (int j = 0; j < height+y; j+= y) {
		  	rect(i, j+20, x, y-20);	
	  	}
	  }
	}

	void time(String hour, String minutes,String ss, String m, String d, int yar){	
	// _______ Text Design ___________________
		textFont(dig);
	  textAlign(CENTER, CENTER);
		fill(255);
		int move = 60;
	  text(m+"|"+d+"|"+yar, width/2-margin-move, height/2+10);
	  text("001  -  365", width/2+margin+move, height/2+10);
	  //text("29  -  65", width/2, height/2+30);
		textFont(dig2);
	  text(hour+":"+minutes+":"+ss, width/2, height/2-100);
	}
}

