/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control;

import Negocio.PeliculaBO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cesar
 */
@WebServlet("/EliminarPeliculaServlet")
public class EliminarPeliculaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String peliculaId = request.getParameter("peliculaId");

        if (peliculaId == null || peliculaId.isEmpty()) {
            System.out.println("⚠ Error: ID de película vacío o inválido.");
            response.sendRedirect("VerPeliculasServlet");
            return;
        }

        System.out.println("🗑️ Eliminando película con ID: " + peliculaId);

        PeliculaBO peliculaBO = new PeliculaBO();
        peliculaBO.eliminarPelicula(peliculaId);

        System.out.println("✅ Película eliminada correctamente.");
        response.sendRedirect("VerPeliculasServlet"); // Redirige a la lista después de eliminar
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // ✅ Esto permite que GET también funcione
    }
}
