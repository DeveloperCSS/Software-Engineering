package healthtracker;

import java.util.ArrayList;

/**
 * Class for outlining a diet. Will relate back to a user via a userId so said
 * user can define a set diet for themselves.
 *
 * @author James Clarke - bvr16rcu@uea.ac.uk // jamesmichaelclarke@hotmail.co.uk
 * @author Isadora Platoni -  
 * @author George Storry - 
 * @author Lucasz Zbozen - 
 */
public class Diet {
    private int calorieCount;
    public mealDietType mealType;
    public ArrayList<String> mealsArray;

    public Diet(int calorieCount, ArrayList<String> mealsArray, mealDietType mealType) {
        this.calorieCount = calorieCount;
        this.mealsArray = mealsArray;
        this.mealType = mealType;
    }
    
    // Variables for an enum
    mealDietType mealtype;

    

    /**
     * enum defining a mealType, categorised by the five food groups, 
     */
    public enum mealDietType{
        FRUITVEG(1), CARBS(2), PROTEIN(3), MILKDAIRY(4), FATSUGAR(5);
        
        // Value variable for a mealType
        private final int mealValue;
        
        /*
        Constructor method for suit enum e.g. Carbs=2
        */
        mealDietType(int i) {
            this.mealValue = i;
        }
        
        // Accessor method to return Suit number of the mealType object
        public int getMeal() {
            return this.mealValue;
        }
    }
    
    // Class Constructor with mealType passed as arguments
    Diet(mealDietType mealType) {
        this.mealtype = mealType;
    }

    public int getCalorieCount() {
        return calorieCount;
    }

    public ArrayList<String> getmealsArray() {
        return mealsArray;
    }

    public void setCalorieCount(int calorieCount) {
        this.calorieCount = calorieCount;
    }

    public void setmealsArray(ArrayList<String> mealsArray) {
        this.mealsArray = mealsArray;
    }

    public void setMealType(mealDietType mealType) {
        this.mealType = mealType;
    }
    
//    // toString method for the class Diet
//    @Override
//    public String toString() {
//        StringBuilder str = new StringBuilder();
//        
//        str.append(mealsArray).append(" is ").append(mealType)
//                .append(" with ").append(calorieCount + " calories");
//        
//        return str.toString();
//    }
    
}
