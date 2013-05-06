package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.MenuItemSigar;

import com.google.gson.Gson;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MenuServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String,Object> mapMenuItems = new HashMap<String, Object>();
		List<MenuItemSigar> lstMenuItemSigar = new ArrayList<MenuItemSigar>();
		
		//menu 1
		MenuItemSigar mi1= new MenuItemSigar();
		mi1.setIdItem("001");
		mi1.setNombre("Menu 1");
		mi1.setUrl("eventos2.jsp");
		mi1.setTipo("padre");
		
		Map<String, Object> mapReferencia1_1 = new HashMap<String, Object>();
		mapReferencia1_1.put("_reference", "002");
		Map<String, Object> mapReferencia1_2 = new HashMap<String, Object>();
		mapReferencia1_2.put("_reference", "003");
		
		List<Map<String,Object>> lstReferencias_1 = new ArrayList<Map<String,Object>>();
		lstReferencias_1.add(mapReferencia1_1);
		lstReferencias_1.add(mapReferencia1_2);
		
		mi1.setHijos(lstReferencias_1);
		
		//menu 2
		MenuItemSigar mi2= new MenuItemSigar();
		mi2.setIdItem("002");
		mi2.setNombre("Menu 2");
		mi2.setUrl("eventos.jsp");
		mi2.setTipo("hijo");
		
		//menu 3
		MenuItemSigar mi3= new MenuItemSigar();
		mi3.setIdItem("003");
		mi3.setNombre("Menu 3");
		mi3.setUrl("eventos2.jsp");
		mi3.setTipo("hijo");
		
		//lista
		lstMenuItemSigar.add(mi1);
		lstMenuItemSigar.add(mi2);
		lstMenuItemSigar.add(mi3);
		
		//mapa para la vista
		mapMenuItems.put("items", lstMenuItemSigar);
		mapMenuItems.put("label", "nombre");
		mapMenuItems.put("identifier", "idItem");
		
		String json = (new Gson()).toJson(mapMenuItems);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		System.out.println("MENU----->"+json);
		out.print(json);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	}
	
}
