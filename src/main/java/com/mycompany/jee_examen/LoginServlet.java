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
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try (Connection conn = ConnexionDB.getConnection()) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");
                String prenom = rs.getString("prenom");
                if (BCrypt.checkpw(password, storedPassword)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("utilisateur", prenom);
                    response.sendRedirect("accueilAdmin.jsp");
                } else {
                    request.setAttribute("errorMessage", "Mot de passe incorrect");
                    request.getRequestDispatcher("auth.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Utilisateur non trouvé");
                request.getRequestDispatcher("auth.jsp").forward(request, response);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Connexion échouée");
        request.getRequestDispatcher("auth.jsp").forward(request, response);
    }
}
}