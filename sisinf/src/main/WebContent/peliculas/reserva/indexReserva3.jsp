<!DOCTYPE html>
<html>
<head>
</head>
<%@ page import="dao.postgres.DAOProductoPostgres"%>
<%@ page import="vo.Pelicula"%>
<%@ page import="vo.Sesion"%>
<%@ page import="java.util.List"%>
<%@ page import="vo.Butaca"%>
<%@ page import="vo.Producto"%>
<div class="topbar">
<%
	String pel = request.getParameter("pelicula");
	String entradas[] = (String[]) request.getAttribute("idEntradas");
	Integer nEntradas = (Integer) request.getAttribute("nEntradas");
	String hora = (String) request.getAttribute("hora");
	String sala = (String) request.getAttribute("sala");
	String user = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("login"))
		user = cookie.getValue();
		}
	}
	%>
	<h1>Desacine</h1>
	<!-- Menu -->
	<div class="menu">
		<form method="post" action="/borrarEntrada">
		<%
		for (String id : entradas) {
		%>
		<%="<input type=\"hidden\" name=\"idEntradas\" value=\"" + id + "\" required>"%>
		<%
		}
		%>

		<%
		int k = hora.indexOf(" ");
		hora = hora.substring(0, k) + "+" + hora.substring(k + 1);
		%>
		<input type="hidden" name="nButacas" value="<%=nEntradas%>" required>
		<input type="hidden" name="pelicula" value="<%=pel%>" required>
		<input type="hidden" name="hora" value=<%=hora%> required>
		<input type="hidden" name="sala" value=<%=sala%> required>
		<input type="hidden" name="retorno" value="index.jsp" required>
		<button type="submit">Cartelera</button>
	</form>
	</div>
</div>
<body>

	

	<form name="reserva" method="post" action="/addProductoEntrada">
		<h1>Productos del bar</h1>
		<br>
		<%
		DAOProductoPostgres dao2 = new DAOProductoPostgres("usuario", "user");
		List<Producto> productos = dao2.obtenerProductos();
		%>
		<table>
			<tr>
				<%
				int i = 1;
				for (String id : entradas) {
				%>
				<%="<td> Entrada " + i + ": " + id + "<br>"%>
				<%
				for (Producto producto : productos) {
					if (producto.Disponible) {
				%>
				<%="<input width=\"12px\" heigth=\"12px\" type=\"checkbox\" name=\"productos\" value=\"" + producto.Nombre + ";"
		+ id + "\">" + producto.Nombre + "<br>"%>
				<%
				}
				}
				%>
				<%="</td>"%>
				<%
				i++;
				}
				%>
			</tr>
		</table>
		<input type="submit" value="Confirmar y pagar">
	</form>
	<br>
	<form method="post" action="/borrarEntrada">
		<%
		for (String id : entradas) {
		%>
		<%="<input type=\"hidden\" name=\"idEntradas\" value=\"" + id + "\" required>"%>
		<%
		}
		%>
		<input type="hidden" name="nButacas" value="<%=nEntradas%>" required>
		<input type="hidden" name="pelicula" value="<%=pel%>" required>
		<input type="hidden" name="hora" value=<%=hora%> required>
		<input type="hidden" name="sala" value=<%=sala%> required>
		<input type="hidden" name="retorno" value="indexReserva2.jsp" required>
		<input type="submit" value="Volver">
	</form>
</body>
<script >
function regreso() {
	window.location.href = "/index.jsp";	
}
</script>
<style>
	/* General Reset */
body, h1, h2, p, a, table, tr, td, button, form, input, select, label {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Body */
body {
    background-color: #f4f4f9;
    color: #333;
    line-height: 1.6;
    font-size: 16px;
    padding: 2em;
}

/* Topbar */
.topbar {
    background-color: #1f1f1f;
    color: #fff;
    padding: 1em 2em;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5em;
}

.topbar h1 {
    font-size: 2em;
    margin: 0;
}

.menu {
    display: flex;
    gap: 1em;
}

.menu button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
}

.menu button:hover {
    background-color: #0056b3;
}

/* Main Content */
h1 {
    font-size: 2em;
    color: #007bff;
    margin-bottom: 1em;
}

/* Formulario */
form {
    background: white;
    padding: 1.5em;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 0 auto 1.5em auto;
}

form label {
    display: block;
    font-weight: bold;
    margin-bottom: 0.5em;
    color: #333;
}

form input[type="number"],
form select,
form input[type="hidden"] {
    width: calc(100% - 20px);
    padding: 0.5em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
}

form input[type="submit"] {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    margin-top: 1em;
}

form input[type="submit"]:hover {
    background-color: #218838;
}

/* Links */
a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
}

/* Utility */
.container {
    max-width: 900px;
    margin: 0 auto;
}
</style>
</html>