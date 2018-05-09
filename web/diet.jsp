<%-- 
    Document   : diet
    Created on : 12-Mar-2018, 15:22:18
    Author     : znu16qvu
--%>


<%@page import="healthtracker.Diet.mealDietType"%>
<%@page import="healthtracker.Diet"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%
    Class.forName("org.postgresql.Driver");
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diet</title>
    </head>


    <body>
        <h1>Diet</h1>

        <h2>Select a meal</h2>
        <%
            // Declare arraylist for meal name, pass enum from diet.java 
            ArrayList<String> mealsArray = new ArrayList();

            mealsArray.add("Banana.");
            mealsArray.add("Beef.");
            mealsArray.add("Eggs.");
            mealsArray.add("Cheese.");
            mealsArray.add("Chocolate.");

            List<mealDietType> list = Arrays.asList(mealDietType.values());

//            for (int i = 0; i < list.size(); i++) {
//                out.println(list.get(i));
//            }
            // Declare arraylist for calories of the default meals
            ArrayList<Integer> caloriesArray = new ArrayList();
            caloriesArray.add(95);
            caloriesArray.add(188);
            caloriesArray.add(155);
            caloriesArray.add(461);
            caloriesArray.add(530);

        %>

        <%--Select and confirm selection from drop down list--%>
        <form name="selectMeal" method="get" action="#">
            <select name="mealArrays">
                <%  for (int i = 0; i < mealsArray.size(); i++) {
                        String option = (String) mealsArray.get(i);
                %>

                <%
                    int cal = (int) caloriesArray.get(i);
                %>

                <option value="<%= option%> 
                        <% out.println("Meal Type : " + list.get(i));%>
                        <% out.println("Calories amount : " + cal
                                    + " per 100g");%>
                        ">

                    <%= option%></option>
                    <% } %>


            </select>

            <input type="submit" name="submit" value="Select Meal"/>

        </form>

        <%-- To display selected item from dropdown list. --%>
        <%
            String food = request.getParameter("mealArrays");

            if (food != null) {
                out.println("Selected meal is : " + food + ".");

            }
        %>


        <h2>Add custom meal</h2>




        <form name="customMealsForm" action="diet.jsp" method="POST">

            <table border="0">
                <tbody>
                    <tr>
                        <td>Meal : </td>
                        <td><input type="text" name="mealName" value="" size="25" /></td>
                    </tr>


                    <tr>
                        <td>Meal Type : </td>
                        <td><select name="mealType">
                                <option>Fruit/Veg</option>
                                <option>Carbs</option>
                                <option>Protein</option>
                                <option>Milk/Dairy</option>
                                <option>Fat/Sugar</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Calories : </td>
                        <td><input type="text" name="calorieAmount" value="" size="25" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submitMeal" />
        </form>

        <%!
            public class mealTypes {

                String URL = "jdbc:postgresql://127.0.0.1/studentdb";
                String USERNAME = "student";
                String PASSWORD = "dbpassword";

                Connection connection = null;
                PreparedStatement selectMeals = null;
                ResultSet resultset = null;

                public mealTypes() {
                    try {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        selectMeals = connection.prepareStatement("SELECT mealName, mealType, calorieAmount FROM mealTypes");

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet getMeals() {

                    try {

                        resultset = selectMeals.executeQuery();

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultset;
                }
            }
        %>
        <%
            mealTypes mealtypes = new mealTypes();
            ResultSet diet = mealtypes.getMeals();
        %>

        <h2>Custom meals list</h2>
        <table border="1">

            <tbody>
                <tr>
                    <td>Meal Name</td>
                    <td>Meal Type</td>
                    <td>Calories</td>
                </tr>
                <% while (diet.next()) {%>
                <tr>
                    <td><%= diet.getString("mealName")%></td>
                    <td><%= diet.getString("mealType")%></td>
                    <td><%= diet.getInt("calorieAmount")%></td>
                </tr>
                <% }%>
            </tbody>
        </table>


    </body>
</html>
