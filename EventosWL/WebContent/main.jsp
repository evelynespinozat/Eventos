<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<% String path = (String) session.getAttribute("basePath"); %>
	<title>SIGAR</title>
	<style type="text/css">
	    body, html { font-family:helvetica,arial,sans-serif; font-size:90%; }
	</style>
	<script src="<%=path%>/dojo/dojo.xd.js" djConfig="parseOnLoad: true">
	</script>
	<script type="text/javascript">
		//layout
	    dojo.require("dijit.layout.BorderContainer");
	    dojo.require("dijit.layout.ContentPane");
	    //tree
	    dojo.require("dojo.data.ItemFileReadStore");
	    dojo.require("dijit.Tree");
	</script>
	<link href="<%=path%>/dijit/themes/claro/claro.css" rel="stylesheet" type="text/css" />
	<style type="text/css"> html, body { width: 100%; height: 100%; margin: 0; } </style>
</head>
<body class="claro">
<div dojoType="dijit.layout.BorderContainer" style="width: 100%; height: 100%">
    <div dojoType="dijit.layout.ContentPane" region="top">
        SIGAR
    </div>
    <div dojoType="dijit.layout.ContentPane" region="leading" style="width: 200px;">
        
        <div dojoType="dojo.data.ItemFileReadStore" jsId="continentStore" url="MenuServlet">
		</div>
		<div dojoType="dijit.tree.ForestStoreModel" jsId="continentModel" store="continentStore"
		query="{tipo:'padre'}" rootId="continentRoot" rootLabel="Menu Principal"
		childrenAttrs="hijos">
		</div>
		<div dojoType="dijit.Tree" id="mytree" model="continentModel" openOnClick="true">
		    <script type="dojo/method" event="onClick" args="item">
        		alert("Ejecucion de nodo " + continentStore.getLabel(item) + ", url=" + continentStore.getValue(item, "url"));
    		</script>
		</div>
        
    </div>
    <div dojoType="dijit.layout.ContentPane" region="center">
        <iframe id="frm_contenido" src="eventos.jsp" width="100%" height="100%" frameborder="0" > 
        </iframe>
    </div>
    <div dojoType="dijit.layout.ContentPane" region="bottom">
        Bottom pane
    </div>
</div>

</body>
</html>