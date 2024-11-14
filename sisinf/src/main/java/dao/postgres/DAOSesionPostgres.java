package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.interfaces.DAOSesion;
import utils.Pair;
import vo.Sesion;

public class DAOSesionPostgres extends DAOSesion {
	
	public DAOSesionPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public int crear(Sesion t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) VALUES ('" + t.Sesion_Hora + "','" + t.Tit_Pel + "'," + t.N_Sala + "," + t.Precio + ")";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setTimestamp(1, t.Sesion_Hora);
            preparedStatement.setString(2, t.Tit_Pel);
            preparedStatement.setInt(3, t.N_Sala);
            preparedStatement.setDouble(4, t.Precio);*/
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return 1;
	}

	public void modificar(Pair<Date, Integer> k, Sesion nuevaSes) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
			String sql = "UPDATE Sesion " +
                    "SET Tit_Pel = '" + nuevaSes.Tit_Pel + "', " +
                    "Precio = " + nuevaSes.Precio + ", " +
                    "Sesion_Hora = '" + nuevaSes.Sesion_Hora + "', " +
                    "N_Sala = " + nuevaSes.N_Sala + " " +
                    "WHERE Sesion_Hora = '" + k.x + "' " +
                    "AND N_Sala = " + k.y;
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
	public void borrar(Pair<Date, Integer> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Sesion WHERE Sesion_Hora='" + k.x + "' and N_Sala=" + k.y;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setTimestamp(1, k.x);
            preparedStatement.setInt(2, k.y.intValue());*/
            

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
	public Sesion obtener(Pair<Date, Integer> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		Sesion res = new Sesion();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Sesion where Sesion_Hora='" + k.x + "' and N_Sala=" + k.y;
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Sesion_Hora = resultSet.getTimestamp("Sesion_Hora");
				res.Tit_Pel = resultSet.getString("Tit_Pel");
				res.N_Sala = resultSet.getInt("N_Sala");
				res.Precio = resultSet.getDouble("Precio");
				
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
	
	public List<Sesion> obtenerSesionesPel(String k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		List<Sesion> res = new ArrayList<Sesion>();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Sesion where Tit_Pel='" + k + "'";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				Sesion sesion = new Sesion();
				sesion.Sesion_Hora = resultSet.getTimestamp("Sesion_Hora");
				sesion.Tit_Pel = resultSet.getString("Tit_Pel");
				sesion.N_Sala = resultSet.getInt("N_Sala");
				sesion.Precio = resultSet.getDouble("Precio");
				res.add(sesion);
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

	@Override
	public void modificar(Sesion t) {
		// TODO Auto-generated method stub
		//No nos sirve
	}

}
