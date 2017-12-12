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

        <style>
            #map {
             height: 400px;
             width: 100%;
            }
            #floating-panel {
            /*position: absolute;*/
            top: 10px;
            left: 25%;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
          }
        </style>
        <title>Registro Incidente</title>
    </head>
    
        <%@include file="../header.jsp" %>
        <c:if test="${neworupdate == 'new'}">
            <c:set var="action" value="saveIncidente.html" />
            <c:set var="readonly" value="false" />
            <c:set var="documentosustento" value="doc_sustento" />
        </c:if>
        <c:if test="${neworupdate == 'update'}">
            <c:set var="action" value="updateIncidente.html" />
            <c:set var="readonly" value="true" />
            <c:set var="documentosustento" value="doc_sustento_read" />
        </c:if>
        
        <c:if test="${not empty errorINC}">
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <strong>${errorINC}</strong>
            </div>
        </c:if> 
        
        <br /><br />
        
        <form:form action="${action}" method="POST" commandName="incidente">    
        <div class="container">
            <h1 class="text-center">REGISTRAR INCIDENTE</h1>
        </div>
        
        <div class="container">
            </br>
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Teléfono(*)</label>
                        <form:input path="telefono" type="text" class="form-control" />
                        <form:errors path="telefono" cssClass="error"><span style="color: red; font-weight: bold; ">Campo requerido</span></form:errors>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Estado Incidente(*)</label>
                        <form:input id="descEstado" path="estado" type="text" class="form-control" disabled="true" value="EN PROCESO" />
                    </div>
                </div>
                <div class="form-group"> 
                    <label>Dirección(*)</label>
                    <div class="form-row">
                        <div class="form-group col-md-9">
                            <form:input id="address" path="direccion" type="text" class="form-control" />
                            <form:errors path="direccion" cssClass="error"><span style="color: red; font-weight: bold; ">Campo requerido</span></form:errors>
                        </div>
                        <div class="form-group col-md-2">
                            <input id="submit" type="button" class="btn btn-primary" value="Validar Dirección">
                        </div>
                        <div class="form-group col-md-1">
                            <img id="imgOk" name="imgCancel" style="visibility:hidden;" src="images/GSC/ok_icon.png" width="30px">
                            <img id="imgCancel" name="imgOk" style="visibility:hidden;" src="images/GSC/cancel_icon.png" width="30px">
                        </div>
                        <input id="indDireccionValidada" name="indDireccionValidada" hidden="hide" class="form-control" type="text" value="">
                    </div>
                    <div id="map"></div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                    <label>Tipo Incidente</label>
                        <form:select path="tipo_incidente_ID" id="inputState" class="form-control col-md-6">
                            <option selected>Seleccionar...</option>
                            <option value="1">Asalto</option>
                            <option value="2">Disturbios</option>
                        </form:select>
                        <form:errors path="tipo_incidente_ID" cssClass="error"><span style="color: red; font-weight: bold; ">Campo requerido</span></form:errors>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Email</label>
                        <form:input path="email" type="text" class="form-control" />
                        <form:errors path="email" cssClass="error"><span style="color: red; font-weight: bold; ">Campo requerido</span></form:errors>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Nombres</label>
                        <form:input path="nombres" type="text" class="form-control" />
                        <form:errors path="nombres" cssClass="error"><span style="color: red; font-weight: bold; ">Campo requerido</span></form:errors>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Apellidos</label>
                        <form:input path="apellidos" type="text" class="form-control" />
                        <form:errors path="apellidos" cssClass="error"><span style="color: red; font-weight: bold; ">Campo requerido</span></form:errors>
                    </div>
                </div>
                <div class="form-group">
                    <label>Observaciones</label>
                    <form:textarea path="observaciones" rows="3" class="form-control" />
                </div>
                <div class="form-group">
                    <label>Asignar Unidades: </label>
                    <a id="linkAsignacion" style="visibility:hidden;" data-toggle="modal" data-target="#asignacionModal" ><input type="button" class="btn btn-primary" value="Agregar"></a>
                </div>
                </br>
                <div class="form-group">
                <div class="form-row">
                    <table width="100%">
                        <tr>
                            <td class="form-group" colspan="8">
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
                                    <c:forEach var="unidad" items="${lstUnidades}" varStatus="count">
                                    <tr>
                                        <td><input id="${count.index}" onclick="validarSeleccion(${unidad.asignacion_unidad_ID})" type="checkbox" value="${unidad.asignacion_unidad_ID}" /></td>
                                        <td>${unidad.persona.nombre} ${unidad.persona.apellidos}</td>
                                        <td>${unidad.estado}</td>
                                        <td>${unidad.cod_zona}</td>
                                        <td>${unidad.persona.telefono}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </td>
                            <td class="form-group" colspan="4" style="text-align: center;vertical-align: middle;">
                                <input type="submit" class="btn btn-primary" value="Guardar">
                                <input type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/cancelIncidente.html'" value="Cancelar">  
                            </td>
                        </tr>
                    </table>
                    <form:input id="unidadesAsignadas" path="lstIdUnidades" class="form-control" type="hidden" ></form:input>
                </div>
                </div>
            </form>
        </div>
        </form:form>
        <div class="container">

  <!-- Modal -->
  <div class="modal fade" id="asignacionModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Modal Header</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <%@include file="frm_AsignacionUnidades.jsp" %>
        
      </div>
      
    </div>
  </div></div>
