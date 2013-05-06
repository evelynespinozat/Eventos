package modelo;

import java.util.List;
import java.util.Map;


public class MenuItemSigar {

	private String idItem;
	private String nombre;
	private String url;
	private String tipo;
	
	private List<Map<String,Object>> hijos;

	
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getIdItem() {
		return idItem;
	}

	public void setIdItem(String idItem) {
		this.idItem = idItem;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<Map<String, Object>> getHijos() {
		return hijos;
	}

	public void setHijos(List<Map<String, Object>> hijos) {
		this.hijos = hijos;
	}

	
}
