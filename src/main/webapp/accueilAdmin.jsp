<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<%@page import="com.mycompany.jee_examen.ConnexionDB"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Accueil Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .welcome-box {
            padding: 40px;
            background-color: #ffffff;
            color: #343a40;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .welcome-box h1 {
            font-size: 36px;
        }
        .dashboard {
            margin-top: 30px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .card-title {
            font-size: 24px;
        }
        .card-text {
            font-size: 20px;
            font-weight: bold;
        }
        .btn-primary, .btn-info, .btn-success {
            background-color: #007bff;
            border-color: #007bff;
            color: #ffffff;
        }
        .btn-primary:hover, .btn-info:hover, .btn-success:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
     <%@ include file="navbar.jsp" %>
    <%
        String utilisateur = (String) session.getAttribute("utilisateur");
        int totalEtudiants = 0;
        int totalUsers = 0;

        try (Connection conn = ConnexionDB.getConnection()) {
            String etudiantsQuery = "SELECT COUNT(*) AS total FROM etudiants";
            String usersQuery = "SELECT COUNT(*) AS total FROM users";

            try (PreparedStatement etudiantsStmt = conn.prepareStatement(etudiantsQuery);
                 PreparedStatement usersStmt = conn.prepareStatement(usersQuery)) {

                ResultSet etudiantsRs = etudiantsStmt.executeQuery();
                if (etudiantsRs.next()) {
                    totalEtudiants = etudiantsRs.getInt("total");
                }

                ResultSet usersRs = usersStmt.executeQuery();
                if (usersRs.next()) {
                    totalUsers = usersRs.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

    <div class="container">
        <div class="welcome-box text-center">
            <h1>Bienvenue, <%= utilisateur %></h1>
            <h3><a href="listeEtudiant.jsp" class="btn btn-primary">Consulter la liste des étudiants</a></h3>
        </div>
        <div class="dashboard text-center">
            <h2>Tableau de bord</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="card text-bg-light mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Total des utilisateurs</h5>
                            <p class="card-text"><%= totalUsers %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card text-bg-light mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Total des étudiants</h5>
                            <p class="card-text"><%= totalEtudiants %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+BYyPsK+j+UhjDmg0uwH6+12mFBOz" crossorigin="anonymous"></script>
</body>
</html>
