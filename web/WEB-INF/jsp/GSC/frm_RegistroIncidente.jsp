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
        
        <title>Registro Incidente</title>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <div class="container">
            <h1 class="text-center">REGISTRAR INCIDENTE</h1>
        </div>
        <div class="container">
            </br>
            <form>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label>Teléfono</label>
                    <input type="text" class="form-control">
                  </div>
                  <div class="form-group col-md-6">
                    <label>Estado Incidente</label>
                    <select id="inputState" class="form-control">
                      <option selected>Choose...</option>
                      <option>...</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                    <label>Dirección</label>
                    <div class="form-row">
                    <div class="form-group col-md-10">
                        <input type="text" class="form-control ">
                    </div>
                    <div class="form-group col-md-2">
                        <button type="submit" class="btn btn-primary">Validar Limites</button>
                    </div>
                </div>
                <div class="form-group">
                    <label>Tipo Incidente</label>
                    <select id="inputState" class="form-control col-md-6">
                      <option selected>Choose...</option>
                      <option>...</option>
                    </select>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label>Nombres</label>
                    <input type="text" class="form-control">
                  </div>
                  <div class="form-group col-md-6">
                    <label>Apellidos</label>
                    <input type="text" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                    <label>Observaciones</label>
                    <textarea class="form-control" rows="3"></textarea>
                </div>

            </form>
                
            </br>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Unidad</th>
                        <th>Nombre</th>
                        <th>Zona</th>
                        <th>Contacto</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tr>
                    <td>1</td>
                    <td>Miguel Merino</td>
                    <td>A2</td>
                    <td>999999999</td>
                    <td><a href=""><img src="images/GSC/trash_icon.png" width="30px"></img></a></td>
                </tr>
            </table>
        </div>

    </body>
</html>
