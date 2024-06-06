package com.mycompany.jee_examen;
import com.mycompany.jee_examen.ConnexionDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ModifierEtudiantServlet")
public class ModifierEtudiantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String prenom = request.getParameter("prenom");
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String telephone = request.getParameter("telephone");

        try (Connection conn = ConnexionDB.getConnection()) {
            String sql = "UPDATE etudiants SET prenom = ?, nom = ?, email = ?, adresse = ?, telephone = ? WHERE id = ?";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1, prenom);
                statement.setString(2, nom);
                statement.setString(3, email);
                statement.setString(4, adresse);
                statement.setString(5, telephone);
                statement.setInt(6, id);
                statement.executeUpdate();
                response.sendRedirect("listeEtudiant.jsp?successMessage=Etudiant modifie avec succes");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Échec de la modification de l'étudiant");
        }
    }
}
