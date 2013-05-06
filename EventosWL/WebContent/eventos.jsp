<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>DEMO - DOJO</title>
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
		codigo
		<input type="text" name ="txtCodigo" value =""/><br>
		Nombre Evento
		<input type="text" name ="txtNombreEvento" value =""/><br>
		Dirección
		<input type="text" name ="txtDireccion" value =""/><br>
		Cantidad de Asistentes 
		<input type="text" name = "txtCntAsistentes" value=""/><br>
		Responsable
		<input type="text" name = "txtResponsable" value=""/><br>
		<label for="txt_fechaEvento">Fecha del Evento</label>
		<input type="text" name="txt_fechaEvento" id="txt_fechaEvento" dojoType="dijit.form.DateTextBox" required="true" /><br>
		Tipo
		<select name="tipo">
			<option>Normal</option>
			<option>Urgente</option>
		</select><br>
	    <input type="submit" value="Aceptar" />
    </form>
   <br />
    <div id="grid"></div>
</body>
</html>