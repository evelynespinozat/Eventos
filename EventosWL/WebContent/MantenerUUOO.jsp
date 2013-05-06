<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>Mantenimiento de UUOO</title>
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
	var grid, store, layout;
	dojo.ready(function(){
		cargarData();
	});
	
	function cargarData(){
	    layout = [
			{ name: "Codigo", field: "nombreEvento", width: "20%" },
			{ name: "Nombre", field: "direccion", width: "40%" },
			{ name: "Estado", field: "cntAsistentes", width: "10%" },
			{ name: "F.Vigencia", field: "responsable", width: "10%" },
			{ name: "Opciones", field: "tipo", width: "10%" }
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
	    
	    var btnAgregar = new dijit.form.Button({
            label: "Agregar",
            onClick: function() {
               alert("Agregar");
            }
        },
        "clicAgregar");
	    
	    var btnAceptarDarBaja = new dijit.form.Button({
            label: "Aceptar",
            onClick: function() {
               alert("AceptarDarBaja");
            }
        },
        "clicAceptarDarBaja");
	    
	    var btnCancelarDarBaja = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("CancelarDarBaja");
            }
        },
        "clicCancelarDarBaja");
	    
	    var btnAceptarRevertirbaja = new dijit.form.Button({
            label: "Aceptar",
            onClick: function() {
               alert("AceptarRevertirBaja");
            }
        },
        "clicAceptarRevertirBaja");
	    
	    var btnCancelarRevertirBaja = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("CancelarRevertirBaja");
            }
        },
        "clicCancelarRevertirBaja");
	    
	    var btnAceptarBusqueda = new dijit.form.Button({
            label: "Aceptar",
            onClick: function() {
               alert("AceptarBusqueda");
            }
        },
        "clicAceptarBusqueda");
	    
	    var btnCancelarBusqueda = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("CancelarBusqueda");
            }
        },
        "clicCancelarBusqueda");
	    
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
		<fieldset>
			<table>
				<tr>
					<td>
						<button type="btnRegistrar" id="clicRegistrar"/>
						<button type="btnEditar" id="clicEditar"/>
						<button type="btnEliminar" id="clicEliminar"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset style="padding: 5px; border: 1px solid #000;">
			<legend>Buscar</legend>
			<table>
				<tr>
					<td>
						<label for="LblCodigo">Codigo:</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtCodigo" readonly="readonly" value =""/>
					<td/>
					<td>
						<label for="LblNombre">Nombre:</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtNombre" readonly="readonly" value =""/>
					</td>
					<td>
						<button type="btnBuscar" id="clicBuscar"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
	<br/>
	<div id="grid"></div>
	<br>
	<fieldset style="padding: 5px; border: 1px solid #000;">
	<legend>Dar de Baja</legend>
		<table>
			<tr>
				<td COLSPAN="3">
					<input dojoType="dijit.form.TextBox" name ="txtSustentoLegal" readonly="readonly" value ="Unidad Organica a dar de Baja  Codigo:1000 Nombre: Unidad Organica 1 " style="width: 100%"/>
				</td>
			</tr>
			<tr>
				<td>
					<label for="LblSustentoLegal">Sustento Legal:</label>
				</td>
				<td>
					<input dojoType="dijit.form.TextBox" name ="txtSustentoLegal" readonly="readonly" value =""/>
				</td>
				<td>
					<button type="btnAgregar" id="clicAgregar"/>
				</td>
			</tr>
			<tr>
				<td COLSPAN="3" align="center">
					<button type="btnAceptarDarBaja" id="clicAceptarDarBaja"/>
					<button type="btnCancelarDarBaja" id="clicCancelarDarBaja"/>
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset style="padding: 5px; border: 1px solid #000;">
	<legend>Revertir Baja</legend>
		<table>
			<tr>
				<td>
					<label for="LblMotivo">Motivo:</label>
				</td>
				<td>
					<input dojoType="dijit.form.TextBox" name ="txtMotivo" readonly="readonly" value =""/>
				</td>
			</tr>
			<tr>
				<td COLSPAN="2" align="center">
					<button type="btnAceptarRevertirBaja" id="clicAceptarRevertirBaja"/>
					<button type="btnCancelarRevertirBaja" id="clicCancelarRevertirBaja"/>
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset style="padding: 5px; border: 1px solid #000;">
	<legend>Buscar Unidad Organica</legend>
		<table>
			<tr>
				<td>
					<label for="LblcodigoUUOO">Codigo : </label>
				</td>
				<td>
					<input dojoType="dijit.form.TextBox" name ="txtCodigoUUOO" readonly="readonly" value =""/>
				</td>
			</tr>
			<tr>
				<td>
					<label for="LblNombreUUOO">Nombre :</label>
				</td>
				<td>
					<input dojoType="dijit.form.TextBox" name ="txtNombreUUOO" readonly="readonly" value =""/>
				</td>
			</tr>
			<tr>
				<td COLSPAN="2" align="center">
					<button type="btnAceptarBusqueda" id="clicAceptarBusqueda"/>
					<button type="btnCancelarBusqueda" id="clicCancelarBusqueda"/>
				</td>
			</tr>
		</table>
	</fieldset>
</body>
</html>