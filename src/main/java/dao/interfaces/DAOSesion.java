package dao.interfaces;
import java.util.Date;

import utils.Pair;
import vo.Sesion;
public abstract class DAOSesion extends DAO<Sesion, Pair<Date, Integer>>{
	public DAOSesion(String name_, String pwd_) {
		super(name_, pwd_);
	}
}