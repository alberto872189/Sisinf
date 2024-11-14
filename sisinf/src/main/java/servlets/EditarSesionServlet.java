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

@WebServlet(description = "Servlet editar sesiones del catálogo", urlPatterns = { "/editarSesion" })
public class EditarSesionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String seleccion = request.getParameter("sesionVieja");
    	String titulo = request.getParameter("peliculaNueva");
        String hora = request.getParameter("horaNueva");
        String fecha = request.getParameter("diaNuevo");
        String sala = request.getParameter("salaNueva");
        String precio = request.getParameter("precioNuevo");
        
        String[] sesionVieja = seleccion.split(";");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date sesionHoraVieja;
        Date sesionHoraNueva;

        try {
            sesionHoraVieja = formatter.parse(sesionVieja[0]);
            Pair<Date, Integer> par = new Pair<>(sesionHoraVieja, Integer.parseInt(sesionVieja[1]));

            DAOSesionPostgres daoSesion = new DAOSesionPostgres("admin", "admin");
            Integer nSala = Integer.parseInt(sala);
            Double realPrice = Double.parseDouble(precio);
            Sesion sesion = new Sesion();
            sesionHoraNueva = formatter.parse(fecha + " " + hora);
            sesion.N_Sala = nSala;
            sesion.Precio = realPrice;
            sesion.Sesion_Hora = sesionHoraNueva;
            sesion.Tit_Pel = titulo;
            
            daoSesion.modificar(par, sesion);
            
            request.setAttribute("mensajeEditarSesion", "Sesión editada exitosamente");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/peliculas/editarSesiones.jsp");
            dispatcher.forward(request, response);

        } catch (ParseException e) {
            request.setAttribute("mensajeEditarSesion", "No se pudo parsear la fecha");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/peliculas/editarSesiones.jsp");
            dispatcher.forward(request, response);
        }
    }
}