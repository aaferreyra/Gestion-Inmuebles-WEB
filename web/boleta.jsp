<%-- 
    Document   : menu
    Created on : 02/08/2021, 17:07:57
    Author     : Aaron
--%>

<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="modelo.Aranceles"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager" %>
<%@page import="net.sf.jasperreports.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="controlador.*"%>
<%@page import="DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Controlador control = new Controlador();
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Boleta</title>
    </head>
    <body>
        <%  
            System.out.println(request.getParameter("idl"));
            String aplicacion;
            aplicacion = application.getRealPath("/reporte/boleta.jasper");
            JasperReport reporte = (JasperReport) JRLoader.loadObject(getClass().getResource("/reporte/boleta.jasper"));
            JasperPrint mostrar = JasperFillManager.fillReport(reporte, null, Aranceles.getDataSource(control, request.getParameter("id"), request.getParameter("idl")));
            byte[] bytes = JasperExportManager.exportReportToPdf(mostrar);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes, 0, bytes.length);
            outputStream.flush();
            outputStream.close();
        %>

    </body>
</html>

