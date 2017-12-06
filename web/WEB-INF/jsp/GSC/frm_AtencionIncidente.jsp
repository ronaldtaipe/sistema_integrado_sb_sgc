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
         </style>
        <title>Atención Incidente</title>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <div class="container">
            <h1 class="text-center">ATENCIÓN DE INCIDENTES</h1>
        </div>
        <div class="container">
            </br>
            <table width="100%" class="form-group" >
                <tr>
                    <td width="40%">
                        <table>
                            <tr>
                                <td>Nro. Teléfonico: </td>
                                <td><input type="text" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Estado: </td>
                                <td>
                                    <select class="form-control">
                                        <option value="-1">---Seleccionar---</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Fecha registro: </td>
                                <td>
                                    <input type="date" class="form-control" />
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
                                            <button type="button" class="btn btn-primary">Buscar</button>
                                            <button type="button" class="btn btn-primary">Limpiar</button>
                                            <a href="frm_RegistroIncidente.html"><button type="button" class="btn btn-primary" >Nuevo</button></a>
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
                <tr>
                    <td>1</td>
                    <td>02/12/2017</td>
                    <td>987151754</td>
                    <td>Mayron Camus Varda</td>
                    <td>Robo</td>
                    <td>En proceso</td>
                    <td><a href=""><img src="images/GSC/view_icon.png" width="30px"></img></a></td>
                    <td><a href=""><img src="images/GSC/search_document_icon.png" width="30px"></img></a></td>
                    <td><a href="frm_RegistroIncidente.html"><img src="images/GSC/informe_icon.png" width="30px"></img></a></td>
                </tr>
            </table>
        </div>
        
        
        <script>
          function initMap() {
            var uluru = {lat: -12.0464, lng: -77.0428};
            var uluru2 = {lat: -8.1120, lng: -79.0288};
            var image = 'https://png.icons8.com/protect/color/32/000000';
            var map = new google.maps.Map(document.getElementById('map'), {
              zoom: 5,
              center: uluru
            });
            var marker1 = new google.maps.Marker({
              position: uluru,
              map: map,
              icon: image
            });
            
            var marker2 = new google.maps.Marker({
              position: uluru2,
              map: map,
              icon: image
            });
            var contentString = '<div id="content">'+
                '<div id="siteNotice">'+
                '</div>'+
                '<h3 id="firstHeading" class="firstHeading">Uluru</h3>'+
                '<div id="bodyContent">'+
                '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
                'sandstone rock formation in the southern part of the '+
                'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
                'south west of the nearest large town, Alice Springs; 450&#160;km '+
                '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
                'features of the Uluru - Kata Tjuta National Park. Uluru is '+
                'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
                'Aboriginal people of the area. It has many springs, waterholes, '+
                'rock caves and ancient paintings. Uluru is listed as a World '+
                'Heritage Site.</p>'+
                '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
                'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
                '(last visited June 22, 2009).</p>'+
                '</div>'+
                '</div>';

            var infowindow = new google.maps.InfoWindow({
              content: contentString,
              maxWidth: 200
            });
            marker1.addListener('click', function() {
                infowindow.open(map, marker1);
            });
            marker2.addListener('click', function() {
                infowindow.open(map, marker2);
            });
          }
        </script>
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4hrnVcFR7ZiR-NYj-bJNozqt35aWx0cE&callback=initMap">
        </script>
    </body>
</html>
