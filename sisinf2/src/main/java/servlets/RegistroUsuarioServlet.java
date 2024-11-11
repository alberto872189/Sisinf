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
@WebServlet(description = "Servlet de registro de usuarios", urlPatterns = { "/registroUsuario" })
public class RegistroUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String login = request.getParameter("login");
		String passwd = request.getParameter("passwd");
		String passwd2 = request.getParameter("passwd2");
		String nombre = request.getParameter("nombre");
		/*if ((login == null) || (login.trim().equals(""))) errors.put("Login", "Campo obligatorio");
		if ((passwd == null) || (passwd.trim().equals(""))) errors.put("Clave", "Campo obligatorio");
		if ((passwd2 == null) || (passwd2.trim().equals(""))) errors.put("Clave2", "Campo obligatorio");
		if ((nombre == null) || (nombre.trim().equals(""))) errors.put("Nombre", "Campo obligatorio");*/
		
		if (!passwd.equals(passwd2)) errors.put("Claves", "Las contraseñas no coinciden");
		if(errors.isEmpty()) {
			DAOClientePostgres dao = new DAOClientePostgres("usuario", "user");
			Cliente client = dao.obtener(login);
			if (client.Correo != null) {
				errors.put("Login", "El usuario ya existe");
			}
			else {
				DAOAdministradorPostgres daoAdmin = new DAOAdministradorPostgres("usuario", "user");
				Administrador admin = daoAdmin.obtener(login);
				if (admin.Correo != null) {
					errors.put("Login", "El usuario ya existe");
				}
				else {
					dao = new DAOClientePostgres("usuario", "user");
					client = new Cliente();
					client.Correo = login;
					client.Contrasenia = passwd;
					client.Nombre = nombre;
					dao.crear(client);
				}
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
		request.setAttribute("errors", errors);
		dispatcher.forward(request, response);
	
	}
}
