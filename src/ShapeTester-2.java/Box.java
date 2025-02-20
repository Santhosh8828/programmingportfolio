//Creating a Java class
class Box {
  // Declaring and initializing the attributes
  double l;
  double w;
  double h;
  
  //Constrcutor
  Box(double l, double w, double h) {
      this.l = l;
      this.w = w;
      this.h = h;
  }

  // methods to set breed, age, and color of the dog
  public double calcVol() {
    double vol = l * w * h;
    return vol;
  }
  public double calSurfArea() {
    double sa = 2 * (l*w) + 2 * (l*h) + 2 * (h*w);
    return sa;
  }
}