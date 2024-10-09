package dao.interfaces;

import vo.Cliente;

public abstract class DAOCliente extends DAO<Cliente, String>{
	public DAOCliente(String name_, String pwd_) {
		super(name_, pwd_);
	}
}