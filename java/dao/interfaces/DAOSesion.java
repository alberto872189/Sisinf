package dao.interfaces;
import java.sql.Timestamp;

import utils.Pair;
import vo.Sesion;
public interface DAOSesion extends DAO<Sesion, Pair<Timestamp, Long>>{
}