<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String nombreUsuario = (String) session.getAttribute("nombreUsuario");

    if (nombreUsuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Película</title>
    <link rel="stylesheet" href="estiloRegistrarPelicula.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body class="body-cine">
    <div class="registro-container">
        <h1 class="titulo">🎬 Registrar Nueva Película</h1>

        <div class="card-form">
            <form method="post" action="RegistrarPeliculaServlet" enctype="multipart/form-data" class="formulario">
                <div class="form-group">
                    <label for="titulo">🎞️ Título de la película:</label>
                    <input type="text" name="titulo" required>
                </div>

                <div class="form-group">
                    <label for="descripcion">📝 Descripción:</label>
                    <textarea name="descripcion" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <label for="calificacion">⭐ Calificación:</label>
                    <select name="calificacion">
                        <option value="1">★</option>
                        <option value="2">★★</option>
                        <option value="3">★★★</option>
                        <option value="4">★★★★</option>
                        <option value="5">★★★★★</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="comentario">💬 Comentario:</label>
                    <textarea name="comentario" rows="2"></textarea>
                </div>

                <div class="form-group">
                    <label for="imagen">🖼️ Imagen de portada:</label>
                    <input type="file" name="imagen" accept="image/*">
                </div>

                <button type="submit" class="btn btn-registrar">🎥 Registrar Película</button>
            </form>

            <a href="InicioPelicula.jsp" class="btn btn-volver">⬅ Volver al Inicio</a>
        </div>
    </div>
</body>
</html>

