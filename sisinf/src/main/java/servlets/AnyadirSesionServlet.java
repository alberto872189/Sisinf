package servlets;
import dao.postgres.DAOSesionPostgres;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date; 

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import utils.Pair;
import vo.Sesion;

@WebServlet(description = "Servlet para añadir sesiones al catálogo", urlPatterns = { "/anyadirSesion" })
public class AnyadirSesionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("pelicula");
        String hora = request.getParameter("hora");
        String fecha = request.getParameter("dia");
        String sala = request.getParameter("sala");
        String precio = request.getParameter("precio");

        Integer nSala = Integer.parseInt(sala);
        Double realPrice = Double.parseDouble(precio);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date sesionHora;

        try {
            sesionHora = formatter.parse(fecha + " " + hora);
            Pair<Date, Integer> par = new Pair<>(sesionHora, nSala);

            DAOSesionPostgres daoSesion = new DAOSesionPostgres("admin", "admin");
            Sesion sesion = daoSesion.obtener(par);
            if (sesion.Tit_Pel != null) {
                request.setAttribute("mensaje", "Ya existe esta sesión" + sesion.Tit_Pel + sesion.N_Sala);
            } else {
                sesion.N_Sala = nSala;
                sesion.Precio = realPrice;
                sesion.Sesion_Hora = sesionHora;
                sesion.Tit_Pel = titulo;

                daoSesion.crear(sesion);
                request.setAttribute("mensaje", "Sesión creada exitosamente");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/peliculas/anyadirPelicula.jsp");
            dispatcher.forward(request, response);

        } catch (ParseException e) {
            request.setAttribute("mensaje", "No se pudo parsear la fecha");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/peliculas/anyadirPelicula.jsp");
            dispatcher.forward(request, response);
        }
    }
}
