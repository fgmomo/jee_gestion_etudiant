package com.mycompany.jee_examen;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AjoutEtudiantServlet")
public class AjoutEtudiantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prenom = request.getParameter("prenom");
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String telephone = request.getParameter("telephone");

        try (Connection conn = ConnexionDB.getConnection()) {
            // Vérifier si l'e-mail existe déjà
            String checkEmailSql = "SELECT * FROM etudiants WHERE email = ?";
            try (PreparedStatement checkEmailStmt = conn.prepareStatement(checkEmailSql)) {
                checkEmailStmt.setString(1, email);
                try (ResultSet rs = checkEmailStmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("errorMessage", "L'email existe déjà.");
                        request.getRequestDispatcher("ajoutEtudiant.jsp").forward(request, response);
                        return; // Arrête l'exécution de la servlet
                    }
                }
            }

            // Vérifier si le numéro de téléphone existe déjà
            String checkPhoneSql = "SELECT * FROM etudiants WHERE telephone = ?";
            try (PreparedStatement checkPhoneStmt = conn.prepareStatement(checkPhoneSql)) {
                checkPhoneStmt.setString(1, telephone);
                try (ResultSet rs = checkPhoneStmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("errorMessage", "Le numéro de téléphone existe déjà.");
                        request.getRequestDispatcher("ajoutEtudiant.jsp").forward(request, response);
                        return; // Arrête l'exécution de la servlet
                    }
                }
            }

            // Insertion de l'étudiant
            String sql = "INSERT INTO etudiants (prenom, nom, email, adresse, telephone) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1, prenom);
                statement.setString(2, nom);
                statement.setString(3, email);
                statement.setString(4, adresse);
                statement.setString(5, telephone);
                statement.executeUpdate();
                response.sendRedirect("listeEtudiant.jsp?successMessage=Etudiant ajoute avec succes");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Erreur lors de l'ajout de l'étudiant.");
            request.getRequestDispatcher("ajoutEtudiant.jsp").forward(request, response);
        }
    }
}
