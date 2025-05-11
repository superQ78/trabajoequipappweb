<%@ page session="true" %>
<%@ page import="java.util.List, DTO.PeliculaDTO" %>

<% List<PeliculaDTO> peliculasFavoritas = (List<PeliculaDTO>) request.getAttribute("listaFavoritas"); %>

<html>
    <head>
        <title>Mis Películas Favoritas</title>
        <link rel="stylesheet" href="estiloFavoritos.css">
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
                <p>Calificación: <%= pelicula.getCalificacion()%>/5</p>
                <% if (pelicula.getImagen() != null && !pelicula.getImagen().isEmpty()) {%>
                <img src="<%= pelicula.getImagen()%>" alt="Portada de la película">
                <% }%>
                <p>Comentario: <%= pelicula.getComentario()%></p>
            </div>
            <% } %>
            <% } else { %>
            <p>No tienes películas favoritas guardadas.</p>
            <% }%>
        </div>
    </body>
</html>