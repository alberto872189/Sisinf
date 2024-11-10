package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.interfaces.DAOButaca;
import utils.Pair;
import vo.Butaca;
import vo.Comentario;

public class DAOButacaPostgres extends DAOButaca {

	public DAOButacaPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}

	@Override
	public void crear(Butaca t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Butaca(N_Butaca, Sala_N) VALUES (" + t.N_Butaca + "," + t.Sala_N + ")";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setInt(1, t.N_Butaca);
            preparedStatement.setInt(2, t.Sala_N);*/
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Butaca t) {
		
        System.out.println("No es posible modificar una Butaca");
        
	}

	@Override
	public void borrar(Pair<Integer, Integer> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Butaca WHERE N_Butaca=" + k.x.toString() + " and Sala_N=" + k.y.toString();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setInt(1, k.x);
            preparedStatement.setInt(2, k.y);*/
            

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
	public Butaca obtener(Pair<Integer, Integer> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		Butaca res = new Butaca();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Butaca where N_Butaca=" + k.x.toString() + " and Sala_N=" + k.y.toString();
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			/*preparedStatement.setInt(1, k.x);
            preparedStatement.setInt(2, k.y);*/

			while (resultSet.next())
			{
				res.N_Butaca = resultSet.getInt("N_Butaca");
				res.Sala_N = resultSet.getInt("Sala_N");
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
	public List<Butaca> obtenerSala(Integer k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		List<Butaca> res = new ArrayList<Butaca>();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Butaca where Sala_N=" + k.toString();
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			/*preparedStatement.setInt(1, k.x);
            preparedStatement.setInt(2, k.y);*/

			while (resultSet.next())
			{
				Butaca but = new Butaca();
				but.N_Butaca = resultSet.getInt("N_Butaca");
				but.Sala_N = resultSet.getInt("Sala_N");
				res.add(but);
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
