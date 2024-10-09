package dao.interfaces;

import vo.Producto;

public abstract class DAOProducto extends DAO<Producto, String>{
	public DAOProducto(String name_, String pwd_) {
		super(name_, pwd_);
	}
}