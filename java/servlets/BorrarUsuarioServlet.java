package servlets;

import java.util.Map;

import dao.postgres.DAOClientePostgres;
import dao.postgres.DAOAdministradorPostgres;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import vo.Cliente;
import vo.Administrador;


public class BorrarUsuarioServlet extends HttpServlet {
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String login = request.getParameter("login");
		if(errors.isEmpty()) {
			DAOClientePostgres dao = new DAOClientePostgres("usuario", "user");
			Cliente client = dao.obtener(login);
			if (client.Correo != null) {
				dao.borrar(login);
			}
			else {
				errors.put("Login", "Usuario no encontrado");
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
		request.setAttribute("errors", errors);
		dispatcher.forward(request, response);
	
	}
}
