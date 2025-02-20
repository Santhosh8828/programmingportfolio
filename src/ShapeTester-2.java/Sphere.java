//Creating a Java class
class Sphere {
  // Declaring and initializing the attributes
  double r;
  
  //Constrcutor
  Sphere(double r) {
      this.r = r;
  }

  // methods to set breed, age, and color of the dog
  public double calcVolSphere() {
    double vol = (4.0/3.0) * Math.PI * (r * r * r );
    return vol;
  }
  public double calSurfAreaSphere() {
    // calculate surface area 
    double sa = 4 * Math.PI * ( r * r );
    return sa;
  }
}