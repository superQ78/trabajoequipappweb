<%@ page session="true" %>
<%@ page import="java.util.List, DTO.PeliculaDTO" %>
<%@ page import="java.util.ArrayList" %>

<%
    Object peliculasObj = request.getAttribute("listaPeliculas");
    List<PeliculaDTO> listaPeliculas = null;

    if (peliculasObj instanceof List<?>) {
        listaPeliculas = (List<PeliculaDTO>) peliculasObj;
    } else {
        System.out.println("Error en VerPeliculas.jsp: `listaPeliculas` no es del tipo esperado.");
        listaPeliculas = new ArrayList<>();
    }

    if (listaPeliculas == null) {
        listaPeliculas = new ArrayList<>();
    }

    System.out.println("VerPeliculas.jsp - Pel�culas recibidas correctamente: " + listaPeliculas.size());
%>

<html>
    <head>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Mis Pel�culas</title>
        <link rel="stylesheet" href="estiloVerPelicula.css">
        <title>Mis Pel�culas</title>
    </head>
    <body>
        <h1>Mis Pel�culas</h1>

        <button onclick="window.history.back()" class="btn-atras">Atr�s</button>

        <button onclick="window.location.href = 'FavoritosServlet'" class="btn-favoritos-link">
            <i class="fas fa-heart"></i> Ir a Favoritos
        </button>

        <div class="peliculas-container">
            <% if (listaPeliculas.isEmpty()) { %>
            <p>No tienes pel�culas registradas a�n.</p>
            <% } else { %>
            <% for (PeliculaDTO pelicula : listaPeliculas) {%>
            <div class="pelicula">
                <% if (pelicula.getImagen() != null && !pelicula.getImagen().isEmpty()) {%>
                <img src="<%= pelicula.getImagen()%>" alt="Portada de <%= pelicula.getTitulo()%>" class="portada-img">
                <% }%>

                <h2><%= pelicula.getTitulo()%></h2>
                <p><%= pelicula.getDescripcion()%></p>
                <p><%= pelicula.getComentario()%></p>
                <p>Calificaci�n: <%= pelicula.getCalificacion()%>/5</p>

                <form action="AgregarFavoritoServlet" method="post">
                    <input type="hidden" name="peliculaId" value="<%= pelicula.getId()%>">
                    <button type="submit" class="boton-favorito">
                        <i class="fas fa-heart"></i> Agregar a Favoritos
                    </button>
                </form>
            </div>
            <% } %>
            <% }%>
        </div>
    </body>
</html>