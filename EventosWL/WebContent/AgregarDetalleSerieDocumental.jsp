<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String path = (String) session.getAttribute("basePath"); %>
<title>Agregar UUOO a Serie Documental</title>
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
			{ name: "Descricion", field: "direccion", width: "40%" }
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
		
	    var btnAgregarSustentoLegal = new dijit.form.Button({
            label: "Agregar Sustento Legal",
            onClick: function() {
               alert("Agregar Sustento Legal");
            }
        },
        "clicAgregarSustentoLegal");
	    
	    var btnAgregar = new dijit.form.Button({
            label: "Agregar",
            onClick: function() {
               alert("Agregar");
            }
        },
        "clicAgregar");
	    
	    var btnQuitar = new dijit.form.Button({
            label: "Quitar",
            onClick: function() {
               alert("Quitar");
            }
        },
        "clicQuitar");
	 
	    
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
						<label for="LblSerieDocumental">Serie Documental : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtSerieDocumental" readonly="readonly" value =""/>
					<td/>
				</tr>
				<tr>
					<td>
						<label for="LblUnidadOrganica">Unidad Organica : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtUnidadOrganica" readonly="readonly" value =""/>
					<td/>
				</tr>
				<tr>
					<td>
						<label for="LblSustentoLegal">Sustento Legal : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtSustentoLegal" readonly="readonly" value =""/>
					<td/>
					<td>
						<button type="btnAgregarSustentoLegal" id="clicAgregarSustentoLegal"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblValorSerie">Valor Serie : </label>
					</td>
					<td>
						<select name="CboValorSerie" id="CboValorSerie" dojoType="dijit.form.ComboBox">
							<option>Temporal</option>
							<option>Permanete</option>
						</select>
					<td/>
				</tr>
			</table>
		</fieldset>	
		<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Tiempo de Retencion de Archivos</legend>
			<table align="center">
				<tr>
					<td>
						<label for="LblTotal">Total : </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtTotal" readonly="readonly" value =""style="width: 20%" />
					</td>
					<td>
					<td/>
					<td>
					</td>
					<td>
					<td/>
					<td>
					</td>
					<td>
					<td/>
					<td>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblAG">AG (Archivo Gestion)</label>
					</td>
					<td align="right">
						<label for="LblAniosAG" >Año/Años : </label>
					</td>
					<td>
						<select name="CboAniosAG" id="CboAniosAG" dojoType="dijit.form.ComboBox" style="width: 20%">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					<td/>
					<td>
						<label for="LblMesesAG">Mes/Meses : </label>
					</td>
					<td>
						<select name="CboMesesAG" id="CboMesesAG" dojoType="dijit.form.ComboBox" style="width: 20%">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					<td/>
					<td>
						<label for="LblDiasAG">Dia/Dias : </label>
					</td>
					<td>
						<select name="CboDiasAG" id="CboDiasAG" dojoType="dijit.form.ComboBox" style="width: 20%">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>..</option>
							<option>30</option>
						</select>
					<td/>
					<td>
						<label for="LblTotalAG"> = </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtTotalAG" readonly="readonly" value =""style="width: 20%" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblAP">AP (Archivo Periferico)</label>
					</td>
					<td align="right">
						<label for="LblAniosAP">Año/Años : </label>
					</td>
					<td>
						<select name="CboAniosAP" id="CboAniosAP" dojoType="dijit.form.ComboBox" style="width: 20%">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					<td/>
					<td>
						<label for="LblMesesAP">Mes/Meses : </label>
					</td>
					<td>
						<select name="CboMesesAP" id="CboMesesAP" dojoType="dijit.form.ComboBox" style="width: 20%">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					<td/>
					<td>
						<label for="LblDiasAP">Dia/Dias : </label>
					</td>
					<td>
						<select name="CboDiasAP" id="CboDiasAP" dojoType="dijit.form.ComboBox" style="width: 20%">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>..</option>
							<option>30</option>
						</select>
					<td/>
					<td>
						<label for="LblTotalAP"> = </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtTotalAP" readonly="readonly" value ="" style="width: 20%"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblAC">AC (Archivo Central)</label>
					</td>
					<td align="right">
						<label for="LblAniosAC">Año/Años : </label>
					</td>
					<td>
						<select name="CboAniosAC" id="CboAniosAC" dojoType="dijit.form.ComboBox" style="width: 20%">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					<td/>
					<td>
						<label for="LblMesesAC">Mes/Meses : </label>
					</td>
					<td>
						<select name="CboMesesAC" id="CboMesesAC" dojoType="dijit.form.ComboBox" style="width: 20%">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					<td/>
					<td>
						<label for="LblDiasAC">Dia/Dias : </label>
					</td>
					<td>
						<select name="CboDiasAC" id="CboDiasAC" dojoType="dijit.form.ComboBox" style="width: 20%">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>..</option>
							<option>30</option>
						</select>
					<td/>
					<td>
						<label for="LblTotalAC"> = </label>
					</td>
					<td>
						<input dojoType="dijit.form.TextBox" name ="txtTotalAC" readonly="readonly" value ="" style="width: 20%"/>
					</td>
				</tr>
		</table>
		</fieldset>
		<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Detalle de Archivos</legend>
			<table>
				<tr>
					<td>
						<label for="LblMicroforma">Microforma</label>
					</td>
					<td>
						<input type="radio" name="drink" id="radioOne" checked value="MicroformaSi"/> <label for="radioUno">Si</label>
					</td>
					<td>
						<input type="radio" name="drink" id="radioTwo" checked value="MicroformaNo"/> <label for="radioDos">No</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="LblTipoDocumental">Tiene Tipo Documental</label>
					</td>
					<td>
						<input type="radio" name="drink" id="radioTree" checked value="TipoDocSi"/> <label for="radioTree">Si</label>
					</td>
					<td>
						<input type="radio" name="drink" id="radioFour" checked value="TipoDocNo"/> <label for="radioFour">No</label>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset style="padding: 30px; border: 1px solid #000;">
		<legend>Tipos Documentales de la Serie</legend>
			<table>
				<tr>
					<td>
						<button type="btnAgregar" id="clicAgregar"/>
						<button type="btnQuitar" id="clicQuitar"/>
					</td>
				</tr>
			</table>
			<div id="grid"></div>
		</fieldset>
		<table align="center">
			<tr>	
				<td>
					<button type="btnGuardar" id="clicGuardar"/>
				</td>
				<td>
					<button type="btnCancelar" id="clicCancelar"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>