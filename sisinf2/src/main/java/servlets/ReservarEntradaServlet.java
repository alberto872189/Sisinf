package servlets;

import java.util.Map;

import dao.postgres.DAOClientePostgres;
import dao.postgres.DAOEntradaPostgres;
import dao.postgres.DAOProd_EntPostgres;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vo.Cliente;
import vo.Entrada;
import vo.Prod_Ent;

import java.sql.Timestamp;

@WebServlet(description = "Servlet de reserva de entradas", urlPatterns = { "/reservarEntrada"})
public class ReservarEntradaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L; //Por hacer
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String hora = request.getParameter("hora");
		String butacas[] = request.getParameterValues("butaca");
		String productos[] = request.getParameterValues("producto");
		String usuario = request.getParameter("usuario");
		String sala = request.getParameter("sala");
		Integer nButacas = Integer.valueOf(request.getParameter("nEntradas"));
		String pelicula = request.getParameter("pelicula");
		
		if (butacas.length != nButacas) {
			errors.put("Butacas", "Número de butacas incorrecto");
		}
		if(errors.isEmpty()) {
			DAOClientePostgres dao = new DAOClientePostgres("usuario", "user");
			Cliente client = dao.obtener(usuario);
			if (client.Correo == null) {
				errors.put("Login", "El usuario no existe");
			}
			else {
				DAOEntradaPostgres daoEntrada = new DAOEntradaPostgres("usuario", "user");
				DAOProd_EntPostgres daoProdEnt = new DAOProd_EntPostgres("usuario", "user");
				Prod_Ent prodent = new Prod_Ent();
				Entrada entrada = new Entrada();
				for (String but : butacas) {
					entrada.N_But = Integer.valueOf(but);
					entrada.N_Sala = Integer.valueOf(sala);
					entrada.Correo = usuario;
					entrada.Sesion_Hora = Timestamp.valueOf(hora);
					int idEnt = daoEntrada.crear(entrada);
					for (String prod : productos) {
						prodent.ID_Ent = idEnt;
						prodent.Nombre_Prod = prod;
						daoProdEnt.crear(prodent);
					}
				}
			}
		}
		request.setAttribute("errors", errors);
		request.setAttribute("Hora", hora + ";" + sala);
		request.setAttribute("pelicula", pelicula);
		request.setAttribute("nEntradas", nButacas);
		RequestDispatcher dispatcher = null;
		if (errors.isEmpty()) {
			dispatcher=request.getRequestDispatcher("peliculas/reserva/entrada.jsp");
		}
		else {
			dispatcher=request.getRequestDispatcher("peliculas/reserva/indexReserva2.jsp");
		}
		dispatcher.forward(request, response);
	
	}
}
