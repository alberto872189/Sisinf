package dao.interfaces;

import utils.Pair;
import vo.Prod_Ent;

public abstract class DAOProd_Ent extends DAO<Prod_Ent, Pair<Integer, String>>{
	public DAOProd_Ent(String name_, String pwd_) {
		super(name_, pwd_);
	}
}
