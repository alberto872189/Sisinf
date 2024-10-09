package dao.interfaces;

import vo.Sala;

public abstract class DAOSala extends DAO<Sala, Long>{
	public DAOSala(String name_, String pwd_) {
		super(name_, pwd_);
	}
}