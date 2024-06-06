<%-- 
    Document   : auth
    Created on : 29 mai 2024, 11:51:58
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
      .box {
            margin-top: 50px;
            border-radius: 10px;
            padding: 40px;
          background-color: #f8f9fa;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            transition: box-shadow 0.3s ease;
        }

        .box:hover {
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.7);
        }

        /* Style pour les champs de saisie */
        .form-control {
           
            margin-bottom: 15px; /* Espace entre les champs */
        }

        /* Style pour les boutons */
      .btn-custom {
            border-radius: 5px;
            background-color: #6c757d; 
            border-color: #6c757d;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }


        .btn-custom:hover {
            background-color: #495057; /* Couleur de bouton au survol */
            border-color: #495057;
        }

        /* Style pour les liens */
        .link-custom {
            color: #6c757d; /* Couleur de lien */
            transition: color 0.3s ease;
        }

        .link-custom:hover {
            color: #495057; /* Couleur de lien au survol */
        }
     
   </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
       
        <a class="navbar-brand" href="#">
            <img src="R.jpg" alt="Logo" height="30">
        </a>
       
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
       
        <div class="collapse navbar-collapse" id="navbarNav">         
          
            <ul class="navbar-nav ms-auto">
              
                <li class="nav-item">
                    <a class="nav-link text-white" href="inscription.jsp">S'inscrire</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="box">
                     <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                        <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= errorMessage %>
                            </div>
                        <% } %>
                    <h2 class="text-center mb-4  ">Connexion</h2>
                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Email" name="email"  >
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Mot de passe" name="password" >
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Se connecter</button>
                            <a href="inscription.jsp" class="btn btn-link">S'inscrire</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
