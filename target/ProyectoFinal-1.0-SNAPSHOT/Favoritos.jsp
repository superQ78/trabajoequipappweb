<%@ page session="true" %>
<%@ page import="java.util.List, DTO.PeliculaDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% List<PeliculaDTO> peliculasFavoritas = (List<PeliculaDTO>) request.getAttribute("listaFavoritas"); %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Mis Películas Favoritas</title>
        <link rel="stylesheet" href="estiloFavoritos.css">
        <script>
            function toggleFavorito(peliculaId, boton) {
                fetch("ToggleFavoritoServlet", {
                    method: "POST",
                    body: new URLSearchParams({peliculaId: peliculaId})
                }).then(response => {
                    if (response.ok) {
                        boton.children[0].classList.toggle("fas");
                        boton.children[0].classList.toggle("far");
                    }
                }).catch(error => console.error("Error al marcar favorito:", error));
            }
        </script>
    </head>
    <body>
        <h1>Películas Favoritas</h1>

        <div class="navegacion-favoritos">
            <button onclick="window.history.back()">Volver Atrás</button>
            <button onclick="window.location.href = 'InicioPeliculaServlet'">Ir a Inicio</button>
        </div>

        <div class="peliculas-container">
            <% if (peliculasFavoritas != null && !peliculasFavoritas.isEmpty()) { %>
            <% for (PeliculaDTO pelicula : peliculasFavoritas) {%>
            <div class="pelicula">
                <h2><%= pelicula.getTitulo()%></h2>
                <p><%= pelicula.getDescripcion()%></p>
                <p>🎭 Género: <%= pelicula.getGenero()%></p>
                <p>⭐ Calificación: <%= pelicula.getCalificacion()%>/5</p>

                <%
                    String imagenUrl = pelicula.getImagen();
                    if (imagenUrl != null && !imagenUrl.isEmpty()) {
                        // 🔹 Verificamos si ya incluye "uploads/"
                        if (!imagenUrl.startsWith("uploads/")) {
                            imagenUrl = "uploads/" + imagenUrl;
                        }
                    } else {
                        imagenUrl = "images/default.jpg"; // Imagen por defecto si no hay portada
                    }
                %>

                <img src="<%= imagenUrl%>" alt="Portada de <%= pelicula.getTitulo()%>" class="portada-img">

                <p>📝 Comentario: <%= pelicula.getComentario()%></p>

                <!-- 🔹 Botón de estrella para quitar de favoritos -->
                <button class="btn-favorito" onclick="toggleFavorito('<%= pelicula.getId()%>', this)">
                    <i class="fas fa-star"></i> <!-- Siempre iniciará como favorita en esta página -->
                </button>
            </div>
            <% } %>
            <% } else { %>
            <p>No tienes películas favoritas guardadas.</p>
            <% }%>
        </div>
    </body>
</html>