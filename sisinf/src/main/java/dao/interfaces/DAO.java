package dao.interfaces;
public abstract class DAO<T,K>{
	protected String name;
	protected String pwd;
	protected String url;
	
	public DAO(String name_, String pwd_) {
		name = name_;
		pwd = pwd_;
		url = "jdbc:postgresql://sisinf-database:5433/sisinf_grupo_c05";//"jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
	}
	
	public abstract int crear(T t);
	public abstract void modificar(T t);
	public abstract void borrar(K k);
	public abstract T obtener(K k);
}