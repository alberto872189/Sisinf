package dao.interfaces;

import utils.Triplet;
import vo.Ent_But;

public abstract class DAOEnt_But extends DAO<Ent_But, Triplet<Integer, Integer, Integer>>{
	public DAOEnt_But(String name_, String pwd_) {
		super(name_, pwd_);
	}
}