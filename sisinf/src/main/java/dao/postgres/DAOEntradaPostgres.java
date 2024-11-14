package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.interfaces.DAOEntrada;
import vo.Entrada;

public class DAOEntradaPostgres extends DAOEntrada {

	public DAOEntradaPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public int crear(Entrada t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		int ret = -1;
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Entrada(Correo, Sesion_Hora, N_Sala, N_But, Tit_Pel) VALUES ('" + t.Correo + "','" + t.Sesion_Hora + "'," +  t.N_Sala + "," + t.N_But + ",'" + t.Tit_Pel + "') RETURNING ID";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            boolean rowsInserted = preparedStatement.execute();
            System.out.println(rowsInserted + " row(s) inserted.");
            ResultSet lastId = preparedStatement.getResultSet();
            if(lastId.next()) {
               ret = lastId.getInt(1);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ret;
	}

	@Override
	public void modificar(Entrada t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "UPDATE Entrada SET Correo = '" + t.Correo + "', Sesion_Hora = '" + t.Sesion_Hora + "', N_Sala = " + t.N_Sala + ", N_But = " + t.N_But + ", Tit_Pel = '" + t.Tit_Pel  + "' WHERE ID=" + t.ID;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            int rowsUpdated = preparedStatement.executeUpdate();
            System.out.println(rowsUpdated + " row(s) updated.");
            connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
		
	}

	@Override
	public void borrar(Integer k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Entrada WHERE ID=" + k;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
            int rowsDeleted = preparedStatement.executeUpdate();
            System.out.println(rowsDeleted + " row(s) deleted.");
            connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
		
	}

	@Override
	public Entrada obtener(Integer k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		Entrada res = new Entrada();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Entrada where ID =" + k;
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Sesion_Hora = resultSet.getTimestamp("Sesion_Hora");
				res.Correo = resultSet.getString("Correo");
				res.N_Sala = resultSet.getInt("N_Sala");
				res.ID = resultSet.getInt("ID");
				res.N_But = resultSet.getInt("N_But");
				res.Tit_Pel = resultSet.getString("Tit_Pel");
				
			}
			connection.close();
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public List<Entrada> obtenerEntradas() {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		List<Entrada> res = new ArrayList<Entrada>();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Entrada";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				Entrada entrada = new Entrada();
				entrada.Correo = resultSet.getString("Correo");
				entrada.ID = resultSet.getInt("ID");
				entrada.Sesion_Hora = resultSet.getDate("Sesion_Hora");
				entrada.N_Sala = resultSet.getInt("N_Sala");
				entrada.N_But = resultSet.getInt("N_But");
				entrada.Tit_Pel = resultSet.getString("Tit_Pel");
				res.add(entrada);
			}
			connection.close();
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public List<Entrada> obtenerEntradasSesion(Integer sala, String hora) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		List<Entrada> res = new ArrayList<Entrada>();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Entrada WHERE N_Sala=" + sala + " AND Sesion_Hora ='" + hora + "'";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				Entrada entrada = new Entrada();
				entrada.Correo = resultSet.getString("Correo");
				entrada.ID = resultSet.getInt("ID");
				entrada.Sesion_Hora = resultSet.getDate("Sesion_Hora");
				entrada.N_Sala = resultSet.getInt("N_Sala");
				entrada.N_But = resultSet.getInt("N_But");
				entrada.Tit_Pel = resultSet.getString("Tit_Pel");
				res.add(entrada);
			}
			connection.close();
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int obtenerNumEntradasPelicula(String pelicula) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		int res = 0;
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select count(*) AS nEntradas from Entrada WHERE Tit_Pel = '" + pelicula + "'";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			if (resultSet.next()) {
				res = resultSet.getInt("nEntradas");	
			}
			connection.close();
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}

}
