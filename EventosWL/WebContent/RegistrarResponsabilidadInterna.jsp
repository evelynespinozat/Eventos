<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>Registrar</title>
<!--script type="text/javascript" src="js/dojo/dojo.js"></script-->
<link rel="stylesheet" href="<%=path%>/dojo/resources/dojo.css">
<link rel="stylesheet" href="<%=path%>/dijit/themes/claro/claro.css">
<link rel="stylesheet" href="<%=path%>/dojox/grid/resources/Grid.css">
<link rel="stylesheet" href="<%=path%>/dojox/grid/resources/claroGrid.css">
<link rel="stylesheet" href="<%=path%>/dojox/grid/enhanced/resources/claro/EnhancedGrid.css">
<link rel="stylesheet" href="<%=path%>/dojox/grid/enhanced/resources/EnhancedGrid_rtl.css">
<script src="<%=path%>/dojo/dojo.xd.js" data-dojo-config="isDebug: true,parseOnLoad: true"></script>
<script type="text/javascript">
	//table grid
	dojo.require("dojox.grid.DataGrid");
	dojo.require("dojox.grid.EnhancedGrid");
	dojo.require("dojox.grid.enhanced.plugins.Pagination");
	dojo.require("dojo.data.ItemFileWriteStore");
	//datepicker
	dojo.require("dijit.form.DateTextBox");
	dojo.require("dijit.form.ComboBox");
	dojo.require("dijit.form.Button");
	dojo.require("dijit.form.RadioButton");
	var grid, store, layout;
	dojo.ready(function(){
		cargarData();
	});
	
	function cargarData(){
	    layout = [
			{ name: "Codigo", field: "nombreEvento", width: "10%" },
			{ name: "Nombres Apellidos", field: "direccion", width: "30%" },
			{ name: "Correo", field: "cntAsistentes", width: "30%" },
			{ name: "Anexo", field: "responsable", width: "10%" }
	    ];
		
		store = new dojo.data.ItemFileWriteStore({
			url: "EventosServlet"
		});
		
		store.fetch({
			query: { id: "*" },
			onComplete: function(items2){
				grid = new dojox.grid.EnhancedGrid({
				store: store,
					items2: items2,
					rowSelector: '20px',
					plugins: {
				          pagination: {
				              pageSizes: ["25", "50", "100", "All"],
				              description: true,
				              sizeSwitch: true,
				              pageStepper: true,
				              gotoButton: true,
				                      /*page step to be displayed*/
				              maxPageStep: 4,
				                      /*position of the pagination bar*/
				              position: "bottom"
				          }
					},
					structure: layout
				}, "grid");
				
				grid.startup();
			}
		});
	}
	
	dojo.addOnLoad(function() {
        //Creacion de Botones
        
	    
	  
	    
	    var btnBuscar = new dijit.form.Button({
            label: "Buscar",
            onClick: function() {
               alert("Buscar");
            }
        },
        "clicBuscar");
		
	    var btnGuardar = new dijit.form.Button({ 
	    	label: "Guardar",
	    	onClick: function() { 
	    		alert("Guardar");
	    		}
	    },
	    "clicGuardar");
	    
	    var btnCancelar = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("Cancelar");
            }
        },
        "clicCancelar");
	 
	    var btnAceptarResponsable = new dijit.form.Button({
            label: "Aceptar",
            onClick: function() {
               alert("AceptarResponsable");
            }
        },
        "clicAceptarResponsable");

	    var btnCancelarResponsable = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("CancelarResponsable");
            }
        },
        "clicCancelarResponsable");

	    
	    
});
</script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/dojox/grid/DataGrid.xd.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/dojox/grid/EnhancedGrid.xd.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/dojo/data/ItemFileWriteStore.xd.js"></script>	
<script type="text/javascript" charset="utf-8" src="<%=path%>/dojo/data/ItemFileReadStore.xd.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/dojox/grid/nls/DataGrid_es.xd.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/dojo/data/util/filter.xd.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/dojo/data/util/simpleFetch.xd.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/dojo/data/util/sorter.xd.js"></script>
</head>
<body class="claro">
	<form action="EventosServlet" method="post">
		<fieldset style="padding: 20px; border: 1px solid #000; ">
		<legend>Datos de Busqueda</legend>
			<table>
				<tr>
					<td>
						<label for="LblRegTrabajador">Reg. Trabajador : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtRegTrabajador" readonly="readonly" value =""/>
					</td>
					<td>
						<button type="btnBuscar" id="clicBuscar"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset style="padding: 20px; border: 1px solid #000; ">
		<legend>Datos Usuario SIGAR</legend>
			<table align="center">
				<tr>
					<td>
						<label for="LblNombre">Nombre : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtNombre" readonly="readonly" value =""/>
					</td>	
				</tr>
				<tr>
					<td>
						<label for="LblApellido">Apellido : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtApellido" readonly="readonly" value =""/>
					</td>
				</tr>
				<tr>	
					<td>
						<label for="LblCodigoSunat">Codigo Sunat : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtCodigoSunat" readonly="readonly" value =""/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblResponsabilidadInterna">Responsabilidad Interna : </label>
					</td>
					<td>
						<select name="CboResponsabilidadInterna" id="CboResponsabilidadInterna" dojoType="dijit.form.ComboBox">
							<option>Presidente del CED</option>
							<option>Analista de Procesos</option>
							<option>Jefe de Procesos</option>
						</select>
					</td>
				</tr>
			</table>
		</fieldset>	
		<table align="center" style="padding: 30px">
			<tr>	
				<td>
					<button type="btnGuardar" id="clicGuardar"/>
				</td>
				<td>
					<button type="btnCancelar" id="clicCancelar"/>
				</td>
			</tr>
		</table>
		<fieldset style="padding: 5px; border: 1px solid #000;">
		<legend>Buscar Responsable Interno</legend>
			<table>
				<tr>
					<td>
						<label for="LblCodigoResponsable">Codigo : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtCodigoResponsable" readonly="readonly" value =""/>
					</td>
					<td>
						<label for="LblNombreResponsable">Nombre : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtNombreResponsable" readonly="readonly" value =""/>
					</td>
					<td>
						<label for="LblApellidoResponsable">Apellido : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtApellidoResponsable" readonly="readonly" value =""/>
					</td>
					<td >
						<button type="btnAceptarResponsable" id="clicAceptarResponsable"/>
						<button type="btnCancelarResponsable" id="clicCancelarResponsable"/>
					</td>
				</tr>			
			</table>
			<div id="grid"></div>
		</fieldset>
	</form>
</body>
</html>