package clases;

/**
 *
 * @author Change Gate 
 */
public class cifrador {
    private String key = "Becca<3";
    
    public String cifrar(String input){
        String output="";
        int length = input.length();
        int counter1 = 0;
        int counter2 = 0;
        char auxChar;
        
        while (counter2 < length) {
            auxChar = input.charAt(counter1);
            auxChar = (char) (((int) (auxChar) + (int) (key.charAt(counter1))) % 128);
            output += auxChar;
            counter1 = counter1++ % key.length();
            counter2 = counter2++;
        }
        System.out.println(input + " " + output);
        return output;
    }
/*
    public String descifrar(String input){
        String output="";
        int length = input.length();
        int counter1 = 0;
        int counter2 = 0;
        char auxChar;
        
        while (counter2 < length) {
            auxChar = input.charAt(counter1);
            
            if (((int) (auxChar) - (int) (key.charAt(counter1))) < 0) {
                auxChar = (char) (128 + ((int) ((auxChar) - (int) (key.charAt(counter1))) % 128));
            } else {
                auxChar = (char) (((int) (auxChar) - (int) (key.charAt(counter1))));
            }
            output += auxChar;
            counter1 = counter1++ % key.length();
            counter2 = counter2++;
        }
        System.out.println(input + " " + output);
        return output;
    }
*/ 
    
}
