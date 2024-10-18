package servlets;

import java.util.Map;

import dao.postgres.DAOClientePostgres;
import dao.postgres.DAOAdministradorPostgres;

import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import vo.Cliente;
import vo.Administrador;


public class LoginUsuarioServlet extends HttpServlet {
	public void doPost (HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> errors = new HashMap <String, String>();
		String login = request.getParameter("login");
		String passwd = request.getParameter("passwd");
		if ((login == null) || (login.trim().equals(""))) errors.put("Login", "Campo obligatorio");
		if ((passwd == null) || (passwd.trim().equals(""))) errors.put("Clave", "Campo obligatorio"); 
		if(errors.isEmpty()) {
			DAOClientePostgres dao = new DAOClientePostgres("usuario", "user");
			Cliente client = dao.obtener(login);
			if (client.Correo != null) {
				if (!client.Contrasenia.equals(passwd)) {
					errors.put("Clave", "Contraseña incorrecta");
				}
			}
			else {
				DAOAdministradorPostgres daoAdmin = new DAOAdministradorPostgres("usuario", "user");
				Administrador admin = daoAdmin.obtener(login);
				if (admin.Correo != null) {
					if (!admin.Contrasenia.equals(passwd)) {
						errors.put("Clave", "Contraseña incorrecta");
					}
				}
				else {
					errors.put("Login", "Usuario no encontrado");
				}
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
		request.setAttribute("errors", errors);
		dispatcher.forward(request, response);
	
	}
}
