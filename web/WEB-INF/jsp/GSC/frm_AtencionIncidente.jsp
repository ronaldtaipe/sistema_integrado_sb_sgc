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
            position: absolute;
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
        <title>Atención Incidente</title>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <div class="container">
            <h1 class="text-center">ATENCIÓN DE INCIDENTES</h1>
        </div>
        
        <c:if test="${not empty errorINC}">
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                </button>
                <strong>${errorINC}</strong>
            </div>
        </c:if>

        <c:if test="${not empty successINC}">
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                </button>
                <strong>${successINC}</strong>
            </div>
        </c:if>
        </br>
        <form:form action="buscarIncidente.html" method="POST" modelAttribute="busquedaincidente">
        
        <div class="container">
            </br>
            <table width="100%" class="form-group" >
                <tr>
                    <td width="40%">
                        <table>
                            <tr>
                                <td>Nro. Teléfonico: </td>
                                <td><form:input id="textTelefono" type="text" class="form-control-sm" path="telefono" /></td>
                            </tr>
                            <tr>
                                <td>Estado: </td>
                                <td>
                                    <form:select path="estado" class="form-control">
                                        <option value="0" selected>Seleccionar...</option>
                                        <option value="1">En Proceso</option>
                                        <option value="2">Atendido</option>
                                        <option value="3">Rechazado</option>
                                    </form:select>
                                </td>
                            </tr>
                            <tr>
                                <td>Fecha registro: </td>
                                <td>
                                    <form:input type="text" class="form-control-sm" path="fechaStr" placeholder="YYYY-MM-DD" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    </br>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    <div class="container">
                                        <div class="row">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Buscar</button></a>
                                            <!--<button onclick="limpiarCampos()" type="button" class="btn btn-primary">Limpiar</button>-->
                                            <a href="${pageContext.request.contextPath}/frm_RegistroIncidente.html"><button type="button" class="btn btn-primary" >Nuevo</button></a>
                                        </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="60%">
                        <div id="map" width="100%"></div>       
                    </td>
                </tr>
            </table>
            </br>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Código Incidente</th>
                        <th>Fecha Registro</th>
                        <th>Teléfono</th>
                        <th>Ciudadano</th>
                        <th>Tipo Incidente</th>
                        <th>Estado</th>
                        <th>Ver</th>
                        <th>Asignación</th>
                        <th>Informe</th>
                    </tr>
                </thead>
                <c:forEach var="incidente" items="${listIncidente}" varStatus="count">
                    <tr>
                        <td>${incidente.cod_incidente}</td>
                        <td>${incidente.fecha}</td>
                        <td>${incidente.telefono}</td>
                        <td>${incidente.nombres} ${incidente.apellidos}</td>
                        <td>
                            <c:if test="${incidente.tipo_incidente_ID == '1'}">
                                Asalto
                            </c:if>
                            <c:if test="${incidente.tipo_incidente_ID == '2'}">
                                Disturbios
                            </c:if>
                        </td>
                        <td>${incidente.estado}</td>
                        <td><a href=""><img src="${pageContext.request.contextPath}/images/GSC/view_icon.png" width="30px"></img></a></td>
                        <td><a href=""><img src="${pageContext.request.contextPath}/images/GSC/search_document_icon.png" width="30px"></img></a></td>
                        <td><a href="${pageContext.request.contextPath}/frm_RegistroIncidente.html?incidente_ID='${incidente.incidente_ID}'"><img src="${pageContext.request.contextPath}/images/GSC/informe_icon.png" width="30px"></img></a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        </form:form>
        <script>
        
            var map;
            var coordenadasIncidente = {lat: -12.096285, lng: -76.993264}; //DENTRO
