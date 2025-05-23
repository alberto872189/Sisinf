package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.interfaces.DAOSala;
import vo.Sala;

public class DAOSalaPostgres extends DAOSala {
	
	public DAOSalaPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public int crear(Sala t) {
	
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
            String sql = "INSERT INTO Sala(N_Sala) VALUES (" + t.n + ")";
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
	public void modificar(Sala t) {
		
        System.out.println("No es posible modificar una Sala");
		
	}

	@Override
	public void borrar(Integer k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Sala WHERE N_Sala=" + k.toString();
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
	public Sala obtener(Integer k) {
		Sala res = new Sala();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
	
			String sql = "select * from Sala where N_Sala="+k;
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.n = resultSet.getInt("N_Sala");
				
			}
			connection.close();
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
	
	public List<Sala> obtenerSalas() {
		
		List<Sala> res = new ArrayList<Sala>();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
	
			String sql = "select * from Sala";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				Sala sala = new Sala();
				sala.n = resultSet.getInt("n_sala");
				res.add(sala);
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
