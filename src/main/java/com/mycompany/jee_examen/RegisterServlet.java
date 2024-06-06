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
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prenom = request.getParameter("prenom");
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");

        // 
        if (!password.equals(cpassword)) {
            request.setAttribute("errorMessage", "Les mots de passe ne correspondent pas.");
            request.setAttribute("prenom", prenom);
            request.setAttribute("nom", nom);
            request.setAttribute("email", email);
            request.getRequestDispatcher("inscription.jsp").forward(request, response);
            return; 
        }

        try (Connection conn = ConnexionDB.getConnection()) {
            
            String checkEmailSql = "SELECT * FROM users WHERE email = ?";
            try (PreparedStatement checkEmailStmt = conn.prepareStatement(checkEmailSql)) {
                checkEmailStmt.setString(1, email);
                try (ResultSet rs = checkEmailStmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("errorMessage", "Cet email est déjà utilisé.");
                        request.setAttribute("prenom", prenom);
                        request.setAttribute("nom", nom);
                        request.setAttribute("email", email);
                        request.getRequestDispatcher("inscription.jsp").forward(request, response);
                        return; 
                    }
                }
            }

          
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

           
            String sql = "INSERT INTO users (prenom, nom, email, password) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1, prenom);
                statement.setString(2, nom);
                statement.setString(3, email);
                statement.setString(4, hashedPassword);
                statement.executeUpdate();
                response.sendRedirect("inscription.jsp?message=success");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Inscription échouée. Veuillez réessayer plus tard.");
            request.setAttribute("prenom", prenom);
            request.setAttribute("nom", nom);
            request.setAttribute("email", email);
            request.getRequestDispatcher("inscription.jsp").forward(request, response);
        }
    }
}