</div>
        <script type="text/javascript">
            function goBack() {
                window.history.back();
            }
            
            var countUnidades = '${countUnidades}';
            console.log("TAMAÑO LISTA::"+countUnidades);
            var id_Undiad = "";
            function validarSeleccion(id){
                
//                var x = document.getElementById(id).checked;
//                console.log("valor check::"+x);
                id_Undiad = "";
                for(var i = 0;i<countUnidades; i++){
                    if(document.getElementById(i).checked){
                       id_Undiad = id_Undiad + "" + document.getElementById(i).value +",";
                    }
                }
                console.log("id_Undiad::"+id_Undiad);
                document.getElementById("unidadesAsignadas").value = id_Undiad;
            }
        </script>
        <script type="text/javascript">
            var map;
            var coordenadasIncidente = {lat: -12.096285, lng: -76.993264}; //DENTRO 
//            var coordenadasIncidente = {lat: -12.100377, lng: -76.997051}; //FUERA
            var bermudaTriangle;
            var markers = [];
            function initMap() {

                map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 15,
                    center: coordenadasIncidente
                });
            
                var geocoder = new google.maps.Geocoder();
                document.getElementById('submit').addEventListener('click', function() {
                    geocodeAddress(geocoder, map);
                });
            
              // Define the LatLng coordinates for the polygon's path.
              var RDB1Coords = [
                {lat: -12.093231, lng: -76.995493},
                {lat: -12.096222, lng: -76.989305},
                {lat: -12.098887, lng: -76.994712},
                {lat: -12.093231, lng: -76.995493}
              ];

              // Construct the polygon.
              RDB1 = new google.maps.Polygon({
                paths: RDB1Coords,
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 3,
                fillColor: '#FF0000',
                fillOpacity: 0.35
              });
              RDB1.setMap(map);
          }
          
          function geocodeAddress(geocoder, resultsMap) {
            if(markers.length > 0){
                deleteMarkers();
            }
            
            var address = document.getElementById('address').value;
            geocoder.geocode({'address': address}, function(results, status) {
              if (status === 'OK') {
                resultsMap.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                  map: resultsMap,
                  position: results[0].geometry.location
                });
                markers.push(marker);
                
                var dentroAreaA2 = google.maps.geometry.poly.containsLocation(marker.getPosition(), RDB1) ?
                    'DENTRO' : 'FUERA';
                console.log("DENTRO O FUEDA DEL AREA:: "+dentroAreaA2);
                if(dentroAreaA2 == "DENTRO"){
                    console.log("DENTRO O FUEDA DEL AREA:: "+dentroAreaA2);
                    document.getElementById("imgOk").style.visibility = "visible";
                    document.getElementById("imgCancel").style.visibility = "hidden";
                    document.getElementById("indDireccionValidada").value = "true";
                    
//                    document.getElementById("linkAsignacion").style.visibility = "visible";
                }else{
                    document.getElementById("imgCancel").style.visibility = "visible";
                    document.getElementById("imgOk").style.visibility = "hidden";
                    document.getElementById("indDireccionValidada").value = "false";
                    
//                    document.getElementById("linkAsignacion").style.visibility = "hidden";
                }
                console.log("indDireccionValidada:: "+document.getElementById("indDireccionValidada").value);
              } else {
                alert('Geocode was not successful for the following reason: ' + status);
              }
            });
          }
          function setMapOnAll(map) {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(map);
            }
          }
          function clearMarkers() {
            setMapOnAll(null);
          }
          function deleteMarkers() {
            clearMarkers();
            markers = [];
          }
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4hrnVcFR7ZiR-NYj-bJNozqt35aWx0cE&libraries=geometry&callback=initMap">
        </script>
    
</html>
