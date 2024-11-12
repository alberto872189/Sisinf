package servlets;

import java.util.Map;

import dao.postgres.DAOClientePostgres;
import dao.postgres.DAOPeliculaPostgres;
import dao.postgres.DAOEntradaPostgres;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vo.Cliente;
import vo.Entrada;
import java.sql.Timestamp;

@WebServlet(description = "Servlet de reserva de entradas", urlPatterns = { "/reservarEntrada"})
public class ReservarEntradaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L; //Por hacer
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String hora = request.getParameter("hora");
		String but = request.getParameter("butaca");
		String usuario = request.getParameter("usuario");
		String sala = request.getParameter("sala");
		
		if(errors.isEmpty()) {
			DAOClientePostgres dao = new DAOClientePostgres("usuario", "user");
			Cliente client = dao.obtener(usuario);
			if (client.Correo == null) {
				errors.put("Login", "El usuario no existe");
			}
			else {
				DAOEntradaPostgres daoEntrada = new DAOEntradaPostgres("usuario", "user");
				Entrada entrada = new Entrada();
				entrada.N_But = Integer.valueOf(but);
				entrada.N_Sala = Integer.valueOf(sala);
				entrada.Correo = usuario;
				entrada.Sesion_Hora = Timestamp.valueOf(hora);
				daoEntrada.crear(entrada);
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("Peliculas.jsp");
		request.setAttribute("errors", errors);
		dispatcher.forward(request, response);
	
	}
}
