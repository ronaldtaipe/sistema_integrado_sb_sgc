<%-- 
    Document   : frm_ProgramacionUnidades
    Created on : 10/12/2017, 10:53:42 PM
    Author     : Ronald Taipe
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4hrnVcFR7ZiR-NYj-bJNozqt35aWx0cE&libraries=geometry&callback=initMap">
        </script>
        
        <script>
            $(document).ready(function() {
                $('.js-example-basic-multiple').select2();
            });
        </script>
        
        <style>
            
            body {
                font: normal 12px Verdana, Arial, sans-serif;
            }

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
          
            .side-left{
                float:left;
            }
            
            .side-center{
                float:center;
            }
            
            .side-right{
                float:right;
            }
            th {
                background-color: #9fbfdf;
            }
            
            .yourComponent {
               float: right;
               bottom: 0;
            }
            
            #select_unidad_id{
                width:250px;   
            }

            #select_unidad_id option{
                width:150px;   
            }
            
            .title-div{
                vertical-align: middle;
                padding: 23px 0px 5px 0px;
            }
            
            .label-div{
                vertical-align: middle;
                padding: 15px 0px 5px 10px;
            }
            
            .btn {
                padding: .375rem 0.5rem !important;
                font-size: 12px !important;
                line-height: 1.5 !important;
            }
            
            .btn-primary {
                background-color: #619fe2 !important;
            }
            
        </style>
        <title>Atención Incidente</title>
    </head>
    <body>
         <%@include file="../header.jsp" %>
        <div class="container">
            <h2 class="text-center">PROGRAMACIÓN DE UNIDADES</h2>
            
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#recursosunidades">Recursos y Unidades</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#programacion">Programación</a>
              </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active container" id="recursosunidades">
                    BUSCAR UNIDAD
                    <table width="100%" border="0">
                        <tr>
                            <td width="20%">
                                <select class="" id="exampleSelect1">
                                    <option>U00001</option>
                                </select>
                                <img src="images/GSC/search_document_icon.png" width="25px">
                            </td>
                            <td width="80%">
                                <strong> Recursos Disponibles para Conformar Unidades </strong>
                                <br /> <br />
                                <div class="side-left">
                                    <table class="table table-bordered table-sm m-0">
                                        <thead class="">
                                            <tr>
                                                <th>Sereno</th>
                                                <th>Nombre</th>
                                                <th>#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>S4458235</td>
                                                <td>John Doe</td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div class="side-left">
                                    <table class="table table-bordered table-sm m-0">
                                        <thead class="">
                                            <tr>
                                                <th>Caninos</th>
                                                <th>#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Canino 001</td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div class="side-left">
                                    <table class="table table-bordered table-sm m-0">
                                        <thead class="">
                                            <tr>
                                                <th>Vehiculos</th>
                                                <th>#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>VE 45BG12</td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                
                                <div class="side-left">
                                    <table class="table table-bordered table-sm m-0">
                                        <thead class="">
                                            <tr>
                                                <th>Unidades</th>
                                                <th>#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Unidad 10</td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <button type="button" class="btn btn-primary">Conformar Unidad</button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table class="table table-bordered table-sm m-0">
                                    <thead class="">
                                        <tr>
                                            <th>Unidad</th>
                                            <th>Código Recurso</th>
                                            <th>Tipo Recurso</th>
                                            <th>Nombre Recurso</th>
                                            <th>Detalle</th>
                                            <th>Liberar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Unidad 1</td>
                                            <td>R00001</td>
                                            <td>Persona</td>
                                            <td>John Doe</td>
                                            <td><img src="images/GSC/search_document_icon.png" width="25px"></td>
                                            <td><button type="button" class="btn btn-primary">Liberar</button></td>
                                        </tr>
                                        <tr>
                                            <td>Unidad 1</td>
                                            <td>R00220</td>
                                            <td>Canino</td>
                                            <td>Negro</td>
                                            <td><img src="images/GSC/search_document_icon.png" width="25px"></td>
                                            <td><button type="button" class="btn btn-primary">Liberar</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="side-left">
                                    <strong>Tipo Persona</strong>
                                    <br>
                                    <table class="table table-sm m-0">
                                        <tbody>
                                            <tr>
                                                <td>Código</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Documento Identidad</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Nombre Completo</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Dirección</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Teléfono</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Nacimiento</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="side-left">
                                    <strong>Tipo Canino</strong>
                                    <br>
                                    <table class="table table-sm m-0">
                                        <tbody>
                                            <tr>
                                                <td>Código</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Nombre</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Años</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Vacunas</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="side-left">
                                    <strong>Tipo Vehiculo</strong>
                                    <br>
                                    <table class="table table-sm m-0">
                                        <tbody>
                                            <tr>
                                                <td>Código</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Placa</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Tipo</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Color</td>
                                                <td><input type="text" class="form-control" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>                    
                    </table>
                </div>
                <div class="tab-pane container" id="programacion">
                    PROGRAMACIÓN : <select class="" id="exampleSelect1"> <option>PP20180101</option> </select> <img src="images/GSC/search_document_icon.png" width="30px">
                    <table width="100%" border="0">
                        <tr>
                            <td width="45%">
                                <u><strong>NUEVA PROGRAMACIÓN</strong></u>
                                <br><br>
                                <div class="side-left">                                    
                                    <label class="radio-inline">Código</label>
                                    <br>
                                    <input type="text" name="fcodigo" value="PROG-001" size="10">
                                </div>
                                <div class="side-right">
                                    <label class="radio-inline">Rango de Fechas</label>
                                    <br>
                                    <input id="date" type="date"> &nbsp;&nbsp;<input id="date" type="date">
                                </div>
                                <br>
                                <br>
                                
                                <div class="title-div">
                                    <u><strong>Disponibles</strong></u>
                                </div>
                                <div class="side-right">
                                    <table class="table table-bordered table-sm m-0">
                                        <thead class="">
                                            <tr>
                                                <th>Unidades</th>
                                                <th>#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Canino 001</td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div class="side-right">
                                    <table class="table table-bordered table-sm m-0">
                                        <thead class="">
                                            <tr>
                                                <th>Turnos</th>
                                                <th>#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>VE 45BG12</td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                
                                <div class="side-right">
                                    <table class="table table-bordered table-sm m-0">
                                        <thead class="">
                                            <tr>
                                                <th>Zonas</th>
                                                <th>#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Unidad 10</td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                            </td>
                            <td width="55%">
                                <u><strong>LIBERAR ASIGNACIÓN</strong></u>
                                <div class="title-div">
                                    <u><strong>Liberar por: </strong></u>
                                </div>
                                
                                
                                <div class="label-div">
                                    <label>Fecha: </label>
                                    <input id="date" type="date">&nbsp;<input id="date" type="date">
                                </div>                                
                                <div class="label-div">
                                    <label>Turno: </label>
                                    <select class="" id="exampleSelect1">
                                        <option>Todos</option>
                                    </select>
                                </div>                                
                                <div class="label-div">
                                    <label>Unidad: </label>
                                    <select class="" id="exampleSelect1">
                                        <option>Unidad 1</option>
                                    </select>
                                </div>
                                <div class="label-div">
                                    <label>Zona: </label>
                                    <select class="" id="exampleSelect1">
                                        <option>ZSB02</option>
                                    </select>
                                </div>
                                
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="center" colspan="2">
                                <button type="button" class="btn btn-primary">Programar</button>
                                <button type="button" class="btn btn-primary">Liberar</button>
                            </td>
                        </tr>
                        
                                
                        <tr>
                            <td colspan="2">
                                <u><strong>PROGRAMACIÓN DETALLE</strong></u>
                                <br><br>
                                <table class="table table-bordered table-sm m-0">
                                    <thead class="">
                                        <tr>
                                            <th>Unidad</th>
                                            <th>Tipo Unidad</th>
                                            <th>Fecha Desde</th>
                                            <th>Fecha Hasta</th>
                                            <th>Turno</th>
                                            <th>Zona</th>
                                            <th>Detalle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Unidad 1</td>
                                            <td>Serenazgo</td>
                                            <td>01/01/2018</td>
                                            <td>01/01/2018</td>
                                            <td>Día</td>
                                            <td>ZSB01</td>
                                            <td><button type="button" class="btn btn-primary">Ver</button> <img src="images/GSC/view_icon.png" width="30px"></td>
                                        </tr>
                                        <tr>
                                            <td>Unidad 2</td>
                                            <td>Serenazgo</td>
                                            <td>01/01/2018</td>
                                            <td>01/01/2018</td>
                                            <td>Noche</td>
                                            <td>ZSB02</td>
                                            <td><button type="button" class="btn btn-primary">Ver</button> <img src="images/GSC/view_icon.png" width="30px"></td>
                                        </tr>
                                        <tr>
                                            <td>Unidad 3</td>
                                            <td>Serenazgo</td>
                                            <td>01/01/2018</td>
                                            <td>01/01/2018</td>
                                            <td>Madrugada</td>
                                            <td>ZSB03</td>
                                            <td><button type="button" class="btn btn-primary">Ver</button> <img src="images/GSC/view_icon.png" width="30px"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>    
                        <tr>
                            <td width="40%">
                                <br>
                                <table class="table table-bordered table-sm m-0">
                                    <thead class="">
                                        <tr>
                                            <th>Unidad</th>
                                            <th>Código Recurso</th>
                                            <th>Tipo Recurso</th>
                                            <th>Nombre Recurso</th>
                                            <th>Detalle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Unidad 1</td>
                                            <td>R0001</td>
                                            <td>Persona</td>
                                            <td>Juan Perez</td>
                                            <td><button type="button" class="btn btn-primary">Ver</button> <img src="images/GSC/view_icon.png" width="30px"></td>
                                        </tr>
                                        <tr>
                                            <td>Unidad 1</td>
                                            <td>R0002</td>
                                            <td>Canino</td>
                                            <td>Negro</td>
                                            <td><button type="button" class="btn btn-primary">Ver</button> <img src="images/GSC/view_icon.png" width="30px"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td width="40%">
                                <br>
                                <table class="table table-bordered table-sm m-0">
                                    <thead class="">
                                        <tr>
                                            <th>Nombres y Apellidos</th>
                                            <th>Dirección</th>
                                            <th>Teléfono</th>
                                            <th>Fecha Nacimiento</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>                            
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <br>
                                <button type="button" class="btn btn-primary">Grabar Programación</button>
                                <button type="button" class="btn btn-default">Aprobar Progamación</button>
                                <button type="button" class="btn btn-default">Anular Progamación</button>
                            </td>
                        </tr>                        
                    </table>
                </div>
            </div>

        </div>

        <%@include file="../footer.jsp" %>

    </body>
</html>
