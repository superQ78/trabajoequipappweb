<%@ page session="true" %>
<%@ page import="java.util.List, DTO.PeliculaDTO" %>

<% List<PeliculaDTO> peliculasFavoritas = (List<PeliculaDTO>) request.getAttribute("listaFavoritas"); %>

<html>
    <head>
        <title>Mis Pel�culas Favoritas</title>
        <link rel="stylesheet" href="estiloFavoritos.css">
    </head>
    <body>
        <h1>Pel�culas Favoritas</h1>

        <div class="navegacion-favoritos">
            <button onclick="window.history.back()">Volver Atr�s</button>
            <button onclick="window.location.href = 'InicioPeliculaServlet'">Ir a Inicio</button>
        </div>

        <div class="peliculas-container">
            <% if (peliculasFavoritas != null && !peliculasFavoritas.isEmpty()) { %>
            <% for (PeliculaDTO pelicula : peliculasFavoritas) {%>
            <div class="pelicula">
                <h2><%= pelicula.getTitulo()%></h2>
                <p><%= pelicula.getDescripcion()%></p>
                <p><%= pelicula.getGenero()%></p>
                <p>Calificaci�n: <%= pelicula.getCalificacion()%>/5</p>
                <% if (pelicula.getImagen() != null && !pelicula.getImagen().isEmpty()) {%>
                <img src="<%= pelicula.getImagen()%>" alt="Portada de la pel�cula">
                <% }%>
                <p>Comentario: <%= pelicula.getComentario()%></p>
            </div>
            <% } %>
            <% } else { %>
            <p>No tienes pel�culas favoritas guardadas.</p>
            <% }%>
        </div>
    </body>
</html>