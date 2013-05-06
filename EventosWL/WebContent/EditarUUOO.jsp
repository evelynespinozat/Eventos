<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>Ediar UUOO</title>
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
			{ name: "Codigo", field: "nombreEvento", width: "20%" },
			{ name: "Nombre", field: "direccion", width: "40%" },
			{ name: "Estado", field: "cntAsistentes", width: "10%" },
			{ name: "F.Decreto", field: "responsable", width: "20%" },
			{ name: "Accion", field: "tipo", width: "10%" },
			
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

	    var btnAgregarUUOOAsociadas = new dijit.form.Button({
            label: "Agregar UUOO Asociadas",
            onClick: function() {
               alert("Agregar UUOO Asociadas");
            }
        },
        "clicAgregarUUOOAsociadas");
	    
	    var btnAgregarUUOOOrigen = new dijit.form.Button({
            label: "Agregar UUOO Origen",
            onClick: function() {
               alert("Agregar UUOO Origen");
            }
        },
        "clicAgregarUUOOOrigen");
	    
	    var btnValidar = new dijit.form.Button({
            label: "Validar",
            onClick: function() {
               alert("Validar codigo de UUOO");
            }
        },
        "clicValidar");
	    
	    var btnBuscarUUOODepende = new dijit.form.Button({
            label: "Buscar",
            onClick: function() {
               alert("Buscar UUOO del cual Depende");
            }
        },
        "clicBuscarUUOODepende");
	    
	    var btnBuscarUUOOCustodia = new dijit.form.Button({
            label: "Buscar",
            onClick: function() {
               alert("Buscar UUOO que Custodia");
            }
        },
        "clicBuscarUUOOCustodia");
	    
	    var btnGenerar = new dijit.form.Button({
            label: "Generar",
            onClick: function() {
               alert("Generar Sustento Legal");
            }
        },
        "clicGenerar");
	    
	 
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
			<legend>Editar UUOO</legend>
			<table align="center">
				<tr>
					<td>
						<label for="LblCodigo">C�digo : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtCodigo" readonly="readonly" value =""/>
						<button type="btnValidar" id="clicValidar"/>
					<td/>
				</tr>
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
						<label for="LblUUOODepende">UUOO del cual depende : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtDepende" readonly="readonly" value =""/>
						<button type="btnBuscarUUOODepende" id="clicBuscarUUOODepende"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblCustodia">UUOO que custodia : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtCustodia" readonly="readonly" value =""/>
						<button type="btnBuscarUUOOCustodia" id="clicBuscarUUOOCustodia"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblSustentoLegal">Sustento legal : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtSustentoLegal" readonly="readonly" value =""/>
						<button type="btnGenerar" id="clicGenerar"/>
					</td>
				</tr>
				<tr>	
					<td>
						<label for="LblFDecreto">F. Decreto:</label>
					</td>
					<td>
						<input type="text" name="txtFDecreto" id="txtFDecreto" dojoType="dijit.form.DateTextBox" required="true" /><br>
					</td>
				</tr>
				<tr>	
					<td>
						<label for="rdbNivelArchivo">Nivel de Archivo : </label>
					</td>
					<td>
						<input type="radio" name="drink" id="radioOne" checked value="Central"/> <label for="radioUno">Gesti�n</label>
						<input type="radio" name="drink" id="radioTwo" checked value="Desconcentrado"/> <label for="radioDos">Desconcentrado</label>	
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblTipoarchivo">Tipo de Archivo : </label>
					</td>
					<td>
						<select name="CboTipoArchivo" id="CboTipoArchivo" dojoType="dijit.form.ComboBox">
							<option>Archivo Gestion</option>
							<option>Archivo Periferico</option>
							<option>Archivo Central</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<label for="lblTipoCreacion">Tipo de Creacion : </label>
					</td>
					<td>
						<select name="CboTipoCrecion" id="CboTipoCrecion" dojoType="dijit.form.ComboBox">
							<option>Normal</option>
							<option>Por Difusi�n</option>
							<option>Por Disgregaci�n</option>
						</select>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset style="padding: 30px; border: 1px solid #000; ">
			<legend>Por Fusi�n (Cuando se Registra una unidad para darle union de un grupo de Unidades Organicas)</legend>
			<table>
				<tr>
					<td>
						<button type="btnAgregarUUOOAsociadas" id="clicAgregarUUOOAsociadas"/>
					</td>
				</tr>
			</table>
			<div id="grid"></div>
		</fieldset>
		<fieldset style="padding: 30px; border: 1px solid #000; ">
			<legend>Por Disgregaci�n (Cuando una Unidad Organica es creada por disgregacion de otra)</legend>
			<table>
				<tr>
					<td>
						<label for="LblUUOOOrigen">Unidad Organica Origen : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name="txt_UUOOOrigen" id="txt_UUOOOrigen" dojoType="dijit.form.DateTextBox" required="true" /><br>
					</td>
					<td>
						<button type="btnAgregarUUOOOrigen" id="clicAgregarUUOOOrigen"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<table align="center">
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