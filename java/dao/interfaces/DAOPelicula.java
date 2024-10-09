package dao.interfaces;

import vo.Pelicula;

public abstract class DAOPelicula extends DAO<Pelicula, String>{
	public DAOPelicula(String name_, String pwd_) {
		super(name_, pwd_);
	}
}