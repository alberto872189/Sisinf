package servlets;

import java.util.Map;

import dao.postgres.DAOClientePostgres;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vo.Cliente;

@WebServlet(description = "Servlet de borrado de cuentas de usuario", urlPatterns = { "/deleteUser" })
public class BorrarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String login = request.getParameter("login");
		if(errors.isEmpty()) {
			DAOClientePostgres dao = new DAOClientePostgres("admin", "admin");
			Cliente client = dao.obtener(login);
			if (client.Correo != null) {
				dao.borrar(login);
			}
			else {
				errors.put("Login", "Usuario no encontrado");
			}
		}
		Cookie cookie = new Cookie ("login", "");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		RequestDispatcher dispatcher=request.getRequestDispatcher("indexUser.jsp");
		request.setAttribute("errors", errors);
		dispatcher.forward(request, response);
	}
}
