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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.js"></script>
        <title>JSP Page</title>
    </head>
        <div class="container">
            <h3 class="text-center">ASIGNACIÓN UNIDADES</h3>
        </div>
        <div class="container">
            </br>
            <form:form action="buscarIncidente.html" method="POST" modelAttribute="lstUnidades">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th data-checkbox="true"></th>
                            <th>Nombre</th>
                            <th>Estado</th>
                            <th>Zona</th>
                            <th>Telefono</th>
                        </tr>
                    </thead>
                    <c:forEach var="unidad" items="${lstUnidades}" varStatus="count">
                    <tr onMouseOver="this.className='highlight'" onMouseOut="this.className='normal'" onclick="getTblContents('${unidad.asignacion_unidad_ID}');">
                        <td></td>
                        <td>${unidad.persona.nombre} ${unidad.persona.apellidos}</td>
                        <td>${unidad.estado}</td>
                        <td>${unidad.cod_zona}</td>
                        <td>${unidad.persona.telefono}</td>
                    </tr>
                    </c:forEach>
                </table>
                </br>
                <div class="form-group">
                    <div class="row">
                        <div class="form-group col-md-2">
                            <input type="button" class="btn btn-primary" data-dismiss="modal" onclick="" value="Guardar">
                        </div>
<!--                        <div class="form-group col-md-2">
                            <input type="button" class="btn btn-primary" data-dismiss="modal" onclick="" value="Cancelar">
                        </div>-->
                    </div>
                </div>
            </form>
            </form:form>
        </div>
        <script>
            function goBack() {
                window.detach();
            }
            
            function getTblContents(){
                
            }
        </script>

</html>
