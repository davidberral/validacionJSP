
<%@page import="modelo.Billete"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalles de la compra</title>
</head>
<body>
	<h1>Detalles </h1>
	
	<% Billete b = (Billete) session.getAttribute("billete"); 
	if (b==null) {
		response.sendRedirect("billete.jsp");
	}
	session.removeAttribute("errorNombre");
	session.removeAttribute("errorEdad");
	session.removeAttribute("errorBillete");
	session.removeAttribute("errorPasajeros");
	
	%>
	
	
	<ul>
		<li>Nombre: <%=b.getNombre() %></li>
		<li>Edad: <%=b.getEdad() %></li>
		<li>Dni: <%=b.getDni() %></li>
		<li>Tipo Billete: <%=b.getTipoBillete() %></li>
		<li>Número de pasajeros: <%=b.getNumPasajeros() %></li>
		<li>Modalidad: 
			<%if (b.isIdayVuelta()) { 			%>
				Ida y vuelta
			<% } else { %>
				Ida
			<% }%>
		</li>
		<li>Importe total: <%=b.getImporteTotal() %></li>
	</ul>
 
	<%session.removeAttribute("billete"); %>
</body>
</html>