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
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4hrnVcFR7ZiR-NYj-bJNozqt35aWx0cE&libraries=geometry&callback=initMap">
        </script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.4.3.min.js" ></script>
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
                        <label>Teléfono(*)</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Estado Incidente(*)</label>
                        <select id="inputState" class="form-control">
                          <option selected>Choose...</option>
                          <option>...</option>
                        </select>
                    </div>
                </div>
<!--                <div class="form-group">
                    <label>Dirección</label>
                    <div class="form-row">
                        <div class="form-group col-md-10">
                            <input type="text" class="form-control">
                        </div>
                        <div class="form-group col-md-2">
                            <button type="submit" class="btn btn-primary">Validar Limites</button>
                        </div>
                    </div>
                </div>-->
                <div class="form-group"> 
                    <label>Dirección(*)</label>
                    <div class="form-row">
                        <div class="form-group col-md-9">  
                            <input id="address" class="form-control" type="text" value="">
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
                <div class="form-group">
                    <label>Asignar Unidades: </label>
                    <a href="frm_AsignacionUnidades.html" ><input type="button" class="btn btn-primary" value="Agregar"></a>
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
                                    <tr>
                                        <td>1</td>
                                        <td>Miguel Merino</td>
                                        <td>A2</td>
                                        <td>999999999</td>
                                        <td><a href=""><img src="images/GSC/trash_icon.png" width="30px"></img></a></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Ronald Taipe</td>
                                        <td>A2</td>
                                        <td>999999999</td>
                                        <td><a href=""><img src="images/GSC/trash_icon.png" width="30px"></img></a></td>
                                    </tr>
                                </table>
                            </td>
                            <td class="form-group" colspan="4" style="text-align: center;vertical-align: middle;">
                                <input type="button" class="btn btn-primary" onclick="goBack()" value="Guardar">
                                <input type="button" class="btn btn-primary" onclick="goBack()" value="Cancelar">  
                            </td>
                        </tr>
                    </table>
                </div>
                </div>
            </form>
        </div>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
        <script>
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
              var triangleCoords = [
                {lat: -12.093231, lng: -76.995493},
                {lat: -12.096222, lng: -76.989305},
                {lat: -12.098887, lng: -76.994712},
                {lat: -12.093231, lng: -76.995493}
              ];

              // Construct the polygon.
              bermudaTriangle = new google.maps.Polygon({
                paths: triangleCoords,
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 3,
                fillColor: '#FF0000',
                fillOpacity: 0.35
              });
              bermudaTriangle.setMap(map);
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
                
                var dentroAreaA2 = google.maps.geometry.poly.containsLocation(marker.getPosition(), bermudaTriangle) ?
                    'DENTRO' : 'FUERA';
                console.log("DENTRO O FUEDA DEL AREA:: "+dentroAreaA2);
                if(dentroAreaA2 == "DENTRO"){
                    console.log("DENTRO O FUEDA DEL AREA:: "+dentroAreaA2);
                    document.getElementById("imgOk").style.visibility = "visible";
                    document.getElementById("imgCancel").style.visibility = "hidden";
                    document.getElementById("indDireccionValidada").value = "true";
                }else{
                    document.getElementById("imgCancel").style.visibility = "visible";
                    document.getElementById("imgOk").style.visibility = "hidden";
                    document.getElementById("indDireccionValidada").value = "false";
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
        
    </body>
</html>
