/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control;

/**
 *
 * @author cesar
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.PeliculaDTO;
import Modelo.PeliculaDAO; // Asegúrate de tener tu clase DAO para Películas

@WebServlet("/VerPeliculaServlet")
public class VerPeliculaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int peliculaId = Integer.parseInt(idParam);
                PeliculaDAO peliculaDAO = new PeliculaDAO(); // Instancia de tu DAO
                PeliculaDTO pelicula = peliculaDAO.obtenerPeliculaPorId(peliculaId); // Método para buscar por ID

                if (pelicula != null) {
                    request.setAttribute("pelicula", pelicula);
                    request.getRequestDispatcher("verPeliculaDetalle.jsp").forward(request, response);
                } else {
                    // Manejar el caso en que no se encuentra la película
                    response.sendRedirect("paginaError.jsp?mensaje=Película no encontrada");
                }

            } catch (NumberFormatException e) {
                // Manejar el caso en que el ID no es un número válido
                response.sendRedirect("paginaError.jsp?mensaje=ID de película inválido");
            }
        } else {
            // Manejar el caso en que no se proporciona el ID
            response.sendRedirect("paginaError.jsp?mensaje=No se proporcionó el ID de la película");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
