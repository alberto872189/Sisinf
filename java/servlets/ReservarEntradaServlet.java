package servlets;

import java.util.Map;

import dao.postgres.DAOClientePostgres;
import dao.postgres.DAOPeliculaPostgres;
import dao.postgres.DAOComentarioPostgres;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import vo.Cliente;
import vo.Comentario;
import vo.Pelicula;
import vo.Administrador;
import java.sql.Timestamp;

public class ReservarEntradaServlet extends HttpServlet { //Por hacer
	/*public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String texto = request.getParameter("texto");
		String pelicula = request.getParameter("pelicula");
		String usuario = request.getParameter("usuario");
		String fecha = request.getParameter("fecha");
		if ((texto == null) || (texto.trim().equals(""))) errors.put("Texto", "Campo obligatorio");
		if ((usuario == null) || (usuario.trim().equals(""))) errors.put("Usuario", "Necesitas iniciar sesión para escribir un comentario");
		if ((pelicula == null) || (pelicula.trim().equals(""))) errors.put("Pelicula", "No válida");
		if ((fecha == null) || (fecha.trim().equals(""))) errors.put("Fecha", "No válida");
		
		if(errors.isEmpty()) {
			DAOClientePostgres dao = new DAOClientePostgres("usuario", "user");
			Cliente client = dao.obtener(usuario);
			if (client.Correo == null) {
				errors.put("Login", "El usuario no existe");
			}
			else {
				DAOPeliculaPostgres daoPeli = new DAOPeliculaPostgres("usuario", "user");
				Pelicula peli = daoPeli.obtener(pelicula);
				if (peli.Titulo == null) {
					errors.put("Pelicula", "La película no existe");
				}
				else {
					DAOComentarioPostgres daoComment = new DAOComentarioPostgres("usuario", "user");
					Comentario comment = new Comentario();
					comment.Texto = texto;
					comment.Pelicula = pelicula;
					comment.Usuario = usuario;
					comment.Fecha = Timestamp.valueOf(fecha);
					daoComment.crear(comment);
				}
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("Peliculas.jsp");
		request.setAttribute("errors", errors);
		dispatcher.forward(request, response);
	
	}*/
}
