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
import jakarta.servlet.http.*;
import utils.Pair;
import vo.Pelicula;
import vo.Sesion;
import java.util.Date;

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
		
		/*if ((titulo == null) || (titulo.trim().equals(""))) errors.put("Titulo", "Campo obligatorio");
		if ((resumen == null) || (resumen.trim().equals(""))) errors.put("resumen", "Campo obligatorio");
		if ((imagen == null) || (imagen.trim().equals(""))) errors.put("imagen", "Campo obligatorio");
		if ((imagen == null) || (imagen.trim().equals(""))) errors.put("imagen", "Campo obligatorio");
		if ((link == null) || (link.trim().equals(""))) errors.put("link", "Campo obligatorio");
		if ((hora == null) || (hora.trim().equals(""))) errors.put("hora", "Campo obligatorio");
		if ((sala == null) || (sala.trim().equals(""))) errors.put("sala", "Campo obligatorio");
		if ((precio == null) || (precio.trim().equals(""))) errors.put("precio", "Campo obligatorio");*/
		
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
