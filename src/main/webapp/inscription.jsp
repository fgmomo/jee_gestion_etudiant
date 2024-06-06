<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Inscription</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style> 
      body{
             background-color:rgb(247, 247, 248);
      }
    .box {
        margin-top: 50px;
        border-radius: 10px;
        padding: 40px;
        background-color: rgba(255, 255, 255, 0.8);  
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        transition: box-shadow 0.3s ease;
    }

    .box:hover {
        box-shadow: 0 0 30px rgba(0, 0, 0, 0.7);
    }

    .form-control {
        margin-bottom: 15px; 
    }

    /* Style pour les boutons */
    .btn-custom {
        border-radius: 20px;
        background-color: #007bff;  
        border-color: #007bff;
        transition: background-color 0.3s ease, border-color 0.3s ease;
    }

    .btn-custom:hover {
        background-color: #0056b3; 
        border-color: #0056b3;
    }

    /* Style pour les liens */
    .link-custom {
        color: #007bff; 
        transition: color 0.3s ease;
    }

    .link-custom:hover {
        color: #0056b3;  
    }
</style>
</head>
<body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
       
        <a class="navbar-brand" href="#">
            <img src="R.jpg" alt="Logo" height="40">
        </a>
       
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
       
        <div class="collapse navbar-collapse" id="navbarNav">         
          
            <ul class="navbar-nav ms-auto">
              
                <li class="nav-item">
                    <a class="nav-link text-white" href="auth.jsp">Se Connecter</a>
                </li>
            </ul>
        </div>
    </div>
        </nav><br>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                           <img src="etu1.jpg" alt="Image" class="img-fluid" style="height: 100%;">
                        </div>
                        <div class="col-md-6">
                            <h2 class="text-center mb-4">Inscription</h2>
                            <% String successMessage = request.getParameter("message"); %>
                            <% if ("success".equals(successMessage)) { %>
                                <div class="alert alert-success" role="alert">
                                    Inscription effectuée avec succès.
                                </div>
                            <% } %>
                            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                            <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                                <div class="alert alert-danger" role="alert">
                                    <%= errorMessage %>
                                </div>
                            <% } %>
                            <form action="RegisterServlet" method="post" onsubmit="return validateForm();">
                                <div class="form-group">
                                    <label for="prenom">Prénom</label>
                                    <input type="text" class="form-control" value="<%= request.getAttribute("prenom") != null ? request.getAttribute("prenom") : "" %>" id="prenom" name="prenom" >
                                </div>
                                <div class="form-group">
                                    <label for="nom">Nom</label>
                                    <input type="text" class="form-control" value="<%= request.getAttribute("nom") != null ? request.getAttribute("nom") : "" %>" id="nom" name="nom" >
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" id="email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="password">Mot de passe</label>
                                    <input type="text" class="form-control" id="password" name="password"  >
                                </div>
                                <div class="form-group">
                                    <label for="Cpassword">Confirmer le mot de passe</label>
                                    <input type="text" class="form-control" id="Cpassword" name="cpassword" >
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">S'inscrire</button>
                                    <a href="auth.jsp" class="btn btn-link">Se connecter</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
        function validateForm() {
            let prenom = document.getElementById("prenom").value;
            let nom = document.getElementById("nom").value;
            let email = document.getElementById("email").value;
         
            let errorMessage = "";

            if (prenom === "" || nom === "" || email === "" ) {
                errorMessage += "Tous les champs sont obligatoires.\n";
            }

            let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                errorMessage += "L'email n'est pas valide.\n";
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
