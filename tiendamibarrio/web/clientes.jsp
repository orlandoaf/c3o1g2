<%-- 
    Document   : clientes
    Created on : Sep 13, 2022, 3:08:56 PM
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>Clientes</title>
        <style>
            div{
                border: solid 2px;
            }
        </style>
    </head>
    <body>
        <h1>Tienda Mi Barrio</h1>
        <div class="container-fluid">   <!-- FLUID CONTAINER 1 -->
            <div class="row">  <!-- COLUMNAS GUÍA -->
                <div class="col-sm">1</div>
                <div class="col-sm">2</div>
                <div class="col-sm">3</div>
                <div class="col-sm">4</div>
                <div class="col-sm">5</div>
                <div class="col-sm">6</div>
                <div class="col-sm">7</div>
                <div class="col-sm">8</div>
                <div class="col-sm">9</div>
                <div class="col-sm">10</div>
                <div class="col-sm">11</div>
                <div class="col-sm">12</div> 
            </div> <!-- /COLUMNAS GUÍA -->
            <div class="row">
                <div class="col-6">                 <!<!-- COLUMNA DE FORMULARIO -->
                    <h3>Formulario</h3>
                    <div class="row">                    <!-- CAMPOS FORMULARIO -->
                        <div class="col-6">idCliente</div>
                        <div class="col-6">nombre</div>
                    </div>
                    <div class="row">
                        <div class="col-6">direccion</div>
                        <div class="col-6">telefono</div>
                    </div>
                    <div class="row">
                        <div class="col-12">email</div> 
                    </div>                           <!-- FIN CAMPO FORMULARIOS -->
                    
                    <div class="row">                   <!-- BOTONES -->
                        <div class="col-3">Guardar</div>
                        <div class="col-3">Eliminar</div>
                        <div class="col-3">Buscar</div>
                        <div class="col-3">Actualizar</div> 
                    </div>                           <!-- /BOTOTNES -->
                </div>                               <!-- /FORMULARIO -->
                <div class="col-6">                 <!-- COLUMNA DE TABLA -->
                    <h3>Tabla</h3>
                </div>
            </div>
            

        </div>  <!-- /FLUID CONTAINER 1 -->

    </body>
</html>
