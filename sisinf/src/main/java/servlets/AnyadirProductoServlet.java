package servlets;




import dao.postgres.DAOProductoPostgres;

import java.io.IOException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vo.Producto;


@WebServlet(description = "Servlet de adición de productos", urlPatterns = { "/addProducto"})
public class AnyadirProductoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L; //Por hacer
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String producto = request.getParameter("producto");
		String precio = request.getParameter("precio");
		
		DAOProductoPostgres dao = new DAOProductoPostgres("admin", "admin");
		Producto prod = new Producto();
		if (producto != null) {
			prod = dao.obtener(producto);
			if (prod.Nombre == null) {
				prod.Nombre = producto;
				prod.Precio = Double.parseDouble(precio);
				prod.Disponible = true;
				dao.crear(prod);
			}
			else {
				prod.Precio = Double.parseDouble(precio);
				prod.Disponible = true;
				dao.modificar(prod);
			}
		}

		RequestDispatcher dispatcher = null;
		dispatcher=request.getRequestDispatcher("admin/bar/anyadirProducto.jsp");
		dispatcher.forward(request, response);
	
	}
}
