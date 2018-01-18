/*Simple perceptron 
//PARAM  = randomly generated weights, 
//METHOD = can make a guess by recieving all the inputs and summing them
*/


// the activation function
int sign(float n){
  if(n<=0){
    return -1;
  } else {
    return 1;
  }
}

class Perceptron{
  float[] weights = new float[2];
  float lr = 0.1;
  
  //constructors
  Perceptron(){
    for(int i = 0; i <weights.length; i++){
      weights[i] = random(-1,1);  
    }
  }
  // guess if point is -1 or 1
  int guess(float[] inputs){
    float sum = 0; 
    for(int i = 0; i <weights.length; i++){
      sum += inputs[i]*weights[i];
    }
    int output = sign(sum);
    return output;
  }
  // make guess, control with the known data 
  void train(float[] inputs, int target){
    int guess = guess(inputs);
    int error = target - guess;
    println("Error : "+error);
    
    for(int i = 0; i <weights.length; i++){
      weights[i] += error * inputs[i] * lr;
    }
  }
  //debug - print in cons. the weights value
  void logControl(){
    println("W0 : "+weights[0]+" || W1 : "+weights[1]);
    println();
  }
};