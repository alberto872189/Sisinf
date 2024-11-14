package servlets;

import dao.postgres.DAOPeliculaPostgres;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@MultipartConfig
@WebServlet(description = "Servlet para borrar películas del catálogo", urlPatterns = { "/borrarPelicula" })
public class BorrarPeliculaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] peliculasSeleccionadas = request.getParameterValues("pelicula[]");

        if (peliculasSeleccionadas != null && peliculasSeleccionadas.length > 0) {
        	DAOPeliculaPostgres daoPeli = new DAOPeliculaPostgres("admin", "admin");
            for (String titulos : peliculasSeleccionadas) {
            	daoPeli.borrar(titulos);
            }
            RequestDispatcher dispatcher=request.getRequestDispatcher("admin/peliculas/borrarPelicula.jsp");
            request.setAttribute("mensajeBorrarPel", "Peliculas borradas exitosamente");
    		dispatcher.forward(request, response);
        }
        else {
        	RequestDispatcher dispatcher=request.getRequestDispatcher("admin/peliculas/borrarPelicula.jsp");
        	request.setAttribute("mensajeBorrarPel", "Ninguna pelicula seleccionada");
    		dispatcher.forward(request, response);
        }

	}

}