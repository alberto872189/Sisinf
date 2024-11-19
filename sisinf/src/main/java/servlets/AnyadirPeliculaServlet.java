package servlets;

import java.util.Map;

import dao.postgres.DAOPeliculaPostgres;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vo.Pelicula;

@MultipartConfig
@WebServlet(description = "Servlet para añadir películas al catálogo", urlPatterns = { "/anyadirPelicula" })
public class AnyadirPeliculaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String titulo = request.getParameter("titulo");
		String resumen = request.getParameter("resumen");
		Part filePart = request.getPart("imagen");
		String link = request.getParameter("imdb");
		String trailer = request.getParameter("trailer");
		

		subirImagen(filePart, titulo, request);
		
		if(errors.isEmpty()) {
			DAOPeliculaPostgres daoPeli = new DAOPeliculaPostgres("admin", "admin");
			Pelicula peli = daoPeli.obtener(titulo);
			if (peli != null && peli.Titulo != null) {
				request.setAttribute("mensaje", "Ya existe película con ese título");
			}

			else {
				peli.Titulo = titulo;
				peli.Resumen = resumen;
				peli.Imagen = "/sisinf/peliculas/imagenes/"+titulo+".jpg";
				peli.Link_IMDB = link;
				peli.Trailer = trailer;
				daoPeli.crear(peli);
			}
			
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("admin/peliculas/anyadirPelicula.jsp");
        request.setAttribute("mensaje", "Pelicula subida exitosamente");
		dispatcher.forward(request, response);
	}

private void subirImagen(Part filePart, String titulo, HttpServletRequest request) {
	String uploadPath = getServletContext().getRealPath("/peliculas/imagenes");
	String fileName = titulo+".jpg";
	String filePath = uploadPath + File.separator + fileName;
	
	File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) {
        if (uploadDir.mkdirs()) {
            request.setAttribute("mensaje", "Directorio creado exitosamente.");
        } else {
            request.setAttribute("mensaje", "No se pudo crear el directorio.");
            return; // Salir si no se pudo crear el directorio
        }
    }
    
    try (InputStream fileContent = filePart.getInputStream()) {
        Files.copy(fileContent, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
    } catch (Exception e) {
    	request.setAttribute("mensaje", "No se pudo subir la imagen en");
    }
}

}
