package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.interfaces.DAOProducto;
import vo.Comentario;
import vo.Producto;

public class DAOProductoPostgres extends DAOProducto {
	
	public DAOProductoPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public void crear(Producto t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Producto(Nombre, Precio, Disponible) VALUES ('" + t.Nombre + "'," + t.Precio + "," + t.Disponible + ")";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setString(1, t.Nombre);
            preparedStatement.setDouble(2, t.Precio);
            preparedStatement.setBoolean(3, t.Disponible);*/
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Producto t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "UPDATE Producto SET Precio = " + t.Precio + ", Disponible = " + t.Disponible + " WHERE Nombre='" + t.Nombre + "'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setDouble(1, t.Precio);
            preparedStatement.setBoolean(2, t.Disponible);
            preparedStatement.setString(3, t.Nombre);*/
            

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
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Producto WHERE Nombre='" + k + "'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            //preparedStatement.setString(1, k);
            

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
	public Producto obtener(String k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		Producto res = new Producto();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Producto where Nombre='" + k + "'";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Nombre = resultSet.getString("Nombre");
				res.Precio = resultSet.getDouble("Precio");
				res.Disponible = resultSet.getBoolean("Disponible");
				
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

	public List<Producto> obtenerProductos() {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		List<Producto> res = new ArrayList<Producto>();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Producto";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				Producto producto = new Producto();
				producto.Nombre = resultSet.getString("Nombre");
				producto.Precio = resultSet.getDouble("Precio");
				producto.Disponible = resultSet.getBoolean("Disponible");
				res.add(producto);
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
