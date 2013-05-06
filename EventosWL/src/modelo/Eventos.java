package modelo;

import java.util.Date;

public class Eventos {

	private String nombreEvento;
	private String direccion;
	private int cntAsistentes;
	private String responsable;
	private String tipo;
	private Date fechaEvento;
	
	public String getNombreEvento() {
		return nombreEvento;
	}
	
	public void setNombreEvento(String nombreEvento) {
		this.nombreEvento = nombreEvento;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getCntAsistentes() {
		return cntAsistentes;
	}
	public void setCntAsistentes(int cntAsistentes) {
		this.cntAsistentes = cntAsistentes;
	}
	
	public String getResponsable() {
		return responsable;
	}
	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public Date getFechaEvento() {
		return fechaEvento;
	}
	public void setFechaEvento(Date fechaEvento) {
		this.fechaEvento = fechaEvento;
	}
	

	
}
