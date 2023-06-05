import 'dart:math';

// create a 'RandomData' class which can be accessed in a static method
class RandomData {
  // create a static method which returns a random 32-bit integer
  int getRandom32Bits() {
    // create a random number generator
    var rng = Random();
    // generate a random 32-bit integer
    var randomNumber = rng.nextInt(4294967296);
    // return the random number
    return randomNumber;
  }
}
