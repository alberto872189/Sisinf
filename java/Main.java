import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import dao.interfaces.*;
import dao.postgres.*;
import vo.*;
import utils.*;

class Main {
	public static void main(String args[]) {
		int id = 47;//incrementar en 3 cada vez que se prueba
		int id2 = 29;//incrementar en 2 cada vez que se prueba
		
		System.out.println("ADMINISTRADORES");
		DAOAdministradorPostgres test1 = new DAOAdministradorPostgres("admin", "admin");
		Administrador admint1 = new Administrador();
		admint1.Contrasenia = "contraseña";
		admint1.Correo = "correoadmin@gmail.com";
		admint1.Nombre = "nombreDeAdmin";
		System.out.printf("admin 1: %s, %s, %s \n", admint1.Nombre, admint1.Contrasenia, admint1.Correo);
		System.out.println("crear");
		test1.crear(admint1);
		System.out.println("creado");
		Administrador admint2 = new Administrador();
		System.out.println("obtener");
		admint2 = test1.obtener("correoadmin@gmail.com");
		System.out.println("obtenido");
		admint2.Contrasenia = "contraseña2";
		admint2.Nombre = "nombreDeAdmin2";
		System.out.println("modificar");
		test1.modificar(admint2);
		System.out.println("modificado");
		admint1 = test1.obtener("correoadmin@gmail.com");
		System.out.printf("admin final: %s, %s, %s \n", admint1.Nombre, admint1.Contrasenia, admint1.Correo);
		System.out.println("borrar");
		test1.borrar("correoadmin@gmail.com");
		System.out.println("borrado");
		Administrador admint3 = new Administrador();
		admint3 = test1.obtener("correoadmin@gmail.com");
		System.out.printf("admin borrado: %s, %s, %s \n", admint3.Nombre, admint3.Contrasenia, admint3.Correo);
		
		
		
		System.out.println();
		System.out.println("SALAS");
		DAOSalaPostgres test3 = new DAOSalaPostgres("admin", "admin");
		Sala salat1 = new Sala();
		salat1.n = 1;
		System.out.printf("sala 1: %s \n", salat1.n);
		System.out.println("crear");
		test3.crear(salat1);
		System.out.println("creado");
		Sala salat2 = new Sala();
		System.out.println("obtener");
		salat2 = test3.obtener(1);
		System.out.println("obtenido");
		System.out.printf("sala final: %s \n",salat2.n);
		System.out.println("borrar");
		test3.borrar(1);
		System.out.println("borrado");
		Sala salat3 = new Sala();
		salat3 = test3.obtener(1);
		System.out.printf("sala borrada: %s \n", salat3.n);
		test3.crear(salat1); //Para pruebas posteriores
		salat1.n = 2;
		test3.crear(salat1);
		
		
		
		System.out.println();
		System.out.println("BUTACAS");
		DAOButacaPostgres test2 = new DAOButacaPostgres("admin", "admin");
		Butaca butacat1 = new Butaca();
		butacat1.N_Butaca = 1;
		butacat1.Sala_N = 1;
		System.out.printf("butaca 1: %s, %s \n", butacat1.N_Butaca, butacat1.Sala_N);
		System.out.println("crear");
		test2.crear(butacat1);
		System.out.println("creado");
		Butaca butacat2 = new Butaca();
		System.out.println("obtener");
		Pair<Integer, Integer> claveBut = new Pair<Integer, Integer>(1, 1);
		butacat2 = test2.obtener(claveBut);
		System.out.println("obtenido");
		System.out.printf("butaca final: %s, %s \n", butacat1.N_Butaca, butacat1.Sala_N);
		System.out.println("borrar");
		test2.borrar(claveBut);
		System.out.println("borrado");
		Butaca butacat3 = new Butaca();
		butacat3 = test2.obtener(claveBut);
		System.out.printf("butaca borrada: %s, %s \n", butacat3.N_Butaca, butacat3.Sala_N);
		test2.crear(butacat1); //Para pruebas posteriores
		butacat1.N_Butaca = 2;
		butacat1.Sala_N = 2;
		test2.crear(butacat1);
		
		
		
		System.out.println();
		System.out.println("PELICULAS");
		DAOPeliculaPostgres test4 = new DAOPeliculaPostgres("admin", "admin");
		Pelicula pelit1 = new Pelicula();
		pelit1.Titulo = "titulo";
		pelit1.Resumen = "resumen";
		pelit1.Imagen = "Imagen";
		pelit1.Link_IMDB = "Link";
		pelit1.Trailer = "trailer";
		System.out.printf("pelicula 1: %s, %s, %s, %s, %s \n", pelit1.Titulo, pelit1.Resumen, pelit1.Imagen, pelit1.Link_IMDB, pelit1.Trailer);
		System.out.println("crear");
		test4.crear(pelit1);
		System.out.println("creado");
		Pelicula pelit2 = new Pelicula();
		System.out.println("obtener");
		pelit2 = test4.obtener("titulo");
		System.out.println("obtenido");
		pelit2.Resumen = "resumen2";
		pelit2.Imagen = "Imagen2";
		pelit2.Link_IMDB = "link2";
		pelit2.Trailer = "trailer2";
		System.out.println("modificar");
		test4.modificar(pelit2);
		System.out.println("modificado");
		pelit1 = test4.obtener("titulo");
		System.out.printf("pelicula final: %s, %s, %s, %s, %s \n", pelit1.Titulo, pelit1.Resumen, pelit1.Imagen, pelit1.Link_IMDB, pelit1.Trailer);
		System.out.println("borrar");
		test4.borrar("titulo");
		System.out.println("borrado");
		Pelicula pelit3 = new Pelicula();
		pelit3 = test4.obtener("titulo");
		System.out.printf("pelicula borrada: %s, %s, %s, %s, %s \n", pelit3.Titulo, pelit3.Resumen, pelit3.Imagen, pelit3.Link_IMDB, pelit3.Trailer);
		test4.crear(pelit1); //Para pruebas posteriores
		pelit1.Titulo = "titulo2";
		test4.crear(pelit1); //Para pruebas posteriores
		
		
		
		System.out.println();
		System.out.println("CLIENTES");
		DAOClientePostgres test5 = new DAOClientePostgres("admin", "admin");
		Cliente clientet1 = new Cliente();
		clientet1.Contrasenia = "contraseña";
		clientet1.Correo = "correocliente@gmail.com";
		clientet1.Nombre = "nombreDeCliente";
		System.out.printf("cliente 1: %s, %s, %s \n", clientet1.Nombre, clientet1.Contrasenia, clientet1.Correo);
		System.out.println("crear");
		test5.crear(clientet1);
		System.out.println("creado");
		Cliente clientet2 = new Cliente();
		System.out.println("obtener");
		clientet2 = test5.obtener("correocliente@gmail.com");
		System.out.println("obtenido");
		clientet2.Contrasenia = "contraseña2";
		clientet2.Nombre = "nombreDeCliente2";
		System.out.println("modificar");
		test5.modificar(clientet2);
		System.out.println("modificado");
		clientet1 = test5.obtener("correocliente@gmail.com");
		System.out.printf("cliente final: %s, %s, %s \n", clientet1.Nombre, clientet1.Contrasenia, clientet1.Correo);
		System.out.println("borrar");
		test5.borrar("correocliente@gmail.com");
		System.out.println("borrado");
		Cliente clientet3 = new Cliente();
		clientet3 = test5.obtener("correocliente@gmail.com");
		System.out.printf("cliente borrado: %s, %s, %s \n", clientet3.Nombre, clientet3.Contrasenia, clientet3.Correo);
		test5.crear(clientet1); //Para pruebas posteriores
		clientet1.Correo = "correocliente2@gmail.com";
		test5.crear(clientet1); //Para pruebas posteriores
		
		
		
		System.out.println();
		System.out.println("COMENTARIOS");
		DAOComentarioPostgres test6 = new DAOComentarioPostgres("admin", "admin");
		Comentario coment1 = new Comentario();
		coment1.Texto = "texto";
		coment1.Pelicula = "titulo";
		coment1.Usuario = "correocliente@gmail.com";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			coment1.Fecha = formatter.parse("2024-10-15 12:30:35");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.printf("comentario 1: %s, %s, %s, %s \n", coment1.Texto, coment1.Pelicula, coment1.Usuario, coment1.Fecha);
		System.out.println("crear");
		test6.crear(coment1);
		System.out.println("creado");
		Comentario coment2 = new Comentario();
		System.out.println("obtener");
		coment2 = test6.obtener(id);
		System.out.println("obtenido");
		System.out.printf("%s \n", coment2.Fecha);
		coment2.Texto = "texto2";
		coment2.Pelicula = "titulo2";
		coment2.Usuario = "correocliente2@gmail.com";
		try {
			coment2.Fecha = formatter.parse("2024-10-15 15:30:35");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("modificar");
		test6.modificar(coment2);
		System.out.println("modificado");
		coment1 = test6.obtener(id);
		System.out.printf("comentario final: %s, %s, %s, %s \n", coment1.Texto, coment1.Pelicula, coment1.Usuario, coment1.Fecha);
		System.out.println("borrar");
		test6.borrar(id);
		System.out.println("borrado");
		Comentario coment3 = new Comentario();
		coment3 = test6.obtener(id);
		System.out.printf("comentario borrado: %s, %s, %s, %s \n", coment3.Texto, coment3.Pelicula, coment3.Usuario, coment3.Fecha);
		test6.crear(coment1);
		coment1.Texto = "texto3";
		test6.crear(coment1);
		coment1.Texto = "texto4";
		System.out.println("Lista comentarios titulo2:");
		List<Comentario> res = test6.obtenerPel(coment1.Pelicula);
		for (Comentario c : res) {
			System.out.printf("%s, %s, %s, %s \n", c.Texto, c.Pelicula, c.Usuario, c.Fecha);
		}
		test6.borrar(id+1);
		test6.borrar(id+2);
		
		
		System.out.println();
		System.out.println("PRODUCTOS");
		DAOProductoPostgres test7 = new DAOProductoPostgres("admin", "admin");
		Producto prodt1 = new Producto();
		prodt1.Disponible = true;
		prodt1.Precio = 12.5;
		prodt1.Nombre = "producto";
		System.out.printf("producto 1: %s, %s, %s \n", prodt1.Nombre, prodt1.Precio, prodt1.Disponible);
		System.out.println("crear");
		test7.crear(prodt1);
		System.out.println("creado");
		Producto prodt2 = new Producto();
		System.out.println("obtener");
		prodt2 = test7.obtener("producto");
		System.out.println("obtenido");
		prodt2.Precio = 13.0;
		prodt2.Disponible = false;
		System.out.println("modificar");
		test7.modificar(prodt2);
		System.out.println("modificado");
		prodt1 = test7.obtener("producto");
		System.out.printf("producto final: %s, %s, %s \n", prodt1.Nombre, prodt1.Precio, prodt1.Disponible);
		System.out.println("borrar");
		test7.borrar("producto");
		System.out.println("borrado");
		Producto prodt3 = new Producto();
		prodt3 = test7.obtener("producto");
		System.out.printf("producto borrado: %s, %s, %s \n", prodt3.Nombre, prodt3.Precio, prodt3.Disponible);
		test7.crear(prodt1); //Para pruebas posteriores
		prodt1.Nombre = "producto2";
		test7.crear(prodt1);
		
		
		
		System.out.println();
		System.out.println("SESIONES");
		DAOSesionPostgres test8 = new DAOSesionPostgres("admin", "admin");
		Sesion sesiont1 = new Sesion();
		sesiont1.Precio = 5.5;
		sesiont1.Tit_Pel = "titulo";
		sesiont1.N_Sala = 1;
		try {
			sesiont1.Sesion_Hora = formatter.parse("2024-10-15 12:30:35");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.printf("sesion 1: %s, %s, %s, %s \n", sesiont1.Precio, sesiont1.Tit_Pel, sesiont1.N_Sala, sesiont1.Sesion_Hora);
		System.out.println("crear");
		test8.crear(sesiont1);
		System.out.println("creado");
		Sesion sesiont2 = new Sesion();
		System.out.println("obtener");
		Pair<Date, Integer> claveSesion = new Pair<Date, Integer>(sesiont1.Sesion_Hora, 1);
		sesiont2 = test8.obtener(claveSesion);
		System.out.println("obtenido");
		System.out.printf("%s \n", sesiont2.Sesion_Hora);
		sesiont2.Precio = 5.0;
		sesiont2.Tit_Pel = "titulo2";
		System.out.println("modificar");
		test8.modificar(sesiont2);
		System.out.println("modificado");
		sesiont1 = test8.obtener(claveSesion);
		System.out.printf("sesion final: %s, %s, %s, %s \n", sesiont1.Precio, sesiont1.Tit_Pel, sesiont1.N_Sala, sesiont1.Sesion_Hora);
		System.out.println("borrar");
		test8.borrar(claveSesion);
		System.out.println("borrado");
		Sesion sesiont3 = new Sesion();
		sesiont3 = test8.obtener(claveSesion);
		System.out.printf("sesion borrada: %s, %s, %s, %s \n", sesiont3.Precio, sesiont3.Tit_Pel, sesiont3.N_Sala, sesiont3.Sesion_Hora);
		test8.crear(sesiont1); //Para prubeas posteriores
		sesiont1.N_Sala = 2;
		try {
			sesiont1.Sesion_Hora = formatter.parse("2024-10-15 10:30:35");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		test8.crear(sesiont1);
		
		
		
		System.out.println();
		System.out.println("ENTRADAS");
		DAOEntradaPostgres test9 = new DAOEntradaPostgres("admin", "admin");
		Entrada entradat1 = new Entrada();
		entradat1.Correo = "correocliente@gmail.com";
		entradat1.N_Sala = 1;
		try {
			entradat1.Sesion_Hora = formatter.parse("2024-10-15 12:30:35");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.printf("entrada 1: %s, %s, %s \n", entradat1.Correo, entradat1.N_Sala, entradat1.Sesion_Hora);
		System.out.println("crear");
		test9.crear(entradat1);
		System.out.println("creado");
		Entrada entradat2 = new Entrada();
		System.out.println("obtener");
		entradat2 = test9.obtener(id2);
		System.out.println("obtenido");
		System.out.printf("%s \n", entradat2.Sesion_Hora);
		entradat2.Correo = "correocliente2@gmail.com";
		entradat2.N_Sala = 2;
		try {
			entradat2.Sesion_Hora = formatter.parse("2024-10-15 10:30:35");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("modificar");
		test9.modificar(entradat2);
		System.out.println("modificado");
		entradat1 = test9.obtener(id2);
		System.out.printf("entrada final: %s, %s, %s \n", entradat1.Correo, entradat1.N_Sala, entradat1.Sesion_Hora);
		System.out.println("borrar");
		test9.borrar(id2);
		System.out.println("borrado");
		Entrada entradat3 = new Entrada();
		entradat3 = test9.obtener(id2);
		System.out.printf("entrada borrada: %s, %s, %s \n", entradat3.Correo, entradat3.N_Sala, entradat3.Sesion_Hora);
		test9.crear(entradat1); //Para pruebas posteriores
		
		
		
		System.out.println();
		System.out.println("ENT_BUT");
		DAOEnt_ButPostgres test10 = new DAOEnt_ButPostgres("admin", "admin");
		Ent_But entbutt1 = new Ent_But();
		entbutt1.ID_Ent = id2+1;
		entbutt1.N_But = 1;
		entbutt1.Sala_N = 1;
		System.out.printf("ent_but 1: %s, %s, %s \n", entbutt1.ID_Ent, entbutt1.N_But, entbutt1.Sala_N);
		System.out.println("crear");
		test10.crear(entbutt1);
		System.out.println("creado");
		Ent_But entbutt2 = new Ent_But();
		System.out.println("obtener");
		Triplet<Integer, Integer, Integer> claveEntbut = new Triplet<Integer, Integer, Integer>(id2+1, 1, 1);
		entbutt2 = test10.obtener(claveEntbut);
		System.out.println("obtenido");
		System.out.printf("ent_but final: %s, %s, %s \n", entbutt2.ID_Ent, entbutt2.N_But, entbutt2.Sala_N);
		System.out.println("borrar");
		test10.borrar(claveEntbut);
		System.out.println("borrado");
		Ent_But entbutt3 = new Ent_But();
		entbutt3 = test10.obtener(claveEntbut);
		System.out.printf("ent_but borrado: %s, %s, %s \n", entbutt3.ID_Ent, entbutt3.N_But, entbutt3.Sala_N);
		
		
		
		System.out.println();
		System.out.println("PROD_ENT");
		DAOProd_EntPostgres test11 = new DAOProd_EntPostgres("admin", "admin");
		Prod_Ent prodentt1 = new Prod_Ent();
		prodentt1.ID_Ent = id2+1;
		prodentt1.Nombre_Prod = "producto";
		System.out.printf("ent_prod 1: %s, %s \n", prodentt1.ID_Ent, prodentt1.Nombre_Prod);
		System.out.println("crear");
		test11.crear(prodentt1);
		System.out.println("creado");
		Prod_Ent prodentt2 = new Prod_Ent();
		System.out.println("obtener");
		Pair<Integer, String> claveProdEnt = new Pair<Integer, String>(id2+1, "producto");
		prodentt2 = test11.obtener(claveProdEnt);
		System.out.println("obtenido");
		System.out.printf("ent_prod final: %s, %s \n", prodentt2.ID_Ent, prodentt2.Nombre_Prod);
		System.out.println("borrar");
		test11.borrar(claveProdEnt);
		System.out.println("borrado");
		Prod_Ent prodentt3 = new Prod_Ent();
		prodentt3 = test11.obtener(claveProdEnt);
		System.out.printf("ent_prod borrado: %s, %s \n", prodentt3.ID_Ent, prodentt3.Nombre_Prod);
		
		
		
		//Borrado de elementos para pruebas
		System.out.println();
		test9.borrar(id2+1);
		test8.borrar(claveSesion);
		Pair<Date, Integer> claveSesion2 = new Pair<Date, Integer>(sesiont1.Sesion_Hora, 2);
		test8.borrar(claveSesion2);
		test4.borrar("titulo");
		test4.borrar("titulo2");
		test2.borrar(claveBut);
		Pair<Integer, Integer> claveBut2 = new Pair<Integer, Integer>(2, 2);
		test2.borrar(claveBut2);
		test3.borrar(1);
		test3.borrar(2);
		test5.borrar("correocliente@gmail.com");
		test5.borrar("correocliente2@gmail.com");
		test7.borrar("producto");
		test7.borrar("producto2");
	}
}