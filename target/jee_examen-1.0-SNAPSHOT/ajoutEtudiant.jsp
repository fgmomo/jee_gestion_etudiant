<%-- 
    Document   : ajoutEtudiant
    Created on : 31 mai 2024, 15:35:20
    Author     : Mohamed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
             <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <title>JSP Page</title>
    </head>
   <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }

        .form-container {
            max-width: 500px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .btn-submit {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
 <%@ include file="navbar.jsp" %>
 <br>
<div class="container">
    <div class="form-container">
        <h2>Ajouter un étudiant</h2>
     <% String errorMessage = (String) request.getAttribute("errorMessage");
   if (errorMessage != null && !errorMessage.isEmpty()) { %>
    <div class="alert alert-danger" role="alert">
        <%= errorMessage %>
    </div>
<% } %>
        <form action="AjoutEtudiantServlet" method="post"  onsubmit="return validateForm();">
            <div class="mb-3">
                <label for="prenom" class="form-label">Prénom</label>
                <input type="text" id="prenom" name="prenom" class="form-control">
            </div>
            <div class="mb-3">
                <label for="nom" class="form-label">Nom</label>
                <input type="text" id="nom" name="nom" class="form-control">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control" >
            </div>
            <div class="mb-3">
                <label for="adresse" class="form-label">Adresse</label>
                <input type="text" id="adresse" name="adresse" class="form-control" >
            </div>
            <div class="mb-3">
                <label for="telephone" class="form-label">Téléphone</label>
                <input type="text" id="telephone" name="telephone" class="form-control">
            </div>
            <button type="submit" class="btn btn-submit">Ajouter</button>
        </form>
    </div>
</div>
<script>
        function validateForm() {
            let prenom = document.getElementById("prenom").value;
            let nom = document.getElementById("nom").value;
            let email = document.getElementById("email").value;
            let adresse = document.getElementById("adresse").value;
            let telephone = document.getElementById("telephone").value;
            let errorMessage = "";

            if (prenom === "" || nom === "" || email === "" || adresse === "" || telephone === "") {
                errorMessage += "Tous les champs sont obligatoires.\n";
            }

            let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                errorMessage += "L'email n'est pas valide.\n";
            }

            let phonePattern = /^\d{8}$/;
            if (!phonePattern.test(telephone)) {
                errorMessage += "Le téléphone doit contenir exactement 8 chiffres.\n";
            }

            if (errorMessage !== "") {
                alert(errorMessage);
                return false;
            }

            return true;
        }
    </script>
</body>
 
</html>
