<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<% String path = (String) session.getAttribute("basePath"); %>

<title>Gestionar información para el calendario</title>

<!--script type="text/javascript" src="js/dojo/dojo.js"></script-->
<link rel="stylesheet" href="<%=path%>/dojo/resources/dojo.css">
<link rel="stylesheet" href="<%=path%>/dijit/themes/claro/claro.css">
<link rel="stylesheet" href="<%=path%>/dojox/grid/resources/Grid.css">
<link rel="stylesheet" href="<%=path%>/dojox/grid/resources/claroGrid.css">

<link rel="stylesheet" href="<%=path%>/dojox/grid/enhanced/resources/claro/EnhancedGrid.css">
<link rel="stylesheet" href="<%=path%>/dojox/grid/enhanced/resources/EnhancedGrid_rtl.css">

<script src="<%=path%>/dojo/dojo.xd.js" data-dojo-config="isDebug: true,parseOnLoad: true">
</script>

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
			{ name: "Código UU.OO", field: "codigo", width: "10%" },
			{ name: "Nombre UU.OO", field: "fechaInicio", width: "10%" },
			{ name: "Serie documental", field: "fechaFin", width: "15%" },
			{ name: "Archivo destino", field: "tipo", width: "10%" },
			{ name: "Año del documento", field: "estado", width: "15%" },
			{ name: "Situación", field: "opcion", width: "10%" },
			{ name: "Opciones", field: "opcion", width: "20%" },
			{ name: "check", field: "check", width: "10%" }
	    ];
		
		store = new dojo.data.ItemFileWriteStore({
			url: ""
		});
		
		grid = new dojox.grid.EnhancedGrid({
			store: store,
			structure: layout
		}, "grid");
		grid.startup();
	}

	dojo.addOnLoad(function() {
        //Creacion de Botones
        
        	var btnBuscar = new dijit.form.Button({
	            label: "Buscar",
	            onClick: function() {
	                // Do something:
	                //dojo.byId("result1").innerHTML += "Thank you! ";
	        		alert("Buscar");
	            }
	        },
	        "clicBuscar");
   
	        var btnFinalizarRegistro = new dijit.form.Button({
	            label: "Finalizar registro",
	            onClick: function() {
	                // Do something:
	                //dojo.byId("result1").innerHTML += "Thank you! ";
	        		alert("Registrar periodo convocatoria");
	            }
	        },
	        "clicFinalizarRegistro");
	        
	        var btnRegistrarInfoCal=new dijit.form.Button({
	        	label: "Registrar información para el calendario",
	        	onClick:function(){
	        		alert("Registrar información para el calendario");
	        	}
	        },
	        "clicRegistrarInfoCal");
	        
	        var btnBuscarUUOObajoJurisdiccion = new dijit.form.Button({
	            label: "Buscar",
	            onClick: function() {
	                // Do something:
	                //dojo.byId("result1").innerHTML += "Thank you! ";
	        		alert("Buscar UUOO bajo jurisdiccion");
	            }
	        },
	        "clicBuscarUUOObajoJurisdiccion");
	        
	        var btnConsultar = new dijit.form.Button({
	            label: "Consultar",
	            onClick: function() {
	                // Do something:
	                //dojo.byId("result1").innerHTML += "Thank you! ";
	        		alert("Consultar");
	            }
	        },
	        "clicConsultar");
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
	<form action="LoginServlet" method="post">
		<div align="right">
			<button type="btnFinalizarRegistro" id="clicFinalizarRegistro"/>
			<button type="btnRegistrarInfoCal" id="clicRegistrarInfoCal"/>
		</div>
		<fieldset style="padding: 5px; border: 1px solid #000;">
			<legend>Ejercicio Anual</legend>
			<table>
				<tr>
					<td>
						<label for="tipo">Calendario:</label>
					</td>
					<td>
						<select dojoType="dijit.form.ComboBox" id="tipo" name="tipo">
							<option>UUOO-A-2012</option>
							<option>UUOO-A-2013</option>
						</select>
						<button type="btnBuscar" id="clicBuscar"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<br>
		<fieldset style="padding: 5px; border: 1px solid #000;">
			<legend>Datos informativos de periodo de convocatoria</legend>
			<table>
				<tr>
					<td>
						<label for="txtIniPerConvocatoria">Inicio de periodo de convocatoria:</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtIniPerConvocatoria" readonly="readonly" value =""/>
					</td>
					<td>
						<label for="txtTipoPerConvocatoria">Tipo de periodo de convocatoria:</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtTipoPerConvocatoria" readonly="readonly" value =""/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="txtFinPerConvocatoria">Fin de periodo de convocatoria:</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtFinPerConvocatoria" readonly="readonly" value =""/>
					</td>
					<td>
						<label for="txtCodPerConvocatoria">Código de periodo de convocatoria:</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtCodPerConvocatoria" readonly="readonly" value =""/>
					</td>
				</tr>
			</table>
		</fieldset>
		<br>
		<fieldset style="padding: 5px; border: 1px solid #000;">
			<legend>Datos de consulta</legend>
			<table>
				<tr>
					<td>
						<label for="rdbUUOOPropInfo">UU.OO propietaria de información:</label>
					</td>
					<td>
						<input type="radio" name="rdbUUOOPropInfo" id="radioOne" checked value="gestion"/> 
						<label for="radioOne">Archivo Gestión</label> <br />
					</td>
					<td>
						<label for="txtUUOObajoJurisdiccion">UU.OO's bajo jurisdicción:</label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtUUOObajoJurisdiccion" readonly="readonly" value ="Yesmimon"/>
					</td>
					<td>
						<button type=btnBuscarUUOObajoJurisdiccion id="clicBuscarUUOObajoJurisdiccion" />
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<input type="radio" name="rdbUUOOPropInfo" id="radioTwo" value="jurisdiccion"/> 
    					<label for="radioTwo">Jurisdicción</label> <br />
					</td>
					<td>
						<label for="cboArchivoDestino">Archivo destino:</label>
					</td>
					<td>
						<select dojoType="dijit.form.ComboBox" id="cboArchivoDestino" name="cboArchivoDestino">
							<option>TODOS</option>
							<option>A.CENTRAL</option>
							<option>A.PERIFERICO</option>
							<option>A.DESCONCENTRADO</option>
						</select>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<input type="radio" name="rdbUUOOPropInfo" id="radioTree" value="todos"/> 
    					<label for="radioTwo">Todos</label> <br />
					</td>
					<td>
						<label for="cboSituacion">Situación:</label>
					</td>
					<td>
						<select dojoType="dijit.form.ComboBox" id="cboSituacion" name="cboSituacion">
							<option>TODOS</option>
							<option>ANTICIPADO</option>
							<option>REZAGADO</option>
							<option>REGULAR</option>
						</select>
					</td>
					<td>
						<button type=btnConsultar id="clicConsultar" />
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset style="padding: 5px; border: 1px solid #000;">
			<legend>Lista de información para el calendario</legend>
			<div id="grid"></div>
			<br>
		</fieldset>
    </form>
    <br />
</body>
</html>