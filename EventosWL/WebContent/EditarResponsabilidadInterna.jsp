<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>Editar Responsabilidades Internas</title>
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
			{ name: "Evento", field: "nombreEvento", width: "20%" },
			{ name: "Direccion", field: "direccion", width: "25%" },
			{ name: "Asistentes", field: "cntAsistentes", width: "10%" },
			{ name: "Responsable", field: "responsable", width: "20%" },
			{ name: "Tipo", field: "tipo", width: "10%" },
			{ name: "Fecha Evento", field: "fechaEvento", width: "15%" }
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
        
	    var btnActualizar = new dijit.form.Button({ 
	    	label: "Actualizar",
	    	onClick: function() { 
	    		alert("Actualizar");
	    		}
	    },
	    "clicActualizar");
	    
	    var btnCancelar = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("Cancelar");
            }
        },
        "clicCancelar");
			    
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
		<br>
		<fieldset style="padding: 30px; border: 1px solid #000; ">
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
						<button type="btnActualizar" id="clicActualizar"/>
					</td>
					<td>
						<button type="btnCancelar" id="clicCancelar"/>
					</td>
			</tr>
		</table>
	</form>
</body>
</html>