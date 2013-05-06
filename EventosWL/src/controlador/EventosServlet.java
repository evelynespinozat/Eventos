package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import modelo.Eventos;

import dao.ConexionBD;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EventosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EventosServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Calendar calendar = Calendar.getInstance();
		List<Eventos> lstEventos = new ArrayList<Eventos>();
		
		for(int i=0; i<68;i++){
			Eventos e = new Eventos();
			e.setNombreEvento("Evento "+i);
			e.setDireccion("Lima "+(10+i));
			e.setResponsable("Ysrael Valdiviezo");
			e.setCntAsistentes((i+1)*2);
			e.setFechaEvento(calendar.getTime());
			e.setTipo(i%3==0?"Social":(i%2==0?"Especial":"Corporativo"));
			lstEventos.add(e);
		}
		
		Map<String,Object> mapEventos = new HashMap<String, Object>();
		mapEventos.put("items", lstEventos);
		 
		String json = (new Gson()).toJson(mapEventos);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		System.out.println("--------->"+json);
		out.print(json);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		//HttpSession sesion = request.getSession();
		ConexionBD objbd = new ConexionBD(); 
		//System.out.println("ConexionBD: "+objbd);
		boolean exist= false;
		
		String codigo = request.getParameter("txtCodigo");
		String evento = request.getParameter("txtNombreEvento"); 
		String direccion = request.getParameter("txtDireccion");
		String cntasistentes = request.getParameter("txtCntAsistentes");
		String responsable = request.getParameter("txtResponsable");
		String tipo = request.getParameter("tipo");
		
		try
		{
			//objbd.insertarUsuario(codigo,evento,direccion,3,responsable,tipo);
			System.out.println("codigo: "+codigo);
			exist = objbd.obtenerUsuario(codigo);
			System.out.println("exist: "+exist);
		}
		catch (Exception e)
        {
			System.out.println("Error:" + e.toString() + "<br>");
        }

		out.println("<h2> Datos del Evento "+ exist +"</h2><br>");
		out.println("Evento: " + evento +"<br>");
		out.println("Direccion: " + direccion+"<br>");    
	    out.println("cantidad de asistentes: " + cntasistentes +"<br>");
	    out.println("responsable: " + responsable +"<br>");
	    out.println("Tipo: " + tipo +"<br>");
	}
	

	
	
	
}
