package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.interfaces.DAOEnt_But;
import utils.Triplet;
import vo.Ent_But;

public class DAOEnt_ButPostgres implements DAOEnt_But {

	@Override
	public void crear(Ent_But t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Ent_But(ID_Ent, N_But, Sala_N) VALUES (value1, value2, value3)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, t.ID_Ent);
            preparedStatement.setInt(2, t.N_But);
            preparedStatement.setInt(3, t.Sala_N);
            
            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Ent_But t) {
        System.out.println("No es posible modificar la tabla Ent_But");
	}

	@Override
	public void borrar(Triplet<Integer, Integer, Integer> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Ent_But WHERE ID_Ent='value1' AND N_But = 'value2' AND Sala_N = 'value3'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, k.x);
			preparedStatement.setInt(2, k.y);
			preparedStatement.setInt(3, k.z);

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
	public Ent_But obtener(Triplet<Integer, Integer, Integer> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		Ent_But res = new Ent_But();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Ent_But where ID_Ent='value1' AND N_But = 'value2' AND Sala_N = 'value3'";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, k.x);
			preparedStatement.setInt(2, k.y);
			preparedStatement.setInt(3, k.z);
			
			ResultSet resultSet = preparedStatement.executeQuery(sql);

			while (resultSet.next())
			{
				res.N_But = resultSet.getInt("N_But");
				res.Sala_N = resultSet.getInt("Sala_N");
				res.ID_Ent = resultSet.getInt("ID_Ent");
				
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
