/*
the perceptron will guess if the point is under or above the line
a green spot is a right guess and a red one is a wrong guess
*/
// the training is made step by step by CLICKING THE MOUSE

Perceptron per;
Point[] points = new Point[400];


void setup(){
  size(1000,1000);
  per = new Perceptron();
  
  for(int i = 0; i<points.length; i++){  // init the known dataBase
    points[i] = new Point();
  }
}

void draw(){
  background(255);
  for (Point pt : points){              // draw the known dataBase
    pt.show(); 
  }
  line(0,0,width,height);
  
  for(Point pt : points ){              // update display
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    int guess = per.guess(inputs);
    
    if(guess == target){
      fill(0,255,0);
    } else {
      fill(255,0,0);
    }
    noStroke();
    ellipse(pt.x, pt.y, 8,8);
  }
}

void mousePressed(){                      // make a train step on mouse clicked
  for(Point pt : points ){                // click until everything is green -- the perceptron works !
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    per.train(inputs, target);
    per.logControl();
    }
}