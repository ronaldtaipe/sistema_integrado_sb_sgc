<%-- 
    Document   : frm_AsignacionUnidades
    Created on : 07/12/2017, 03:00:54 AM
    Author     : Myron Camus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">ASIGNACIÓN UNIDADES</h1>
        </div>
        <div class="container">
            </br>
            <form>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th data-checkbox="true"></th>
                            <th>Nombre</th>
                            <th>Tipo Unidad</th>
                            <th>Zona</th>
                            <th>Contacto</th>
                        </tr>
                    </thead>
                    <tr>
                        <td><input type="checkbox" name="checkGroup"></td>
                        <td>Miguel Merino</td>
                        <td>Motorizado</td>
                        <td>A2</td>
                        <td>999999999</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkGroup"></td>
                        <td>Ronald Taipe</td>
                        <td>Auto</td>
                        <td>A2</td>
                        <td>999999999</td>
                    </tr>
                </table>
                </br>
                <div class="form-group">
                    <div class="row">
                        <div class="form-group col-md-2">
                            <input type="button" class="btn btn-primary" onclick="goBack()" value="Guardar">
                        </div>
                        <div class="form-group col-md-2">
                            <input type="button" class="btn btn-primary" onclick="goBack()" value="Cancelar">
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>
</html>
