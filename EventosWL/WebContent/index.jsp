<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SIGAR</title>
</head>
<body>
<form id="myform" action="LoginServlet">
</form>

<script type="text/javascript">
redirecionar();
function redirecionar(){
	document.forms["myform"].submit();
}

</script>
</body>
</html>