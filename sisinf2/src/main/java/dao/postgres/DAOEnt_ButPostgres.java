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

public class DAOEnt_ButPostgres extends DAOEnt_But {

	public DAOEnt_ButPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public int crear(Ent_But t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Ent_But(ID_Ent, N_But, Sala_N) VALUES (" + t.ID_Ent + "," + t.N_But + "," + t.Sala_N + ")";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setInt(1, t.ID_Ent);
            preparedStatement.setInt(2, t.N_But);
            preparedStatement.setInt(3, t.Sala_N);*/
            
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
	public void modificar(Ent_But t) {
        System.out.println("No es posible modificar la tabla Ent_But");
	}

	@Override
	public void borrar(Triplet<Integer, Integer, Integer> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Ent_But WHERE ID_Ent=" + k.x + " AND N_But = " + k.y + " AND Sala_N = " + k.z;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setInt(1, k.x);
			preparedStatement.setInt(2, k.y);
			preparedStatement.setInt(3, k.z);*/

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
		Ent_But res = new Ent_But();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Ent_But where ID_Ent=" + k.x + " AND N_But = " + k.y + " AND Sala_N = " + k.z;
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.N_But = resultSet.getInt("N_But");
				res.Sala_N = resultSet.getInt("Sala_N");
				res.ID_Ent = resultSet.getInt("ID_Ent");
				
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
