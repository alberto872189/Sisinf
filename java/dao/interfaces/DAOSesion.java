package dao.interfaces;
import java.sql.Timestamp;

import utils.Pair;
import vo.Sesion;
public abstract class DAOSesion extends DAO<Sesion, Pair<Timestamp, Long>>{
	public DAOSesion(String name_, String pwd_) {
		super(name_, pwd_);
	}
}