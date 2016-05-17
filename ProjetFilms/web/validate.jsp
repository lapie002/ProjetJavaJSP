<%-- 
    Document   : validate
    Created on : Apr 5, 2016, 12:11:56 PM
    Author     : Bruno
--%>

<%@ page import ="java.sql.*" %>
<%
    try{
            //Connecter la base de données
            String prenomabonne = request.getParameter("prenomabonne");   
            String mdpabonne = request.getParameter("mdpabonne");
            String abonnecheck = "checked";
            Class.forName("com.mysql.jdbc.Driver");
            String bdurl = "jdbc:mysql://localhost:3306/projet_jsp?zeroDateTimeBehavior=convertToNull";
            java.sql.Connection c = java.sql.DriverManager.getConnection(bdurl, "root","");
            java.sql.Statement s = c.createStatement();
            
            
            //collecter les données dans la BD
            String sql = "Select prenomabonne, mdpabonne from abonne where ";
            sql += " prenomabonne = '" + prenomabonne+"'";
            sql += " and mdpabonne = '" + mdpabonne+"'";
            sql += " and abonnecheck = '" + abonnecheck+"'";
          
            out.println(sql);
            
            java.sql.ResultSet rs;
            rs = s.executeQuery(sql);
            
            if(rs.first())           
            {
                out.println("Valid login credentials");
            }       
            else
            {
                out.println("Invalid login credentials");  
            }
            
            //Fermer la connexion
            rs.close();
            s.close();
            c.close();   
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }        
%>
