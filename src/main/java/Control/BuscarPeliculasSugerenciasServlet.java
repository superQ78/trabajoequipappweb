
package Control;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import DTO.PeliculaDTO;
import Negocio.PeliculaBO;

@WebServlet("/BuscarPeliculasSugerenciasServlet")
public class BuscarPeliculasSugerenciasServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PeliculaBO peliculaBO = new PeliculaBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String term = request.getParameter("tutulo");
        String usuarioId = (String) request.getSession().getAttribute("usuarioId"); // 🔹 Asegúrate de usar el nombre correcto de tu atributo de usuario

        if (term != null && !term.isEmpty() && usuarioId != null && !usuarioId.isEmpty()) {
            List<PeliculaDTO> sugerencias = peliculaBO.buscarPorTitulo(term, usuarioId); // 🔹 Reutiliza tu método buscarPorTitulo

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            Gson gson = new Gson();
            String jsonSugerencias = gson.toJson(sugerencias);

            PrintWriter out = response.getWriter();
            out.print(jsonSugerencias);
            out.flush();
        } else {
            // Si no hay término o usuarioId, devuelve un JSON vacío
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print("[]");
            out.flush();
        }
    }
}