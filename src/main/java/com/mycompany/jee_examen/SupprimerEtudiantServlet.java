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

@WebServlet("/SupprimerEtudiantServlet")
public class SupprimerEtudiantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = ConnexionDB.getConnection()) {
            String sql = "DELETE FROM etudiants WHERE id = ?";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setInt(1, id);
                statement.executeUpdate();
                response.sendRedirect("listeEtudiant.jsp?successMessage=Etudiant supprime avec success");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Échec de la suppression de l'étudiant");
        }
    }
}
