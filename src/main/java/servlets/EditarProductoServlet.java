package servlets;

import dao.postgres.DAOProductoPostgres;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vo.Producto;


@WebServlet(description = "Servlet de edicion de productos", urlPatterns = { "/editarProductos"})
public class EditarProductoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L; //Por hacer
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productos[] = request.getParameterValues("productos");
		String precios[] = request.getParameterValues("precios");
		DAOProductoPostgres dao = new DAOProductoPostgres("admin", "admin");

		if (productos != null && precios != null) {
			int i = 0;
			for (String prod : productos) {
				double precio = Double.parseDouble(precios[i]);
				Producto producto = dao.obtener(prod);
				producto.Precio = precio;
				dao.modificar(producto);
				i++;
			}
				
		}

		RequestDispatcher dispatcher = null;
		dispatcher=request.getRequestDispatcher("admin/bar/modificarPrecios.jsp");
		dispatcher.forward(request, response);
	
	}
}
