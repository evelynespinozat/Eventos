<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>Mantener Serie Documental</title>
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
			{ name: "Serie Documental", field: "nombreEvento", width: "40%" },
			{ name: "Valor de la Serie", field: "direccion", width: "40%" },
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
        
	    var btnRegistrar = new dijit.form.Button({ 
	    	label: "Registrar",
	    	onClick: function() { 
	    		alert("Registrar");
	    		}
	    },
	    "clicRegistrar");
	    
	    var btnEditar = new dijit.form.Button({ 
	    	label: "Editar",
	    	onClick: function() { 
	    		alert("Editar");
	    		}
	    },
	    "clicEditar");
	    
	    var btnEliminar = new dijit.form.Button({
            label: "Eliminar",
            onClick: function() {
               alert("Eliminar");
            }
        },
        "clicEliminar");
		
	    var btnAgregarAUUOO = new dijit.form.Button({
            label: "Agregar a UUOO",
            onClick: function() {
               alert("Agregar Unidad Organica a Serie Documental");
            }
        },
        "clicAgregarAUUOO");
	    
	    var btnBuscar = new dijit.form.Button({
            label: "Buscar",
            onClick: function() {
               alert("Buscar");
            }
        },
        "clicBuscar");
	    
	    var btnGuardarSD = new dijit.form.Button({
            label: "Guardar",
            onClick: function() {
               alert("Guardar Serie Documental");
            }
        },
        "clicGuardarSD");
	    
	    var btnCancelarSDReg = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("Cancelar Registro de Serie Documental");
            }
        },
        "clicCancelarSDReg");
	   
	    var btnActualizarSD = new dijit.form.Button({
            label: "Actualizar",
            onClick: function() {
               alert("Actualizar Serie Documental");
            }
        },
        "clicActualizarSD");
	    
	    var btnCancelarSDAct = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("Cancelar Actualizacion de Serie Documental");
            }
        },
        "clicCancelarSDAct");
	    
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
		<fieldset >
			<table>
				<tr>
					<td>
						<button type="btnRegistrar" id="clicRegistrar"/>
						<button type="btnEditar" id="clicEditar"/>
						<button type="btnEliminar" id="clicEliminar"/>
						<button type="btnAgregarAUUOO" id="clicAgregarAUUOO"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset style="padding: 20px; border: 1px solid #000; ">
		<legend>Buscar</legend>
			<table>
				<tr>
					<td>
						<label for="LblSerieDocumental">Serie Documental : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtSerieDocumental" readonly="readonly" value =""/>
					</td>
					<td>
						<button type="btnBuscar" id="clicBuscar"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<br>
		<div id="grid"></div>
		<fieldset style="padding: 5px; border: 1px solid #000;">
		<legend>Registrar</legend>
			<table>
				<tr>
					<td>
						<label for="LblNombreSDRegistrar">Nombre : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtNombreSDRegistrar" readonly="readonly" value =""/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblDescripcionSDRegistrar">Descripción : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtDescripcionSDRegistrar" readonly="readonly" value =""/>
					</td>
				</tr>
				
				<tr>
					<td COLSPAN="2" align="center">
						<button type="btnGuardarSD" id="clicGuardarSD"/>
						<button type="btnCancelarSDReg" id="clicCancelarSDReg"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset style="padding: 5px; border: 1px solid #000;">
		<legend>Editar</legend>
			<table>
				<tr>
					<td>
						<label for="LblNombreSDAct">Nombre : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtNombreSDAct" readonly="readonly" value =""/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblDescripcionSDAct">Descripción : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtDescripcionSDAct" readonly="readonly" value =""/>
					</td>
				</tr>
				
				<tr>
					<td COLSPAN="2" align="center">
						<button type="btnActualizarSD" id="clicActualizarSD"/>
						<button type="btnCancelarSDAct" id="clicCancelarSDAct"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>