<%@page import="DTO.PeliculaDTO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.PeliculaDTO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados de Búsqueda</title>
    <link rel="stylesheet" href="estiloInicioPelicula.css">
</head>
<body>

<h1>Resultados de la búsqueda: "<%= request.getAttribute("busqueda") %>"</h1>

<%
    List<PeliculaDTO> peliculas = (List<PeliculaDTO>) request.getAttribute("peliculas");
    if (peliculas != null && !peliculas.isEmpty()) {
        for (PeliculaDTO p : peliculas) {
%>
    <div class="pelicula-item">
        <h2><%= p.getTitulo() %></h2>
        <p>Imagen <%= p.getImagen()%></p>
        <p>Descripcion <%= p.getDescripcion()%></p>
    </div>
<%
        }
    } else {
%>
    <p>No se encontraron películas con ese título.</p>
<%
    }
%>

<a href="InicioPelicula.jsp" class="btn">Volver al inicio</a>

</body>
</html>
