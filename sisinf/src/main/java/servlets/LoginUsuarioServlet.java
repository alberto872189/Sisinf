package servlets;

import java.util.Map;

import dao.postgres.DAOClientePostgres;
import dao.postgres.DAOAdministradorPostgres;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vo.Cliente;
import vo.Administrador;

//FUNCIONA
@WebServlet(description = "Servlet de autenticación del usuario", urlPatterns = { "/login" })
public class LoginUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String login = request.getParameter("login");
		String passwd = request.getParameter("passwd");
		if ((login == null) || (login.trim().equals(""))) errors.put("Login", "Campo obligatorio");
		if ((passwd == null) || (passwd.trim().equals(""))) errors.put("Clave", "Campo obligatorio");
		boolean esAdmin = false;
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
					esAdmin = true;
					if (!admin.Contrasenia.equals(passwd)) {
						errors.put("Clave", "Contraseña incorrecta");
					}
				}
				else {
					errors.put("Login", "Usuario no encontrado");
				}
			}
		}
		if(errors.isEmpty()) {
			Cookie cookie = new Cookie ("login", login);
			response.addCookie(cookie);
			if(esAdmin) {
				RequestDispatcher dispatcher=request.getRequestDispatcher("/admin/indexAdmin.jsp");
				request.setAttribute("errors", errors);
				dispatcher.forward(request, response);
			}
			else {
				RequestDispatcher dispatcher=request.getRequestDispatcher("/indexUser.jsp");
				request.setAttribute("errors", errors);
				dispatcher.forward(request, response);
			}
		}
		else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
			request.setAttribute("errors", errors);
			dispatcher.forward(request, response);
		}
	}
}
