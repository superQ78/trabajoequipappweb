/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import DAO.PeliculaDAO;
import DTO.PeliculaDTO;
import java.util.List;

/**
 *
 * @author cesar
 */
public class PeliculaBO {

    private PeliculaDAO peliculaDAO;

    public void agregarPelicula(PeliculaDTO pelicula) {
        PeliculaDAO.agregar(pelicula);
    }

    public void eliminarPelicula(String id) {
        PeliculaDAO.eliminar(new org.bson.types.ObjectId(id));
    }

    public List<PeliculaDTO> obtenerPeliculasPorUsuario(String usuarioId) {
        return PeliculaDAO.obtenerPorUsuario(usuarioId);
    }

    public void actualizarPelicula(PeliculaDTO pelicula) {
        PeliculaDAO.actualizar(pelicula);
    }

    public PeliculaDTO obtenerPorId(String id) {
        return PeliculaDAO.obtenerPorId(new org.bson.types.ObjectId(id));
    }

    public PeliculaBO() {
        this.peliculaDAO = new PeliculaDAO(); // Asegúrate de tener esta clase
    }

    public List<PeliculaDTO> buscarPorTitulo(String titulo, String usuarioId) {
    return PeliculaDAO.buscarPorTitulo(titulo, usuarioId);
}
}
