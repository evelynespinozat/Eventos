<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>Mantener Detalle de Serie Documental</title>
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
			{ name: "Serie Documental", field: "direccion", width: "20%" },
			{ name: "UUOO Asignada", field: "direccion", width: "20%" },
			{ name: "AG", field: "direccion", width: "10%" },
			{ name: "AD", field: "direccion", width: "10%" },
			{ name: "Fecha de Creación", field: "direccion", width: "10%" },
			{ name: "Estado", field: "direccion", width: "10%" },
			{ name: "Opciones", field: "direccion", width: "10%" }
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
      
	    var btnEliminar = new dijit.form.Button({
            label: "Eliminar",
            onClick: function() {
               alert("Eliminar");
            }
        },
        "clicEliminar");
	    
	    var btnEditar = new dijit.form.Button({
            label: "Editar",
            onClick: function() {
               alert("Editar");
            }
        },
        "clicEditar");
	    
	    var btnBuscar = new dijit.form.Button({
            label: "Buscar",
            onClick: function() {
               alert("Buscar");
            }
        },
        "clicBuscar");
	 
	    var btnBuscarUUOO = new dijit.form.Button({
            label: "BuscarUUOO",
            onClick: function() {
               alert("Buscar Unidad Organica");
            }
        },
        "clicBuscarUUOO");
	    
	    var btnAceptarDarBaja = new dijit.form.Button({
            label: "Aceptar",
            onClick: function() {
               alert("Aceptar Dar de Baja");
            }
        },
        "clicAceptarDarBaja");
	    
	    var btnCancelarDarBaja = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("Cancelar Dar de Baja");
            }
        },
        "clicCancelarDarBaja");
	    
	    var btnAceptarRevertirBaja = new dijit.form.Button({
            label: "Aceptar",
            onClick: function() {
               alert("Aceptar Revertir Baja");
            }
        },
        "clicAceptarRevertirBaja");
	    
	    var btnCancelarRevertirBaja = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("Cancelar Revertir Baja");
            }
        },
        "clicCancelarRevertirBaja");
	    
	    
	    var btnGenerarSustLegal = new dijit.form.Button({
            label: "Generar",
            onClick: function() {
               alert("Generar Sustento Legal");
            }
        },
        "clicGenerarSustLegal");
	    
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
		<table>
				<tr>
					<td>
						<button type="btnEditar" id="clicEditar"/>
						<button type="btnEliminar" id="clicEliminar"/>
					</td>
				</tr>
		</table>
		<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Datos Basicos</legend>
			<table align="center">
				<tr>
					<td>
						<label for="LblSerieDocumental" >Serie Documental : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtSerieDocumental" readonly="readonly" value ="" style="width: 70%"/>
					<td/>
					<td>
						<label for="LblNivelArchivo">Nivel de Archivo : </label>
					</td>
					<td>
						<select name="CboNivelArchivo" id="CboNivelArchivo" dojoType="dijit.form.ComboBox" style="width: 70%">
							<option>Central</option>
							<option>Desconcentrado</option>
						</select>
					<td/>
					<td>
						<label for="LblUnidadOrganica">Unidad Organica : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtUnidadOrganica" readonly="readonly" value =""style="width: 70%" />
					<td/>
					<td>
						<button type="btnBuscarUUOO" id="clicBuscarUUOO"/>
					</td>
					<td>
						<button type="btnBuscar" id="clicBuscar"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<div id="grid"></div>
		<table>
			<tr>
				<td>
					<label for="LblUnidadOrganica">Se muestra las Series Documentales de la Unidad Organica UUOO1</label>
				</td>
			</tr>
		</table>
		
	</form>
	<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Dar de Baja</legend>
			<table align="center">
				<tr>
					<td>
						<label for="LblSustentoLegal" >Sustento Legal : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtSustentoLegal" readonly="readonly" value ="" />
					<td/>
					<td>
						<button type="btnGenerarSustLegal" id="clicGenerarSustLegal"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="btnAceptarDarBaja" id="clicAceptarDarBaja"/>
						<button type="btnCancelarDarBaja" id="clicCancelarDarBaja"/>
					</td>
				</tr>
			</table>
		</fieldset>	
			<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Revertir Baja</legend>
			<table align="center">
				<tr>
					<td>
						<label for="LblMotivo" >Motivo : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtMotivo" readonly="readonly" value ="" />
					<td/>
				</tr>
				<tr>
					<td >
						<button type="btnAceptarRevertirBaja" id="clicAceptarRevertirBaja"/>
					</td>
					<td >
						<button type="btnCancelarRevertirBaja" id="clicCancelarRevertirBaja"/>
					</td>
				</tr>
			</table>
		</fieldset>	
						
</body>
</html>