package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.interfaces.DAOCliente;
import vo.Cliente;

public class DAOClientePostgres extends DAOCliente {
	
	public DAOClientePostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}

	@Override
	public int crear(Cliente t) {
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
            String sql = "INSERT INTO Cliente(Correo, Contrasenia, Nombre) VALUES ('" + t.Correo + "','" + t.Contrasenia + "','" + t.Nombre + "')";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return 1;
	}

	@Override
	public void modificar(Cliente t) {
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
            String sql = "UPDATE Cliente SET Contrasenia = '" + t.Contrasenia + "', Nombre = '" + t.Nombre + "' WHERE Correo='" + t.Correo + "'";
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
	public void borrar(String k) {
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
            String sql = "DELETE FROM Cliente WHERE Correo='" + k + "'";
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
	public Cliente obtener(String k) {
		Cliente res = new Cliente();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
	
			String sql = "select * from Cliente where Correo='" + k + "'";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Correo = resultSet.getString("Correo");
				res.Contrasenia = resultSet.getString("Contrasenia");
				res.Nombre = resultSet.getString("Nombre");
				
			}
			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}

}
