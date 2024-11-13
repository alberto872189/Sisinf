package servlets;

import java.util.Map;

import dao.postgres.DAOPeliculaPostgres;
import dao.postgres.DAOSesionPostgres;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import utils.Pair;
import vo.Pelicula;
import vo.Sesion;
import java.util.Date;

@WebServlet(description = "Servlet para añadir películas al catálogo", urlPatterns = { "/añadirPelicula" })
public class AnyadirPeliculaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String titulo = request.getParameter("titulo");
		String resumen = request.getParameter("resumen");
		String imagen = request.getParameter("imagen");
		String link = request.getParameter("link");
		String trailer = request.getParameter("trailer");
		String hora = request.getParameter("hora");
		String sala = request.getParameter("sala");
		String precio = request.getParameter("precio");
		
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
			
			DAOSesionPostgres daoSesion = new DAOSesionPostgres("admin", "admin");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date fecha = null;
			try {
				fecha = formatter.parse(hora);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			int nSesion = Integer.parseInt(sala);
			Sesion sesion = daoSesion.obtener(new Pair<Date, Integer>(fecha, nSesion));
			if (sesion.N_Sala != null) {
				errors.put("Sesion", "La sesión ya existe");
			} else {
				sesion.Sesion_Hora = fecha;
				sesion.N_Sala = nSesion;
				sesion.Precio = Double.parseDouble(precio);
				daoSesion.crear(sesion);
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("PeliculasCrear.jsp");
		request.setAttribute("errors", errors);
		dispatcher.forward(request, response);
	}
}
