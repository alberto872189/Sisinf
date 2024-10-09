package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import dao.interfaces.DAOSesion;
import utils.Pair;
import vo.Sesion;

public class DAOSesionPostgres extends DAOSesion {
	
	public DAOSesionPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public void crear(Sesion t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) VALUES (value1, value2, value3, value4)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setTimestamp(1, t.Sesion_Hora);
            preparedStatement.setString(2, t.Tit_Pel);
            preparedStatement.setInt(3, t.N_Sala);
            preparedStatement.setDouble(4, t.Precio);
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Sesion t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "UPDATE Sesion SET Tit_Pel = 'value1', Precio = 'value2' WHERE Sesion_Hora='value3' and N_Sala='value4'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, t.Tit_Pel);
            preparedStatement.setDouble(2, t.Precio);
            preparedStatement.setTimestamp(3, t.Sesion_Hora);
            preparedStatement.setInt(3, t.N_Sala);
            

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
	public void borrar(Pair<Timestamp, Long> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Sesion WHERE Sesion_Hora='value1' and N_Sala='value2'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setTimestamp(1, k.x);
            preparedStatement.setInt(2, k.y.intValue());
            

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
	public Sesion obtener(Pair<Timestamp, Long> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		Sesion res = new Sesion();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Sesion where Sesion_Hora='value1' and N_Sala='value2'";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setTimestamp(1, k.x);
            preparedStatement.setInt(2, k.y.intValue());
			
			ResultSet resultSet = preparedStatement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Sesion_Hora = resultSet.getTimestamp("Sesion_Hora");
				res.Tit_Pel = resultSet.getString("Tit_Pel");
				res.N_Sala = resultSet.getInt("N_Sala");
				res.Precio = resultSet.getDouble("Precio");
				
			}
			connection.close();
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}

}
