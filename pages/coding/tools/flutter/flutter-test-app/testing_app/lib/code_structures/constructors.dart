class Thing {
  double wotsit = 1;

  Thing();
}

class Thing2 {
  double wotsit = 2;
  
  Thing2(bool addTen) {
    wotsit = addTen ? wotsit + 10 : wotsit; 
  }
}

class Thing3x {
  // Initializer list of variables and values
  double x = 2.0;
  double y = 2.0;

  // Generative constructor with initializing formal parameters.
  // Sets the x and y instance variables
  // before the constructor body runs.
  Thing3x(this.x, this.y);
}

class Thing3 {
  double wotsit;

  // Generative constructor with initializing formal parameter.
  // Needs to have the same name as the class.
  // Doesn't have to have a body.
  Thing3(this.wotsit);
}

class Thing4 {
  double wotsit;
  
  // Sets the wotsit instance variable before the constructor body runs.
  Thing4(this.wotsit, bool addTen) {
    wotsit = addTen ? wotsit + 10 : wotsit; // wotsit will be initialised to the value passed in, THEN potentially amended further
  }
}

double wotsup = 10;

class Thing6 {
  double wotsit = 10;

  Thing6();

  Thing6.plusTen() {
    wotsit = wotsit + 10;
  }

  Thing6.minusFive() {
    wotsit = wotsit - 5;
  }
}

class Thing5 {
  double x;
  double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  Thing5()
    : x = 10.0,
      y = 11.0 {
        print ("Hello");
      }

  // Initializing formal parameters can also be optional positional.
  Thing5.optionalPositional([this.x = 0.0, this.y = 0.0]);

  // Initializing formal parameters can also be named.
  Thing5.named({this.x = 0.0, this.y = 0.0});

  // Initializing formal parameters can also be named and required.
  Thing5.requiredNamed({required this.x, required this.y});
}
