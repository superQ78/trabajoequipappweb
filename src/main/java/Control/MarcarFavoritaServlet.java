/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control;

import DAO.PeliculaDAO;
import DTO.PeliculaDTO;
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
@WebServlet("/MarcarFavoritaServlet")
public class MarcarFavoritaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String usuarioId = (String) session.getAttribute("nombreUsuario");

        if (usuarioId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Obtener el ID de la película desde la URL
        ObjectId peliculaId = new ObjectId(request.getParameter("id"));

        // Obtener la película
        PeliculaDTO pelicula = PeliculaDAO.obtenerPorId(peliculaId);

        if (pelicula != null && pelicula.getUsuarioId().equals(usuarioId)) {
            // Marcar como favorita
            pelicula.setFavorita(true);
            PeliculaDAO.actualizar(pelicula);
        }

        response.sendRedirect("FavoritosServlet");
    }
}
