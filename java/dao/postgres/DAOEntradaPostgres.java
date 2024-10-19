package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import dao.interfaces.DAOEntrada;
import vo.Entrada;

public class DAOEntradaPostgres extends DAOEntrada {

	public DAOEntradaPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public void crear(Entrada t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Entrada(Correo, Sesion_Hora, N_Sala) VALUES ('" + t.Correo + "','" + t.Sesion_Hora + "'," +  t.N_Sala + ")";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setString(1, t.Correo);
            preparedStatement.setTimestamp(2, t.Sesion_Hora);
            preparedStatement.setInt(3, t.N_Sala);*/
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Entrada t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "UPDATE Entrada SET Correo = '" + t.Correo + "', Sesion_Hora = '" + t.Sesion_Hora + "', N_Sala = " + t.N_Sala + " WHERE ID=" + t.ID;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setString(1, t.Correo);
            preparedStatement.setTimestamp(2, t.Sesion_Hora);
            preparedStatement.setInt(3, t.N_Sala);
            preparedStatement.setInt(4, t.ID);*/
            

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

            //preparedStatement.setInt(1, k);

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
	
			String sql = "select * from Entrada where ID = " + k;
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			//preparedStatement.setInt(1, k);
			
			ResultSet resultSet = preparedStatement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Sesion_Hora = resultSet.getTimestamp("Sesion_Hora");
				res.Correo = resultSet.getString("Correo");
				res.N_Sala = resultSet.getInt("N_Sala");
				res.ID = resultSet.getInt("ID");
				
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
