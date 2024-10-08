public interface DAO<T,K>{
	public void crear(T t);
	public void modificar(T t);
	public void borrar(K k);
	public T obtener(K k);
}