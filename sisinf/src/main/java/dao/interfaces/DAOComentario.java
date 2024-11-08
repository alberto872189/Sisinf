package dao.interfaces;

import vo.Comentario;

public abstract class DAOComentario extends DAO<Comentario, Integer>{
	public DAOComentario(String name_, String pwd_) {
		super(name_, pwd_);
	}
}