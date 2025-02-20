//Creating a Java class
class Cone {
  // Declaring and initializing the attributes
  double r;
  double h;
  
  //Constrcutor
  Cone(double r, double h) {
      this.r = r;
      this.h = h;
  }

  // methods to set breed, age, and color of the dog
  public double calcVolCone() {
    double vol = 1.0/3.0 * Math.PI * (r * r) * h;
    return vol;
  }
  public double calSurfAreaCone() {
    // calculate surface area 
    double sa = Math.PI * r * (r + Math.sqrt(Math.pow(h, 2) + Math.pow(r, 2)));
    return sa;
  }
}