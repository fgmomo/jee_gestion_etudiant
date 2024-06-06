<%-- 
    Document   : listeEtudiant
    Created on : 31 mai 2024, 15:29:34
    Author     : Mohamed
--%>

<%@page import="com.mycompany.jee_examen.ConnexionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Liste des étudiants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .navbar {
            background-color: #343a40;
            color: white;
        }
        .navbar-brand {
            color: white !important;
        }
        .navbar-nav .nav-link {
            color: white !important;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<br>
<div class="container">
    <% String successMessage = (String) request.getParameter("successMessage");
    if (successMessage != null && !successMessage.isEmpty()) { %>
        <div class="alert alert-success" role="alert">
            <%= successMessage %>
        </div>
    <% } %>
    <h2 class="mt-3 mb-4">Liste des étudiants</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Prénom</th>
            <th scope="col">Nom</th>
            <th scope="col">Email</th>
            <th scope="col">Adresse</th>
            <th scope="col">Téléphone</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <% 
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = ConnexionDB.getConnection();
            String sql = "SELECT * FROM etudiants";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String prenom = rs.getString("prenom");
                String nom = rs.getString("nom");
                String email = rs.getString("email");
                String adresse = rs.getString("adresse");
                String telephone = rs.getString("telephone");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= prenom %></td>
            <td><%= nom %></td>
            <td><%= email %></td>
            <td><%= adresse %></td>
            <td><%= telephone %></td>
            <td>
                <a href="modifierEtudiant.jsp?id=<%= id %>" class="btn btn-primary btn-sm">Modifier</a>
                <a href="SupprimerEtudiantServlet?id=<%= id %>" class="btn btn-danger btn-sm">Supprimer</a>
            </td>
        </tr>
        <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        %>
        </tbody>
    </table>
    <a href="ajoutEtudiant.jsp" class="btn btn-success">Ajouter un étudiant</a>
</div>
</body>
</html>
