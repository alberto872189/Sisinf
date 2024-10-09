package dao.interfaces;

import vo.Administrador;

public abstract class DAOAdministrador extends DAO<Administrador, String>{
	public DAOAdministrador(String name_, String pwd_) {
		super(name_, pwd_);
	}
}