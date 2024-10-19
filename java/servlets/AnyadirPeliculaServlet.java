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

public class AnyadirPeliculaServlet extends HttpServlet {
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String titulo = request.getParameter("titulo");
		String resumen = request.getParameter("resumen");
		String imagen = request.getParameter("imagen");
		String link = request.getParameter("link");
		String trailer = request.getParameter("trailer");
		
		if ((titulo == null) || (titulo.trim().equals(""))) errors.put("Titulo", "Campo obligatorio");
		if ((resumen == null) || (resumen.trim().equals(""))) errors.put("resumen", "Campo obligatorio");
		if ((imagen == null) || (imagen.trim().equals(""))) errors.put("imagen", "Campo obligatorio");
		if ((imagen == null) || (imagen.trim().equals(""))) errors.put("imagen", "Campo obligatorio");
		if ((link == null) || (link.trim().equals(""))) errors.put("link", "Campo obligatorio");
		if ((trailer == null) || (trailer.trim().equals(""))) errors.put("trailer", "Campo obligatorio");
		
		if(errors.isEmpty()) {
			DAOPeliculaPostgres daoPeli = new DAOPeliculaPostgres("admin", "admin");
			Pelicula peli = daoPeli.obtener(titulo);
			if (peli.Titulo != null) {
				errors.put("Pelicula", "La película ya existe");
			}
			else {
				peli.Titulo = titulo;
				peli.Resumen = resumen;
				peli.Imagen = imagen;
				peli.Link_IMDB = link;
				peli.Trailer = trailer;
				daoPeli.crear(peli);
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("PeliculasCrear.jsp");
		request.setAttribute("errors", errors);
		dispatcher.forward(request, response);
	
	}
}
