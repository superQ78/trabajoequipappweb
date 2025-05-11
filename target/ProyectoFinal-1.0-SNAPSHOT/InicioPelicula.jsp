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
        <title>Bienvenido al Cine</title>
        <!-- Usar un nuevo estilo moderno -->
        <link rel="stylesheet" href="estiloInicioPelicula.css">
        <!-- Opcional: Incluir alguna fuente moderna desde Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    </head>
    <body>
        <header class="header">
            <h1>Bienvenido, <%= nombreUsuario%>!</h1>
        </header>
        <div class="search-bar-container">
            <form action="BuscarPeliculasServlet" method="get" class="search-form">
                <input type="text" name="titulo" placeholder="Buscar películas..." required>
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>
        <nav class="nav-bar">
            <ul>
                <li>
                    <a class="nav-link" href="ResgitrarPelicula.jsp">
                        <span class="icon"></span> Registrar Película
                    </a>
                </li>
                <li class="dropdown">
                    <a class="nav-link dropdown-toggle" href="#">
                        Mis Películas</a>
                    <div class="dropdown-menu">
                        <a href="VerPeliculasServlet">Ver Todas</a>
                        <a href="Favoritos.jsp">Favoritas</a>
                   
                    </div>
                </li>
                <li class="dropdown">
                    <a class="nav-link dropdown-toggle" href="#">
                        Cuenta</a>
                    <div class="dropdown-menu">
                        <a href="logout.jsp">Cerrar Sesión</a>
                    </div>
                </li>
            </ul>
        </nav>

        <!-- Aquí podrías incluir una sección de tarjetas o galería de películas -->
        <main class="content">
            <!-- Ejemplo: Tarjeta de película (futura implementación) -->
            <section class="pelicula-card">
                <img src="ruta_a_imagen.jpg" alt="Portada de la película">
                <div class="detalles">
                    <h2>Título de la Película</h2>
                    <p>Descripción breve o datos de interés.</p>
                </div>
            </section>
        </main>
    </body>
</html>
