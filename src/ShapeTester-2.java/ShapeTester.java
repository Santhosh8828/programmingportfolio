import java.util.Scanner;
public class ShapeTester
{
    public static void main(String[] args)
    {
        boolean play = true;
        Scanner scanner = new Scanner(System.in);
        //while loop so that if user inputs yes to make another shape it can put all information again to do so.
        while(true){
        // Welcomes user, and asks options on what shape they want to find volume and surface area in.
        
            System.out.println("Welcome to shape maker! Lets find the volume and surface area for a few shapes....");
            System.out.println("To build a box, press 1 \nTo build a sphere press 2 \nTo build a pyramid, press 3 \nTo build a Cone, press 4");
        // This makes it so that they cannot input any symbols, characters, letters.
        
        if(!scanner.hasNextDouble()){
            System.out.println("No! Only options 1 - 4 is allowed no letters, symbols, special characters: ");
            return;
        }
        double ShapeStyle = scanner.nextDouble();
        // can't input any number above 3 or less than 1 when choosing a shape.
        
        if(ShapeStyle <= 0 || ShapeStyle >= 5){
             System.out.println("Not allowed!, only numbers in the range, 1 - 4: ");
             return;
         }
        //if checks if user pressed one and asks the length width and height of the box and lastly does calculations accordingly for surface area and volume.
        if(ShapeStyle == 1){
            System.out.println("Great! Let's start with a box. Please enter the length of a box: ");
            
            double length = scanner.nextDouble();
            System.out.println("Now enter the width of your box: ");

            double width = scanner.nextDouble();
            System.out.println("Lastly now enter the height of your box: ");
            
            double height = scanner.nextDouble();
            
            Box b1 = new Box(length,width,height);
            System.out.println("Box Volume: " + b1.calcVol());
            System.out.println("Box surface area: " + b1.calSurfArea());
        } 
        //esle if checks if user pressed two and asks the radius of the sphere and lastly does calculations accordingly for surface area and volume.

        else if(ShapeStyle == 2){
            System.out.println("Great! Lets start with a shpere. Please enter the radius of the sphere you are making");
            
            double radius = scanner.nextDouble();
            
            Sphere b2 = new Sphere(radius);
            System.out.println("Sphere volume: " + b2.calcVolSphere());
            System.out.println("Sphere surface area: " + b2.calSurfAreaSphere());
        }
        //second else if checks if user pressed three and asks the length, width and height of the pyramid and prints the sum of volume and surface area using the calculations accordingly.

        else if(ShapeStyle == 3){
            System.out.println("Great! Let's start with a pyramid. Please enter the length of the pyramid you want to make");
            double Pylength = scanner.nextDouble();
            System.out.println("Now eneter your width of the pyramid you want to make");
            double Pywidth = scanner.nextDouble();
            System.out.println("Lastly now enter the height of the pyramid");
            double Pyheight = scanner.nextDouble();
            Pyramid b3 = new Pyramid(Pylength,Pywidth,Pyheight);
            System.out.println("Pyramid Volume: " + b3.calcVolPyramid());
            System.out.println("Pyramid surface area: " + b3.calSurfAreaPyramid());
        

         }
         else if(ShapeStyle == 4){
            System.out.println("Great! Let's start with a cone. Please enter the radius of the cone you want to make: ");
            double coneRadius = scanner.nextDouble();
            System.out.println("Now eneter the height of the cone you want to make: ");
            double coneHeight = scanner.nextDouble();
            Cone b4 = new Cone(coneRadius,coneHeight);
            System.out.println("Cone Volume: " + b4.calcVolCone());
            System.out.println("Cone Surface Area: " + b4.calSurfAreaCone());
         }
         // checks to see if the user wants to build another shape.
         
         System.out.println("Press 10 to build a shape and press 11 to leave the application: ");
         
         // checks if the input is letters, special charcaters, or symbols
         if(!scanner.hasNextInt()){
            System.out.println("No letters, symbols, or special characters allowed! Only numbers 10 and 11 are allowed.");
            break;
            
         }
         // if user inputs ten then the program runs again and user can make another shape.
         int doAgain = scanner.nextInt();
        if(doAgain == 10){
            play = true;
        }
        // if user inputs 11 then program ends.
        else if (doAgain == 11){
            System.out.println("Goodbye!");
            play = false;
            break;
        }
        // checks to see if number input is greater than 12 or less than 9.
        else if(doAgain >= 12 || doAgain <= 9){
            System.out.println("Out of range! Only numbers 10 and 11 are allowed.");
            break;
        }
        }
         }

}