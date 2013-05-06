<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>Mantener Tipo Documental</title>
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
			{ name: "Nombre", field: "nombreEvento", width: "40%" },
			{ name: "Descripción", field: "direccion", width: "50%" }
			
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
	 
	    var btnRegistrar = new dijit.form.Button({
            label: "Registrar",
            onClick: function() {
               alert("Registrar Tipo Documental");
            }
        },
        "clicRegistrar");
	    
	    var btnGuardarTD = new dijit.form.Button({
            label: "Guardar",
            onClick: function() {
               alert("Guardar Tipo Documental");
            }
        },
        "clicGuardarTD");
	    
	    var btnCancelarTD = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("Cancelar Tipo Documental");
            }
        },
        "clicCancelarTD");
	    
	    var btnAceptarSD = new dijit.form.Button({
            label: "Aceptar",
            onClick: function() {
               alert("Aceptar Serie Documental");
            }
        },
        "clicAceptarSD");
	    
	    var btnCancelarSD = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("Cancelar Serie Documental");
            }
        },
        "clicCancelarSD");

	    
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
		<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Datos Basicos</legend>
			<table align="center">
				<tr>
					<td>
						<label for="LblSerieDocumental">Serie Documental</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtSerieDocumental" readonly="readonly" value ="" />
					</td>
					<td>
						<button type="btnBuscar" id="clicBuscar"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Tipos Documentales</legend>
			<table>
				<tr>
					<td>
						<button type="btnRegistrar" id="clicRegistrar"/>
					</td>
					<td>
						<button type="btnEditar" id="clicEditar"/>
					</td>
					<td>
						<button type="btnEliminar" id="clicEliminar"/>
					</td>
				</tr>
			</table>
			<div id="grid"></div>
		</fieldset>
	</form>
	<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Registrar</legend>
			<table>
				<tr>
					<td>
						<label for="LblNombreTD">Nombre</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtNombre" readonly="readonly" value ="" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblNombreTD">Descripción</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtDescripcion" readonly="readonly" value ="" />
					</td>
				</tr>
				<tr>
					<td>
						<button type="btnGuardarTD" id="clicGuardarTD"/>
					</td>
					<td>
						<button type="btnCancelarTD" id="clicCancelarTD"/>
					</td>
				</tr>
			</table>
			<div id="grid"></div>
	</fieldset>
	<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Buscar Series Documentales</legend>
			<table>
				<tr>
					<td>
						<label for="LblCodigoSD">Codigo</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtCodigoSD" readonly="readonly" value ="" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblNombreSD">Nombre</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtNombreSD" readonly="readonly" value ="" />
					</td>
				</tr>
			</table>
			<div id="grid"></div>
			<table>
				<tr>
					<td>
						<button type="btnAceptarSD" id="clicAceptarSD"/>
					</td>
					<td>
						<button type="btnCancelarSD" id="clicCancelarSD"/>
					</td>
				</tr>
			</table>
	</fieldset>
</body>
</html>