//            var coordenadasIncidente = {lat: 29.075375179558346, lng: -75.25634765625}; //FUERA

          function initMap() {
            
//            var marker1 = new google.maps.Marker({
//              position: uluru,
//              map: map,
//              icon: image
//            });
//            
//            var marker2 = new google.maps.Marker({
//              position: uluru2,
//              map: map,
//              icon: image
//            });
//            var contentString = '<div id="content">'+
//                '<div id="siteNotice">'+
//                '</div>'+
//                '<h3 id="firstHeading" class="firstHeading">Uluru</h3>'+
//                '<div id="bodyContent">'+
//                '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
//                'sandstone rock formation in the southern part of the '+
//                'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
//                'south west of the nearest large town, Alice Springs; 450&#160;km '+
//                '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
//                'features of the Uluru - Kata Tjuta National Park. Uluru is '+
//                'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
//                'Aboriginal people of the area. It has many springs, waterholes, '+
//                'rock caves and ancient paintings. Uluru is listed as a World '+
//                'Heritage Site.</p>'+
//                '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
//                'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
//                '(last visited June 22, 2009).</p>'+
//                '</div>'+
//                '</div>';

//            var infowindow = new google.maps.InfoWindow({
//              content: contentString,
//              maxWidth: 200
//            });
//            marker1.addListener('click', function() {
//                infowindow.open(map, marker1);
//            });
//            marker2.addListener('click', function() {
//                infowindow.open(map, marker2);
//            });

            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: coordenadasIncidente
            });
            
//            var marker = new google.maps.Marker({
//              position: coordenadasIncidente,
//              map: map
//            });
              // Define the LatLng coordinates for the polygon's path.
//              var triangleCoords = [
//                {lat: 25.774, lng: -80.190},
//                {lat: 18.466, lng: -66.118},
//                {lat: 32.321, lng: -64.757},
//                {lat: 25.774, lng: -80.190}
//              ];

              // Construct the polygon.
//              var bermudaTriangle = new google.maps.Polygon({
//                paths: triangleCoords,
//                strokeColor: '#FF0000',
//                strokeOpacity: 0.8,
//                strokeWeight: 3,
//                fillColor: '#FF0000',
//                fillOpacity: 0.35
//              });
//              bermudaTriangle.setMap(map);
//            console.log("latilongi::"+coordenadasIncidente.valueOf());
//            console.log("marker.getPosition()::"+marker.getPosition());
//            var dentroAreaA = google.maps.geometry.poly.containsLocation(marker.getPosition(), bermudaTriangle) ?
//                    'DENTRO' : 'FUERA';
//             console.log("DENTRO O FUEDA DEL AREA:: "+dentroAreaA);      
             
//            if(indCoordenada == "dentro"){
//                var circulo = new google.maps.Marker({
//                    position: coordenadasIncidente,
//                    map: map,
//                    icon: {
//                      path: google.maps.SymbolPath.CIRCLE,
//                      fillColor: 'black',
//                      fillOpacity: .2,
//                      strokeColor: 'white',
//                      strokeWeight: .5,
//                      scale: 10
//                    }
//                  });
//                  console.log("DENTRO");
//            }

//            google.maps.event.addListener(map, 'click', function(e) {
//                console.log("COORDENADA::"+e.latLng);
//                var resultColor =
//                    google.maps.geometry.poly.containsLocation(e.latLng, bermudaTriangle) ?
//                    'black' :
//                    'green';
//                var dentroAreaA = google.maps.geometry.poly.containsLocation(e.latLng, bermudaTriangle) ?
//                    'dentro' : 'fuera';
//                console.log("INDICADOR DENTRO O FUERA::"+dentroAreaA);
//                
//                  new google.maps.Marker({
//                    position: e.latLng,
//                    map: map,
//                    icon: {
//                      path: google.maps.SymbolPath.CIRCLE,
//                      fillColor: resultColor,
//                      fillOpacity: .2,
//                      strokeColor: 'white',
//                      strokeWeight: .5,
//                      scale: 10
//                    }
//                  });
//                });

          }
        
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4hrnVcFR7ZiR-NYj-bJNozqt35aWx0cE&libraries=geometry&callback=initMap">
        </script>
        
    </body>
</html>
