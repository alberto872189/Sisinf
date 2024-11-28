package servlets;

import dao.postgres.DAOProd_EntPostgres;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vo.Prod_Ent;

@WebServlet(description = "Servlet de asignación de productos a su entrada", urlPatterns = { "/addProductoEntrada"})
public class AnyadirProductoEntradaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L; //Por hacer
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productos[] = request.getParameterValues("productos");
		
		DAOProd_EntPostgres dao = new DAOProd_EntPostgres("usuario", "user");
		Prod_Ent prodent = new Prod_Ent();
		if (productos != null) {
			for (String prod : productos) {
				int k = prod.indexOf(";");
				prodent.ID_Ent = Integer.valueOf(prod.substring(k+1));
				prodent.Nombre_Prod = prod.substring(0, k);
				dao.crear(prodent);
			}
		}

		RequestDispatcher dispatcher = null;
		dispatcher=request.getRequestDispatcher("peliculas/reserva/entrada.jsp");
		dispatcher.forward(request, response);
	
	}
}
