package dao.interfaces;

import utils.Pair;
import vo.Butaca;

public abstract class DAOButaca extends DAO<Butaca, Pair<Integer, Integer>>{
	public DAOButaca(String name_, String pwd_) {
		super(name_, pwd_);
	}
}