package servlets;




import dao.postgres.DAOProductoPostgres;

import java.io.IOException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vo.Producto;


@WebServlet(description = "Servlet de borrado de productos", urlPatterns = { "/borrarProductos"})
public class BorrarProductoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L; //Por hacer
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productos[] = request.getParameterValues("productos");
		
		DAOProductoPostgres dao = new DAOProductoPostgres("admin", "admin");

		if (productos != null) {
			for (String prod : productos) {
				Producto producto = new Producto();
				producto = dao.obtener(prod);
				producto.Disponible = false;
				dao.modificar(producto);
			}
				
		}

		RequestDispatcher dispatcher = null;
		dispatcher=request.getRequestDispatcher("admin/bar/borrarProducto.jsp");
		dispatcher.forward(request, response);
	
	}
}
