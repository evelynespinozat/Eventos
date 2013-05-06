package com.sigar.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Configuracion {

	Properties properties = null;

	public final static String CONFIG_FILE = "D:/WORKSPACE_SIGAR/a.properties";
	public final static String URL_SERVIDOR = "url_servidor";
	public final static String REPO_ENVIOS_TO_DMC = "envios_to_dmc";
	public final static String REPO_ENVIOS_TO_SYNC = "envios_to_sync";
	public final static String TIEMPO_REINTENTO_ENVIO = "time_reintento_envio";
	public final static String TIEMPO_REINTENTO_DESCARGA = "time_reintento_descarga";
	public final static String IP_NODO = "ip_nodo";
	public final static String PATH_SQLITE = "path_sqlite";
	
	public final static String PATH_RESOURCE_SIGAR = "prop.path";

	public final static String HIST_ENVIOS_TO_DMC = "hist_envios_to_dmc";
	public final static String HIST_ENVIOS_TO_SYNC = "hist_envios_to_sync";
	
	private Configuracion() {

		Properties properties = new Properties();
		FileInputStream fis;
		try {
			fis = new FileInputStream(CONFIG_FILE);
			properties.load(fis);
			this.properties = properties;
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	public static Configuracion getInstance() {
		return ConfiguracionHolder.INSTANCE;
	}

	private static class ConfiguracionHolder {
		private static final Configuracion INSTANCE = new Configuracion();
	}

	public String getProperty(String key) {
		return this.properties.getProperty(key);
	}

}
