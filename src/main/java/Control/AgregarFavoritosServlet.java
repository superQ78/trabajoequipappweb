/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control;

import DAO.PeliculaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.types.ObjectId;

/**
 *
 * @author cesar
 */
@WebServlet("/AgregarFavoritoServlet")
public class AgregarFavoritosServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String usuarioId = (String) session.getAttribute("usuarioId");

        if (usuarioId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String peliculaIdStr = request.getParameter("peliculaId");

        if (peliculaIdStr != null && !peliculaIdStr.isEmpty()) {
            try {
                ObjectId peliculaId = new ObjectId(peliculaIdStr);
                // Llama al método en el DAO para marcar la película como favorita
                PeliculaDAO.marcarComoFavorita(peliculaId, usuarioId);
                System.out.println("Película con ID " + peliculaId + " marcada como favorita para el usuario " + usuarioId);
            } catch (IllegalArgumentException e) {
                System.err.println("ID de película inválido: " + peliculaIdStr);
            }
        } else {
            System.err.println("No se recibió el ID de la película.");
        }

        // Redirige de vuelta a la página de ver películas (o a donde desees)
        response.sendRedirect("VerPeliculasServlet"); // Asumiendo que tienes un Servlet para mostrar las películas
    }
}
