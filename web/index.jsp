<%-- 
    Document   : index
    Created on : 02/08/2021, 17:06:24
    Author     : Aaron
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="controlador.*"%>
<%@page import="java.util.Set"%>
<%@page import="controlador.Controlador"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="DAO.InicioSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
        
        <link rel="stylesheet" href="css/style.css" type = "text/css"><link>
        
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
          <form action="iniciar" method="post" id="forminicio"><br>
            <p>
                <label>Nombre</label>  
                <input type="text" name="usuario" id="txtusuario"/><br>
                <label>Contraseña</label>
                <input type="password" name="pass" id="txtpass"/>
            </p>
            <h2><input type="submit" value="Iniciar Sesion" id="btniniciar"/></h2>
            
        </form>
    </body>
</html>