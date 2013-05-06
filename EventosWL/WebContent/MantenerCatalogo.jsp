<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>Insert title here</title>
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
      
        
        
        
        var btnRegistrarItem = new dijit.form.Button({
            label: "Registrar",
            onClick: function() {
               alert("Registrar Item");
            }
        },
        "clicRegistrarItem");
        
	    var btnAnadir = new dijit.form.Button({
            label: "Añadir",
            onClick: function() {
               alert("Añadir");
            }
        },
        "clicAnadir");
	    
	    
	    var btnGuardarCat = new dijit.form.Button({
            label: "Guardar",
            onClick: function() {
               alert("Guardar");
            }
        },
        "clicGuardarCat");
        
	    var btnCancelarCat = new dijit.form.Button({
            label: "Cancelar",
            onClick: function() {
               alert("Cancelar");
            }
        },
        "clicCancelarCat");
        
	    
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
						<button type="btnRegistrarItem" id="clicRegistrarItem"/>
					</td>
				</tr>
		</table>
		<div id="grid"></div>
		</form>
		<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Registro Item</legend>
			<fieldset style="padding: 30px; border: 1px solid #000;">
			<legend>Registro Item</legend>
				<table>
					<td colspan="2">
						<label for="LblSerieDocumental" >Codigo : 0001 Nombre: Estado de Transferencia</label>
					</td>
				</table>
			</fieldset>
			<fieldset style="padding: 30px; border: 1px solid #000;">
			<legend>Item</legend>
			<table align="center">
				<tr>
					<td>
						<label for="LblNombreItem" >Nombre : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtNombreItem" readonly="readonly" value ="" style="width: 70%"/>
					<td/>
				</tr>
				<tr>
					<td>
						<label for="LblAbreviaturaItem" >Abreviatura : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtAbreviaturaItem" readonly="readonly" value ="" style="width: 70%"/>
					<td/>
				</tr>
				<tr>
					<td>
						<button type="btnAnadir" id="clicAnadir"/>
					</td>
				</tr>
			</table>
			<div id="grid"></div>
			<table align="center">
				<tr>
					<td>
						<button type="btnGuardarCat" id="clicGuardarCat"/>
						<button type="btnCancelarCat" id="clicCancelarCat"/>
					</td>
				</tr>
			</table>
		</fieldset>
		
		</fieldset>
		
</body>
</html>