package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConexionBD {

	public static Connection conexion() throws Exception
	{
			String Driver = "com.informix.jdbc.IfxDriver";
			//String url = "jdbc:informix-sqli://10.10.0.78:9091:INFORMIXSERVER=prueba;Database=bdprueba;user=informix;password=bgyz0448*";
			String url = "jdbc:informix-sqli://10.10.0.78:9091:INFORMIXSERVER=prueba;Database=bdprueba;user=informix;password=bgyz0448*";
			Class.forName(Driver);
			return DriverManager.getConnection(url);	
	}
	
	public boolean obtenerUsuario(String codigo) throws Exception  
	{		
		String sql= "select * from persona where id=?";
		Connection cn = conexion();	
		PreparedStatement pst= cn.prepareStatement(sql);
		pst.setString(1, codigo);
		ResultSet rs= pst.executeQuery();
		
		return rs.next(); 
	}
	
	public int insertarUsuario(String cod, String nombre, String direccion, int cntasistentes, String responsable,String tipo) throws Exception
	{
		String sql= "insert into tevento values(?,?,?,?,?,?)";
		Connection cn = conexion();
		PreparedStatement pst = cn.prepareStatement(sql);
		pst.setString(1, cod );
		pst.setString(2, nombre);
		pst.setString(3, direccion);
		pst.setInt(4, cntasistentes);
		pst.setString(5, responsable);
		pst.setString(6, tipo);
		int flag = pst.executeUpdate();
		
		return flag;
	}


	
}
