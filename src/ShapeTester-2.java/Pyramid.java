//Creating a Java class
class Pyramid {
  // Declaring and initializing the attributes
  double l;
  double w;
  double h;
  //Constrcutor
  Pyramid(double l, double w, double h) {
      this.l = l;
      this.w = w;
      this.h = h;
  }

  // methods to set breed, age, and color of the dog
  public double calcVolPyramid() {
    double vol = (l * w * h) * (1.0/3);
    return vol;
  }
  public double calSurfAreaPyramid() {
    // calculate surface area 
  double sa = (l * w) + (l * Math.sqrt(Math.pow(w / 2.0, 2) + Math.pow(h, 2))) + (w * Math.sqrt(Math.pow(l / 2.0, 2) + Math.pow(h, 2)));
    return sa;
  }
}