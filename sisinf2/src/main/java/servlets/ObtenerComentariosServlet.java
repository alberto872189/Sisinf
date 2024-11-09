package servlets;

import java.util.Map;

import dao.postgres.DAOPeliculaPostgres;
import dao.postgres.DAOComentarioPostgres;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vo.Comentario;
import vo.Pelicula;

@WebServlet(description = "Servlet de obtención de comentarios de una película", urlPatterns = { "/getComments" })
public class ObtenerComentariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		List<Comentario> comments = null;
		String pelicula = request.getParameter("pelicula");
		if ((pelicula == null) || (pelicula.trim().equals(""))) errors.put("Pelicula", "No válida");
		
		if(errors.isEmpty()) {
			DAOPeliculaPostgres daoPeli = new DAOPeliculaPostgres("usuario", "user");
			Pelicula peli = daoPeli.obtener(pelicula);
			if (peli.Titulo == null) {
				errors.put("Pelicula", "La película no existe");
			}
			else {
				DAOComentarioPostgres daoComment = new DAOComentarioPostgres("usuario", "user");
				comments = daoComment.obtenerPel(pelicula);
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("pelicula.jsp");
		request.setAttribute("errors", errors);
		request.setAttribute("comments", comments);
		dispatcher.forward(request, response);
	
	}
}
