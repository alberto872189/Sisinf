package dao.interfaces;

import vo.Entrada;

public abstract class DAOEntrada extends DAO<Entrada, Integer>{
	public DAOEntrada(String name_, String pwd_) {
		super(name_, pwd_);
	}
}