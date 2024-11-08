package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.interfaces.DAOProd_Ent;
import utils.Pair;
import vo.Prod_Ent;

public class DAOProd_EntPostgres extends DAOProd_Ent {

	public DAOProd_EntPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public void crear(Prod_Ent t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Prod_Ent(ID_Ent, Nombre_Prod) VALUES (" + t.ID_Ent + ",'" +  t.Nombre_Prod + "')";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setInt(1, t.ID_Ent);
            preparedStatement.setString(2, t.Nombre_Prod);*/
            
            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Prod_Ent t) {
        System.out.println("No es posible modificar la tabla Prod_Ent");
	}

	@Override
	public void borrar(Pair<Integer, String> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Prod_Ent WHERE ID_Ent=" + k.x + " AND Nombre_Prod = '" + k.y + "'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setInt(1, k.x);
			preparedStatement.setString(2, k.y);*/

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
	public Prod_Ent obtener(Pair<Integer, String> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		Prod_Ent res = new Prod_Ent();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Prod_Ent where ID_Ent=" + k.x + " AND Nombre_Prod = '" + k.y + "'";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Nombre_Prod = resultSet.getString("Nombre_Prod");
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
