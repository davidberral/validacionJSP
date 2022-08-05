<%@page import="modelo.Billete"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.error {
		color: lightcoral;
	}
</style>
</head>
<body>
<% Billete b = (Billete) session.getAttribute("billete"); 
if (b == null) {
	b = new Billete();
}
String errorNombre = (String)session.getAttribute("errorNombre");
String errorEdad = (String) session.getAttribute("errorEdad");
String errorBillete = (String) session.getAttribute("errorBillete");
String errorPasajeros = (String) session.getAttribute("errorPasajeros");

%>
<h1>Detalles del billete</h1>
    <form action="procesarBillete" method="post">
        <div>
            <label for="nombre">Nombre<sub>*</sub>: </label>
            <input type="text" name="nombre" id="nombre" 
                   value="<%=b.getNombre() %>" required>
            <%if (errorNombre!=null)  {%>
            	<div class="error">
            		<%=errorNombre %>
            	</div>
            <%} %>
        </div>
        <div>
            <label for="edad">Edad <sub>*</sub>:</label>
            <input type="text" name="edad" id="edad" 
                   value="<%=b.getEdad() %>" required>
                   <%if (errorEdad!=null)  {%>
            	<div class="error">
            		<%=errorEdad %>
            	</div>
            <%} %>
        </div>
        <div>
            <label for="dni">DNI <sub>*</sub>:</label>
            <input type="text" name="dni" id="dni" 
                   pattern="[0-9]{1,8}[A-Z]{1}" 
                   value="<%=b.getDni() %>" required>
        </div>
        <div>
            <label for="billete">Tipo Billete:</label>
            <select name="billete" id="billete">
                <option value="1" <%if (b.getTipoBillete()==1) out.print(" selected");%>>Normal</option>
                <option value="2" <%if (b.getTipoBillete()==2) out.print(" selected");%>>Joven </option>
                <option value="3" <%if (b.getTipoBillete()==3) out.print(" selected");%>>3ª edad</option>
            </select>
            <%if (errorBillete!=null)  {%>
            	<div class="error">
            		<%=errorBillete %>
            	</div>
            <%} %>
        </div>
        <div>
            <label for="numPasajeros">Número de pasajeros<sub>*</sub>:</label>
            <input type="text" name="numPasajeros" id="numPasajeros" 
                   value="<%=b.getNumPasajeros() %>" required>
            <%if (errorPasajeros!=null)  {%>
            	<div class="error">
            		<%=errorPasajeros %>
            	</div>
            <%} %>
        </div>
        <div>
            <label for="">Modalidad: </label>
            <input type="radio" name="modalidad" id="ida" value="ida" 
            <%if (!b.isIdayVuelta()){out.print(" checked");}  %>>
            <label for="ida">Ida</label>
            <input type="radio" name="modalidad" id="idaVuelta" 
                   value="idaVuelta"
                   <%if (b.isIdayVuelta()){out.print(" checked");}  %>
                   >
            <label for="idaVuelta">Ida y Vuelta</label>
        </div>
        <input type="submit" value="Compra">
    </form>
 

</body>
</html>