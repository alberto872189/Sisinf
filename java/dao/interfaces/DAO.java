package dao.interfaces;
public abstract class DAO<T,K>{
	protected String name;
	protected String pwd;
	
	public DAO(String name_, String pwd_) {
		name = name_;
		pwd = pwd_;
	}
	
	public abstract void crear(T t);
	public abstract void modificar(T t);
	public abstract void borrar(K k);
	public abstract T obtener(K k);
}