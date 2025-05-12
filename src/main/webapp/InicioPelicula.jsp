<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String nombreUsuario = (String) session.getAttribute("nombreUsuario");
    if (nombreUsuario == null) {
        response.sendRedirect("InicioPeliculaServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Filmoteca</title>
        <link rel="stylesheet" href="estiloInicioPelicula.css">
    </head>
    <body>
        <header class="header">
            <h1>Bienvenido, <%= nombreUsuario%>!</h1>
        </header>

        <nav class="nav-bar">
            <ul>
                <li>
                    <a class="nav-link" href="ResgitrarPelicula.jsp">
                        Registrar Película
                    </a>
                </li>
                <li>
                    <a class="nav-link" href="VerPeliculasServlet">
                        Mis Películas
                    </a>
                </li>
                <li>
                    <a class="nav-link" href="Favoritos.jsp">
                        Favoritas
                    </a>
                </li>
                <li style="margin-left: auto;">
                    <a class="nav-link" href="logout.jsp">
                        Cerrar Sesión
                    </a>
                </li>
            </ul>
        </nav>

        <div class="search-bar-container">
            <form action="BuscarPeliculasServlet" method="get" class="search-form">
                <input type="text" name="titulo" id="searchInput" placeholder="Buscar películas..." required onkeyup="buscarPeliculas()">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
            <div id="suggestions-container">
            </div>
        </div>

        <main class="content">
            <!-- Ejemplo: Tarjeta de película -->
            <section class="pelicula-card">
                <img src="ruta_a_imagen.jpg" alt="Portada de la película">
                <div class="detalles">
                    <h2>Título de la Película</h2>
                    <p>Descripción breve o datos de interés.</p>
                </div>
            </section>
        </main>

        <script>
            /* Al buscar las películas, deben de ir apareciendo */
            function buscarPeliculas() {
                const input = document.getElementById('searchInput').value;
                const suggestionsContainer = document.getElementById('suggestions-container');

                suggestionsContainer.innerHTML = ''; // Limpiar sugerencias anteriores

                if (input.length >= 2) {
                    fetch('BuscarPeliculasSugerenciasServlet?term=' + input)
                            .then(response => response.json())
                            .then(data => {
                                if (data && data.length > 0) {
                                    data.forEach(pelicula => {
                                        const suggestion = document.createElement('div');
                                        suggestion.classList.add('suggestion-item');
                                        suggestion.textContent = pelicula.getTitulo();
                                        suggestion.addEventListener('click', function () {
                                            document.getElementById('searchInput').value = pelicula.getTitulo();
                                            suggestionsContainer.innerHTML = '';
                                        });
                                        suggestionsContainer.appendChild(suggestion);
                                    });
                                } else {
                                    const noSuggestions = document.createElement('div');
                                    noSuggestions.classList.add('no-suggestions');
                                    noSuggestions.textContent = 'No se encontraron sugerencias.';
                                    suggestionsContainer.appendChild(noSuggestions);
                                }
                            })
                            .catch(error => {
                                console.error('Error al buscar sugerencias:', error);
                            });
                }
            }
        </script>
    </body>
</html>