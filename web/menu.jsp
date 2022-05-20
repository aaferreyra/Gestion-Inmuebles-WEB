<%-- 
    Document   : menu
    Created on : 04/08/2021, 01:41:25
    Author     : Aaron
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Arancel"%>
<%@page import="controlador.Controlador"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="controlador.Controlador"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%
    Controlador control = new Controlador();
        List <Arancel> aranceldes = control.VerArancel(request.getParameter("id"));
        List <Arancel> arancel = control.Ordenar(aranceldes);
        String usuario = control.NombreLocatario(request.getParameter("id"));
        Long le;
        Boolean e;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link rel="stylesheet" href="css/style.css" type = "text/css"><link>
        
    </head>
    <body>
        <%
            %>
     <li>
        <a
            href="${pageContext.request.contextPath}/index.jsp">
            | Inicio |
        </a>
    </li>
        <h1>Inmobiliaria SOFT</h1>
        <h2>Boletas a pagar</h2>
    </li>
        <div id="main-container">
            <table>
                <thead>
                    <tr>
                        <th>Numero de Boleta</th>
                        <th>Primer Vencimiento</th>
                        <th>Segundo Vencimiento</th>
                        <th>Nombre</th>    
                        <th>Estado</th>
                        <th>Descargar</th>
                    </tr>
                </thead>
                <% 
                    for(Arancel a: arancel){
                        le=a.getIdarancel();
                %>
                <tr>
                    <td><%out.print(a.getIdarancel());%></td>
                    <td><%out.print(a.getPrimerfecha());%></td>
                    <td><%out.print(a.getSegundafecha());%></td>
                    <td><%out.print(usuario);%></td>
                    <%
                    e=a.getPagado();
                    if(e == false){
                    %>
                    <td>Adeuda</td>
                    <%}else{%>
                    <td>Pagado</td>
                    <%} if(e == false){%>
                    <td><a href="${pageContext.request.contextPath}/boleta.jsp?id=<%out.print(le);%>&&idl=<%out.print(request.getParameter("id"));%>">
                        descargar
                    </a></td>
                    <%}else{%> 
                    <td>
                        N/A
                        </td>
                        <%}%>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
