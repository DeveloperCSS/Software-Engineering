<%-- 
    Document   : index
    Created on : 12-Mar-2018, 10:50:14
    Author     : znu16qvu
--%>

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


    <body onload="displayResults()">

        <h1>Health Tracker</h1>
        <form action="diet.jsp">
            <input type="submit" value="Diet" />
        </form>

        <%!
            public class insertMeals {

                String URL = "jdbc:postgresql://127.0.0.1/studentdb";
                String USERNAME = "student";
                String PASSWORD = "dbpassword";

                Connection connection = null;
                PreparedStatement insertMeals = null;
                ResultSet resultset = null;

                public insertMeals() {

                    try {

                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertMeals = connection.prepareStatement("INSERT INTO mealTypes(mealName, mealType, calorieAmount) VALUES(?, ?, ?)");

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public int setMeals(String mealname, String mealtype, int cal) {
                    int result = 0;
                    try {
                        insertMeals.setString(1, mealname);
                        insertMeals.setString(2, mealtype);
                        insertMeals.setInt(3, cal);

                        result = insertMeals.executeUpdate();

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                    return result;

                }
            }
        %>

        <%
            int result = 0;

            if(request.getParameter("submit") != null) {
            
            String mealName = new String();
            String mealType = new String();
            int cal = 0;
            
            
            
            if (request.getParameter("mealName") != null) {
                mealName = request.getParameter("mealName");
            }

            if (request.getParameter("mealType") != null) {
                mealType = request.getParameter("mealType");
            }
            
            if(request.getParameter("calorieAmount") != null){
                cal = Integer.parseInt(request.getParameter("calorieAmount"));
            } else {cal = 0;}
            

            insertMeals meals = new insertMeals();
            result = meals.setMeals(mealName, mealType, cal);
            }
        %>


        <h1>Inserting data into db</h1>
        <form name="insertionDietForm" action="index.jsp" method="POST">
            <table border="0">

                <tbody>
                    <tr>
                        <td>Meal Name :</td>
                        <td><input type="text" name="mealName" value="" size="25" /></td>
                    </tr>
                    <tr>
                        <td>Meal Type :</td>
                <select name="mealType">
                    <option>Fruit/Veg</option>
                    <option>Carbs</option>
                    <option>Protein</option>
                    <option>Milk/Dairy</option>
                    <option>Fat/Sugar</option>
                </select>

                    </tr>
                    <tr>
                        <td>Calories : </td>
                        <td><input type="text" name="calorieAmount" value="" size="25" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="hidden" name="hidden" value="<%= result%>" />
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>

            <script language="JavaScript">
            function displayResults() 
            {
                if(document.insertionDietForm.hidden.value == 1) {
                    alert("Meal Inserted!");
                }
            }
            </script>
    </body>
</html>
